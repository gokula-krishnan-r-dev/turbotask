import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/todo_actions_usecase.dart';
import '../../data/models/todo_action_request_models.dart';
import '../../../../core/services/request_tracker_service.dart';
import 'todo_actions_event.dart';
import 'todo_actions_state.dart';

@injectable
class TodoActionsBloc extends Bloc<TodoActionsEvent, TodoActionsState> {
  final TodoActionsUseCase _todoActionsUseCase;
  final RequestTrackerService _requestTracker = RequestTrackerService();

  TodoActionsBloc(this._todoActionsUseCase) : super(const TodoActionsState()) {
    on<CompleteTodoEvent>(_onCompleteTodo);
    on<IncompleteTodoEvent>(_onIncompleteTodo);
    on<PinTodoEvent>(_onPinTodo);
    on<StartBreakEvent>(_onStartBreak);
    on<StopBreakEvent>(_onStopBreak);
    on<PauseTodoEvent>(_onPauseTodo);
    on<SkipTodoEvent>(_onSkipTodo);
    on<CheckBreakStatusEvent>(_onCheckBreakStatus);
    on<ResetActionsEvent>(_onResetActions);
  }

  Future<void> _onCompleteTodo(
    CompleteTodoEvent event,
    Emitter<TodoActionsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, actionType: TodoActionType.complete));

    try {
      final updatedTodo = await _todoActionsUseCase.markTodoComplete(
        event.todoId,
      );
      emit(
        state.copyWith(
          isLoading: false,
          updatedTodo: updatedTodo,
          isSuccess: true,
          actionType: TodoActionType.complete,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
          isSuccess: false,
          actionType: TodoActionType.complete,
        ),
      );
    }
  }

  Future<void> _onIncompleteTodo(
    IncompleteTodoEvent event,
    Emitter<TodoActionsState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, actionType: TodoActionType.incomplete),
    );

    try {
      final updatedTodo = await _todoActionsUseCase.markTodoIncomplete(
        event.todoId,
      );
      emit(
        state.copyWith(
          isLoading: false,
          updatedTodo: updatedTodo,
          isSuccess: true,
          actionType: TodoActionType.incomplete,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
          isSuccess: false,
          actionType: TodoActionType.incomplete,
        ),
      );
    }
  }

  Future<void> _onPinTodo(
    PinTodoEvent event,
    Emitter<TodoActionsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, actionType: TodoActionType.pin));

    try {
      final updatedTodo = await _todoActionsUseCase.pinTodo(event.todoId);
      emit(
        state.copyWith(
          isLoading: false,
          updatedTodo: updatedTodo,
          isSuccess: true,
          actionType: TodoActionType.pin,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
          isSuccess: false,
          actionType: TodoActionType.pin,
        ),
      );
    }
  }

  Future<void> _onStartBreak(
    StartBreakEvent event,
    Emitter<TodoActionsState> emit,
  ) async {
    // Generate unique request key
    final requestKey = _requestTracker.generateBreakStartKey(
      todoId: event.todoId,
      projectId: event.projectId ?? '',
      breakType: event.breakType.toString(),
    );

    // Try to add request - returns false if duplicate
    if (!_requestTracker.tryAddRequest(requestKey)) {
      print(
        'TodoActionsBloc: Duplicate request blocked for todoId: ${event.todoId}',
      );
      return;
    }

    emit(state.copyWith(isLoading: true, actionType: TodoActionType.break_));

    try {
      await _todoActionsUseCase.startBreak(
        todoId: event.todoId,
        projectId: event.projectId,
        breakType: event.breakType,
        reason: event.reason,
        estimatedDuration: event.estimatedDuration,
      );
      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          actionType: TodoActionType.break_,
          isOnBreak: true,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
          isSuccess: false,
          actionType: TodoActionType.break_,
        ),
      );
    } finally {
      // Always remove the request when done (success or failure)
      _requestTracker.removeRequest(requestKey);
    }
  }

  Future<void> _onStopBreak(
    StopBreakEvent event,
    Emitter<TodoActionsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _todoActionsUseCase.stopBreak(event.todoId);
      emit(state.copyWith(isLoading: false, isSuccess: true, isOnBreak: false));
    } catch (e) {
      emit(
        state.copyWith(isLoading: false, error: e.toString(), isSuccess: false),
      );
    }
  }

  Future<void> _onPauseTodo(
    PauseTodoEvent event,
    Emitter<TodoActionsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, actionType: TodoActionType.pause));

    try {
      await _todoActionsUseCase.pauseTodo(event.todoId);
      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
          actionType: TodoActionType.pause,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
          isSuccess: false,
          actionType: TodoActionType.pause,
        ),
      );
    }
  }

  Future<void> _onSkipTodo(
    SkipTodoEvent event,
    Emitter<TodoActionsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, actionType: TodoActionType.skip));

    try {
      final updatedTodo = await _todoActionsUseCase.skipTodo(event.todoId);
      emit(
        state.copyWith(
          isLoading: false,
          updatedTodo: updatedTodo,
          isSuccess: true,
          actionType: TodoActionType.skip,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          error: e.toString(),
          isSuccess: false,
          actionType: TodoActionType.skip,
        ),
      );
    }
  }

  Future<void> _onCheckBreakStatus(
    CheckBreakStatusEvent event,
    Emitter<TodoActionsState> emit,
  ) async {
    try {
      final isOnBreak = await _todoActionsUseCase.getActiveBreakStatus(
        event.todoId,
      );
      emit(state.copyWith(isOnBreak: isOnBreak));
    } catch (e) {
      // Silently fail for break status check
    }
  }

  void _onResetActions(
    ResetActionsEvent event,
    Emitter<TodoActionsState> emit,
  ) {
    emit(const TodoActionsState());
  }
}

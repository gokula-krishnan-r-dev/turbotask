import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/kanban_board.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/get_kanban_board_usecase.dart';
import '../../domain/usecases/create_kanban_todo_usecase.dart';
import '../../domain/usecases/move_todo_usecase.dart';
import '../../data/models/kanban_request_models.dart';

part 'kanban_board_event.dart';
part 'kanban_board_state.dart';

@injectable
class KanbanBoardBloc extends Bloc<KanbanBoardEvent, KanbanBoardState> {
  final GetKanbanBoardUseCase _getKanbanBoardUseCase;
  final CreateKanbanTodoUseCase _createKanbanTodoUseCase;
  final MoveTodoUseCase _moveTodoUseCase;
  final ReorderTodosUseCase _reorderTodosUseCase;

  KanbanBoardBloc(
    this._getKanbanBoardUseCase,
    this._createKanbanTodoUseCase,
    this._moveTodoUseCase,
    this._reorderTodosUseCase,
  ) : super(const KanbanBoardInitial()) {
    on<LoadKanbanBoard>(_onLoadKanbanBoard);
    on<CreateTodoInColumn>(_onCreateTodoInColumn);
    on<MoveTodoToColumn>(_onMoveTodoToColumn);
    on<ReorderTodosInColumn>(_onReorderTodosInColumn);
    on<RefreshKanbanBoard>(_onRefreshKanbanBoard);
  }

  Future<void> _onLoadKanbanBoard(
    LoadKanbanBoard event,
    Emitter<KanbanBoardState> emit,
  ) async {
    emit(const KanbanBoardLoading());

    try {
      final kanbanBoard = await _getKanbanBoardUseCase(event.projectId);
      emit(KanbanBoardLoaded(kanbanBoard));
    } catch (e) {
      emit(KanbanBoardError(e.toString()));
    }
  }

  Future<void> _onCreateTodoInColumn(
    CreateTodoInColumn event,
    Emitter<KanbanBoardState> emit,
  ) async {
    if (state is! KanbanBoardLoaded) return;

    final currentState = state as KanbanBoardLoaded;
    emit(KanbanBoardLoading(previousBoard: currentState.kanbanBoard));

    try {
      final request = CreateTodoRequest(
        projectId: event.projectId,
        taskName: event.taskName,
        taskDescription: event.taskDescription,
        status: event.status,
        priority: event.priority,
        tags: event.tags,
      );

      await _createKanbanTodoUseCase(request);

      // Refresh the board to get updated data
      final updatedBoard = await _getKanbanBoardUseCase(event.projectId);
      emit(KanbanBoardLoaded(updatedBoard));
    } catch (e) {
      emit(KanbanBoardError(e.toString()));
      // Restore previous state on error
      emit(KanbanBoardLoaded(currentState.kanbanBoard));
    }
  }

  Future<void> _onMoveTodoToColumn(
    MoveTodoToColumn event,
    Emitter<KanbanBoardState> emit,
  ) async {
    if (state is! KanbanBoardLoaded) return;

    final currentState = state as KanbanBoardLoaded;

    try {
      final request = MoveTodoRequest(
        todoId: event.todoId,
        newStatus: event.newStatus,
        position: event.position,
      );

      await _moveTodoUseCase(request);

      // Refresh the board to get updated data
      final updatedBoard = await _getKanbanBoardUseCase(event.projectId);
      emit(KanbanBoardLoaded(updatedBoard));
    } catch (e) {
      emit(KanbanBoardError(e.toString()));
      // Restore previous state on error
      emit(KanbanBoardLoaded(currentState.kanbanBoard));
    }
  }

  Future<void> _onReorderTodosInColumn(
    ReorderTodosInColumn event,
    Emitter<KanbanBoardState> emit,
  ) async {
    if (state is! KanbanBoardLoaded) return;

    final currentState = state as KanbanBoardLoaded;

    try {
      final request = ReorderTodosRequest(
        todoIds: event.todoIds,
        status: event.status,
      );

      await _reorderTodosUseCase(request);

      // Refresh the board to get updated data
      final updatedBoard = await _getKanbanBoardUseCase(event.projectId);
      emit(KanbanBoardLoaded(updatedBoard));
    } catch (e) {
      emit(KanbanBoardError(e.toString()));
      // Restore previous state on error
      emit(KanbanBoardLoaded(currentState.kanbanBoard));
    }
  }

  Future<void> _onRefreshKanbanBoard(
    RefreshKanbanBoard event,
    Emitter<KanbanBoardState> emit,
  ) async {
    if (state is KanbanBoardLoaded) {
      final currentState = state as KanbanBoardLoaded;
      emit(KanbanBoardLoading(previousBoard: currentState.kanbanBoard));
    }

    try {
      final kanbanBoard = await _getKanbanBoardUseCase(event.projectId);
      emit(KanbanBoardLoaded(kanbanBoard));
    } catch (e) {
      emit(KanbanBoardError(e.toString()));
    }
  }
}

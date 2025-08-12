import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/subtask_request_models.dart';
import '../../domain/entities/subtask.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/create_subtask_usecase.dart';
import '../../domain/usecases/delete_subtask_usecase.dart';
import '../../domain/usecases/get_subtasks_usecase.dart';
import '../../domain/usecases/update_subtask_usecase.dart';

part 'subtask_event.dart';
part 'subtask_state.dart';

@injectable
class SubtaskBloc extends Bloc<SubtaskEvent, SubtaskState> {
  final GetSubtasksUseCase _getSubtasksUseCase;
  final CreateSubtaskUseCase _createSubtaskUseCase;
  final UpdateSubtaskUseCase _updateSubtaskUseCase;
  final DeleteSubtaskUseCase _deleteSubtaskUseCase;

  SubtaskBloc(
    this._getSubtasksUseCase,
    this._createSubtaskUseCase,
    this._updateSubtaskUseCase,
    this._deleteSubtaskUseCase,
  ) : super(const SubtaskInitial()) {
    on<LoadSubtasks>(_onLoadSubtasks);
    on<CreateSubtask>(_onCreateSubtask);
    on<UpdateSubtask>(_onUpdateSubtask);
    on<ToggleSubtaskStatus>(_onToggleSubtaskStatus);
    on<DeleteSubtask>(_onDeleteSubtask);
    on<RefreshSubtasks>(_onRefreshSubtasks);
  }

  Future<void> _onLoadSubtasks(
    LoadSubtasks event,
    Emitter<SubtaskState> emit,
  ) async {
    emit(const SubtaskLoading());
    try {
      final subtasks = await _getSubtasksUseCase(event.todoId);
      emit(SubtaskLoaded(subtasks: subtasks, todoId: event.todoId));
    } catch (e) {
      print('SubtaskBloc Error: $e');
      emit(SubtaskError(e.toString()));
    }
  }

  Future<void> _onCreateSubtask(
    CreateSubtask event,
    Emitter<SubtaskState> emit,
  ) async {
    if (state is! SubtaskLoaded) return;

    final currentState = state as SubtaskLoaded;
    emit(
      SubtaskLoading(
        previousSubtasks: currentState.subtasks,
        todoId: currentState.todoId,
      ),
    );

    try {
      final request = CreateSubtaskRequest(
        todoId: event.todoId,
        name: event.name,
        description: event.description,
        status: event.status ?? TaskStatus.notStarted,
        priority: event.priority ?? Priority.medium,
      );

      await _createSubtaskUseCase(request);

      // Refresh subtasks to get updated data
      final updatedSubtasks = await _getSubtasksUseCase(event.todoId);
      emit(SubtaskLoaded(subtasks: updatedSubtasks, todoId: event.todoId));
    } catch (e) {
      print('SubtaskBloc Error: $e');
      emit(SubtaskError(e.toString()));

      // Restore previous state on error
      if (currentState.subtasks.isNotEmpty) {
        emit(
          SubtaskLoaded(
            subtasks: currentState.subtasks,
            todoId: currentState.todoId,
          ),
        );
      }
    }
  }

  Future<void> _onUpdateSubtask(
    UpdateSubtask event,
    Emitter<SubtaskState> emit,
  ) async {
    if (state is! SubtaskLoaded) return;

    final currentState = state as SubtaskLoaded;

    // Optimistic update
    final updatedSubtasks = currentState.subtasks.map((subtask) {
      if (subtask.id == event.subtaskId) {
        return subtask.copyWith(
          name: event.name ?? subtask.name,
          description: event.description ?? subtask.description,
          status: event.status ?? subtask.status,
          priority: event.priority ?? subtask.priority,
        );
      }
      return subtask;
    }).toList();

    emit(SubtaskLoaded(subtasks: updatedSubtasks, todoId: currentState.todoId));

    try {
      final request = UpdateSubtaskRequest(
        name: event.name,
        description: event.description,
        status: event.status,
        priority: event.priority,
      );

      await _updateSubtaskUseCase(event.subtaskId, request);

      // Refresh to ensure consistency
      final refreshedSubtasks = await _getSubtasksUseCase(currentState.todoId);
      emit(
        SubtaskLoaded(subtasks: refreshedSubtasks, todoId: currentState.todoId),
      );
    } catch (e) {
      print('SubtaskBloc Error: $e');
      emit(SubtaskError(e.toString()));

      // Revert UI on error
      emit(
        SubtaskLoaded(
          subtasks: currentState.subtasks,
          todoId: currentState.todoId,
        ),
      );
    }
  }

  Future<void> _onToggleSubtaskStatus(
    ToggleSubtaskStatus event,
    Emitter<SubtaskState> emit,
  ) async {
    if (state is! SubtaskLoaded) return;

    final currentState = state as SubtaskLoaded;
    final subtask = currentState.subtasks.firstWhere(
      (s) => s.id == event.subtaskId,
      orElse: () => throw Exception('Subtask not found'),
    );

    final newStatus = subtask.isCompleted
        ? TaskStatus.notStarted
        : TaskStatus.completed;

    // Optimistic update
    final updatedSubtasks = currentState.subtasks.map((s) {
      if (s.id == event.subtaskId) {
        return s.copyWith(
          status: newStatus,
          completedAt: newStatus == TaskStatus.completed
              ? DateTime.now()
              : null,
        );
      }
      return s;
    }).toList();

    emit(SubtaskLoaded(subtasks: updatedSubtasks, todoId: currentState.todoId));

    try {
      final request = UpdateSubtaskRequest(status: newStatus);

      await _updateSubtaskUseCase(event.subtaskId, request);

      // Refresh to ensure consistency
      final refreshedSubtasks = await _getSubtasksUseCase(currentState.todoId);
      emit(
        SubtaskLoaded(subtasks: refreshedSubtasks, todoId: currentState.todoId),
      );
    } catch (e) {
      print('SubtaskBloc Error: $e');
      emit(SubtaskError(e.toString()));

      // Revert UI on error
      emit(
        SubtaskLoaded(
          subtasks: currentState.subtasks,
          todoId: currentState.todoId,
        ),
      );
    }
  }

  Future<void> _onDeleteSubtask(
    DeleteSubtask event,
    Emitter<SubtaskState> emit,
  ) async {
    if (state is! SubtaskLoaded) return;

    final currentState = state as SubtaskLoaded;

    // Optimistic update
    final updatedSubtasks = currentState.subtasks
        .where((subtask) => subtask.id != event.subtaskId)
        .toList();

    emit(SubtaskLoaded(subtasks: updatedSubtasks, todoId: currentState.todoId));

    try {
      await _deleteSubtaskUseCase(event.subtaskId);

      // Refresh to ensure consistency
      final refreshedSubtasks = await _getSubtasksUseCase(currentState.todoId);
      emit(
        SubtaskLoaded(subtasks: refreshedSubtasks, todoId: currentState.todoId),
      );
    } catch (e) {
      print('SubtaskBloc Error: $e');
      emit(SubtaskError(e.toString()));

      // Revert UI on error
      emit(
        SubtaskLoaded(
          subtasks: currentState.subtasks,
          todoId: currentState.todoId,
        ),
      );
    }
  }

  Future<void> _onRefreshSubtasks(
    RefreshSubtasks event,
    Emitter<SubtaskState> emit,
  ) async {
    if (state is! SubtaskLoaded) return;

    final currentState = state as SubtaskLoaded;
    emit(
      SubtaskLoading(
        previousSubtasks: currentState.subtasks,
        todoId: currentState.todoId,
      ),
    );

    try {
      final subtasks = await _getSubtasksUseCase(event.todoId);
      emit(SubtaskLoaded(subtasks: subtasks, todoId: event.todoId));
    } catch (e) {
      print('SubtaskBloc Error: $e');
      emit(SubtaskError(e.toString()));

      // Restore previous state if refresh fails
      if (currentState.subtasks.isNotEmpty) {
        emit(
          SubtaskLoaded(
            subtasks: currentState.subtasks,
            todoId: currentState.todoId,
          ),
        );
      }
    }
  }
}

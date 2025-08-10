import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/todo.dart';
import '../../domain/entities/create_todo_request.dart';
import '../../domain/entities/create_subtask_request.dart';

part 'todos_event.freezed.dart';

/// Events for todos BLoC
@freezed
class TodosEvent with _$TodosEvent {
  /// Load todos for a specific project
  const factory TodosEvent.loadProjectTodos(String projectId) =
      _LoadProjectTodos;

  /// Refresh todos for the current project
  const factory TodosEvent.refreshTodos() = _RefreshTodos;

  /// Create a new todo
  const factory TodosEvent.createTodo(CreateTodoRequest request) = _CreateTodo;

  /// Update todo status (for drag & drop between columns)
  const factory TodosEvent.updateTodoStatus(
    String todoId,
    TodoStatus newStatus,
  ) = _UpdateTodoStatus;

  /// Update todo sort order (for reordering within same column)
  const factory TodosEvent.updateTodoSortOrder(
    String todoId,
    int newSortOrder,
  ) = _UpdateTodoSortOrder;

  /// Update both status and sort order (for cross-column moves)
  const factory TodosEvent.updateTodoStatusAndSortOrder(
    String todoId,
    TodoStatus newStatus,
    int newSortOrder,
  ) = _UpdateTodoStatusAndSortOrder;

  /// Toggle todo completion
  const factory TodosEvent.toggleTodoCompletion(String todoId) =
      _ToggleTodoCompletion;

  /// Pin/unpin a todo
  const factory TodosEvent.toggleTodoPin(String todoId) = _ToggleTodoPin;

  /// Update todo details
  const factory TodosEvent.updateTodo(
    String todoId,
    Map<String, dynamic> updates,
  ) = _UpdateTodo;

  /// Delete a todo
  const factory TodosEvent.deleteTodo(String todoId) = _DeleteTodo;

  /// Search todos
  const factory TodosEvent.searchTodos(String query) = _SearchTodos;

  /// Clear search
  const factory TodosEvent.clearSearch() = _ClearSearch;

  /// Load subtasks for a todo
  const factory TodosEvent.loadSubtasks(String todoId) = _LoadSubtasks;

  /// Create a new subtask
  const factory TodosEvent.createSubtask(
    String todoId,
    CreateSubtaskRequest request,
  ) = _CreateSubtask;

  /// Update subtask status
  const factory TodosEvent.updateSubtaskStatus(
    String subtaskId,
    TodoStatus newStatus,
  ) = _UpdateSubtaskStatus;

  /// Toggle subtask completion
  const factory TodosEvent.toggleSubtaskCompletion(String subtaskId) =
      _ToggleSubtaskCompletion;

  /// Delete a subtask
  const factory TodosEvent.deleteSubtask(String subtaskId) = _DeleteSubtask;

  /// Reorder subtasks
  const factory TodosEvent.reorderSubtasks(
    String todoId,
    List<String> subtaskIds,
  ) = _ReorderSubtasks;
}

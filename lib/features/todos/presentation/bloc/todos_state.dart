import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/todo.dart';
import '../../domain/entities/subtask.dart';

part 'todos_state.freezed.dart';

/// Status enum for todos operations
enum TodosStatus {
  initial,
  loading,
  loaded,
  creating,
  created,
  updating,
  error,
}

/// State for todos management
@freezed
class TodosState with _$TodosState {
  const factory TodosState({
    @Default(TodosStatus.initial) TodosStatus status,
    String? currentProjectId,
    @Default({}) Map<TodoStatus, List<Todo>> todosByStatus,
    @Default({}) Map<String, List<Subtask>> subtasksByTodoId,
    @Default([]) List<Todo> searchResults,
    String? searchQuery,
    String? errorMessage,
    @Default(false) bool isRefreshing,
    @Default(false) bool isCreatingTodo,
    @Default(false) bool isCreatingSubtask,
    @Default({}) Map<String, bool> isLoadingSubtasks,
    @Default({}) Map<String, bool> isUpdatingTodos,
    @Default({}) Map<String, bool> isUpdatingSubtasks,
  }) = _TodosState;
}

/// Extension for TodosState convenience methods
extension TodosStateX on TodosState {
  bool get isLoading => status == TodosStatus.loading;
  bool get isLoaded => status == TodosStatus.loaded;
  bool get hasError => status == TodosStatus.error;
  bool get isEmpty =>
      todosByStatus.values.every((todos) => todos.isEmpty) &&
      status == TodosStatus.loaded;
  bool get hasTodos => todosByStatus.values.any((todos) => todos.isNotEmpty);
  bool get isSearching => searchQuery != null && searchQuery!.isNotEmpty;

  /// Get all todos as a flat list
  List<Todo> get allTodos {
    return todosByStatus.values.expand((todos) => todos).toList();
  }

  /// Get todos for a specific status
  List<Todo> getTodosForStatus(TodoStatus status) {
    return todosByStatus[status] ?? [];
  }

  /// Get subtasks for a specific todo
  List<Subtask> getSubtasksForTodo(String todoId) {
    return subtasksByTodoId[todoId] ?? [];
  }

  /// Check if subtasks are loading for a todo
  bool isLoadingSubtasksForTodo(String todoId) {
    return isLoadingSubtasks[todoId] ?? false;
  }

  /// Check if a todo is being updated
  bool isTodoUpdating(String todoId) {
    return isUpdatingTodos[todoId] ?? false;
  }

  /// Check if a subtask is being updated
  bool isSubtaskUpdating(String subtaskId) {
    return isUpdatingSubtasks[subtaskId] ?? false;
  }

  /// Get list of todo IDs that are currently being updated
  List<String> get updatingTodoIds {
    return isUpdatingTodos.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();
  }

  /// Get total todo count
  int get totalTodos => allTodos.length;

  /// Get completed todo count
  int get completedTodos => getTodosForStatus(TodoStatus.completed).length;

  /// Get in-progress todo count
  int get inProgressTodos => getTodosForStatus(TodoStatus.inProgress).length;

  /// Get backlog todo count
  int get backlogTodos => getTodosForStatus(TodoStatus.backlog).length;

  /// Get completion percentage
  double get completionPercentage {
    if (totalTodos == 0) return 0.0;
    return (completedTodos / totalTodos) * 100;
  }

  /// Get overdue todos
  List<Todo> get overdueTodos {
    return allTodos.where((todo) => todo.isOverdue).toList();
  }

  /// Get pinned todos
  List<Todo> get pinnedTodos {
    return allTodos.where((todo) => todo.isPinned).toList();
  }

  /// Get high priority todos
  List<Todo> get highPriorityTodos {
    return allTodos
        .where(
          (todo) =>
              todo.priority == TodoPriority.high ||
              todo.priority == TodoPriority.urgent,
        )
        .toList();
  }
}

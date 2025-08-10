import '../entities/todo.dart';
import '../entities/subtask.dart';
import '../entities/create_todo_request.dart';
import '../entities/create_subtask_request.dart';

/// Abstract repository for todo operations.
/// Defines the contract for todo data access.
abstract class TodoRepository {
  /// Create a new todo
  Future<Todo> createTodo(CreateTodoRequest request);

  /// Get all todos for the current user
  Future<List<Todo>> getUserTodos({
    int limit = 20,
    int offset = 0,
    bool includeRelated = true,
    String sortBy = 'created_at',
    String sortOrder = 'desc',
  });

  /// Get todos for a specific project
  Future<List<Todo>> getProjectTodos(
    String projectId, {
    bool includeCompleted = false,
  });

  /// Get a todo by ID
  Future<Todo> getTodoById(String todoId, {bool includeRelated = true});

  /// Update a todo
  Future<Todo> updateTodo(String todoId, Map<String, dynamic> updates);

  /// Search todos
  Future<List<Todo>> searchTodos({
    required String query,
    int limit = 10,
    int offset = 0,
  });

  /// Mark todo as complete
  Future<Todo> markTodoComplete(String todoId);

  /// Mark todo as incomplete
  Future<Todo> markTodoIncomplete(String todoId);

  /// Pin/unpin a todo
  Future<Todo> pinTodo(String todoId, bool pinned);

  /// Get overdue todos
  Future<List<Todo>> getOverdueTodos();

  /// Delete a todo
  Future<void> deleteTodo(String todoId);

  // Subtask operations
  /// Create a new subtask
  Future<Subtask> createSubtask(String todoId, CreateSubtaskRequest request);

  /// Get subtasks for a todo
  Future<List<Subtask>> getSubtasks(
    String todoId, {
    bool includeArchived = false,
  });

  /// Update a subtask
  Future<Subtask> updateSubtask(String subtaskId, Map<String, dynamic> updates);

  /// Reorder subtasks
  Future<void> reorderSubtasks(String todoId, List<String> subtaskIds);

  /// Delete a subtask
  Future<void> deleteSubtask(String subtaskId);
}

import 'package:injectable/injectable.dart';

import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

/// Use case for updating todo status.
/// Handles status transitions and business logic.
@injectable
class UpdateTodoStatusUseCase {
  const UpdateTodoStatusUseCase(this._todoRepository);

  final TodoRepository _todoRepository;

  /// Execute updating todo status
  /// Returns the updated todo entity
  Future<Todo> call(String todoId, TodoStatus newStatus) async {
    // Validate todo ID
    if (todoId.trim().isEmpty) {
      throw ArgumentError('Todo ID cannot be empty');
    }

    // Get current todo to validate status transition
    final currentTodo = await _todoRepository.getTodoById(todoId);

    // Validate status transition
    _validateStatusTransition(currentTodo.status, newStatus);

    // Prepare update data
    final Map<String, dynamic> updates = {'status': newStatus.apiValue};

    // Add completion timestamp if marking as completed
    if (newStatus == TodoStatus.completed) {
      updates['completed_at'] = DateTime.now().toIso8601String();
    } else if (currentTodo.status == TodoStatus.completed &&
        newStatus != TodoStatus.completed) {
      // Remove completion timestamp if moving away from completed
      updates['completed_at'] = null;
    }

    return await _todoRepository.updateTodo(todoId, updates);
  }

  /// Toggle todo completion status
  Future<Todo> toggleCompletion(String todoId) async {
    final currentTodo = await _todoRepository.getTodoById(todoId);

    if (currentTodo.isCompleted) {
      return call(todoId, TodoStatus.todo);
    } else {
      return call(todoId, TodoStatus.completed);
    }
  }

  void _validateStatusTransition(TodoStatus from, TodoStatus to) {
    // Define valid transitions
    const validTransitions = {
      TodoStatus.backlog: [TodoStatus.todo, TodoStatus.cancelled],
      TodoStatus.todo: [
        TodoStatus.inProgress,
        TodoStatus.backlog,
        TodoStatus.cancelled,
      ],
      TodoStatus.inProgress: [
        TodoStatus.review,
        TodoStatus.completed,
        TodoStatus.todo,
        TodoStatus.cancelled,
      ],
      TodoStatus.review: [
        TodoStatus.completed,
        TodoStatus.inProgress,
        TodoStatus.cancelled,
      ],
      TodoStatus.completed: [
        TodoStatus.todo,
        TodoStatus.inProgress,
      ], // Allow reopening
      TodoStatus.cancelled: [
        TodoStatus.backlog,
        TodoStatus.todo,
      ], // Allow reactivating
    };

    if (!validTransitions[from]!.contains(to)) {
      throw ArgumentError(
        'Invalid status transition from ${from.displayName} to ${to.displayName}',
      );
    }
  }
}

import 'package:injectable/injectable.dart';

import '../entities/todo.dart';
import '../repositories/todo_repository.dart';

/// Use case for getting todos for a specific project.
/// Organizes todos by status for kanban board display.
@injectable
class GetProjectTodosUseCase {
  const GetProjectTodosUseCase(this._todoRepository);

  final TodoRepository _todoRepository;

  /// Execute getting project todos
  /// Returns organized todos by status
  Future<Map<TodoStatus, List<Todo>>> call(
    String projectId, {
    bool includeCompleted = true,
  }) async {
    final todos = await _todoRepository.getProjectTodos(
      projectId,
      includeCompleted: includeCompleted,
    );

    // Organize todos by status for kanban display
    final Map<TodoStatus, List<Todo>> organizedTodos = {
      TodoStatus.backlog: [],
      TodoStatus.todo: [],
      TodoStatus.inProgress: [],
      TodoStatus.review: [],
      TodoStatus.completed: [],
    };

    for (final todo in todos) {
      if (organizedTodos.containsKey(todo.status)) {
        organizedTodos[todo.status]!.add(todo);
      }
    }

    // Sort todos within each status by priority and created date
    for (final statusTodos in organizedTodos.values) {
      statusTodos.sort((a, b) {
        // First sort by priority (urgent > high > medium > low)
        final priorityComparison = _comparePriority(a.priority, b.priority);
        if (priorityComparison != 0) {
          return priorityComparison;
        }
        // Then sort by creation date (newest first)
        return b.createdAt.compareTo(a.createdAt);
      });
    }

    return organizedTodos;
  }

  int _comparePriority(TodoPriority a, TodoPriority b) {
    const priorityOrder = {
      TodoPriority.urgent: 0,
      TodoPriority.high: 1,
      TodoPriority.medium: 2,
      TodoPriority.low: 3,
    };

    return priorityOrder[a]!.compareTo(priorityOrder[b]!);
  }
}

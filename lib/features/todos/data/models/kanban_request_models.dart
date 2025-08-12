import 'package:equatable/equatable.dart';
import '../../domain/entities/todo.dart';

/// Request model for creating a new todo
class CreateTodoRequest extends Equatable {
  final String projectId;
  final String taskName;
  final String? taskDescription;
  final TaskStatus status;
  final String? priority;
  final String? dueDate;
  final List<String>? tags;

  const CreateTodoRequest({
    required this.projectId,
    required this.taskName,
    this.taskDescription,
    required this.status,
    this.priority,
    this.dueDate,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'task_name': taskName,
      'task_description': taskDescription,
      'status': status.value,
      'priority': priority,
      'due_date': dueDate,
      'tags': tags,
    };
  }

  @override
  List<Object?> get props => [
    projectId,
    taskName,
    taskDescription,
    status,
    priority,
    dueDate,
    tags,
  ];
}

/// Request model for moving a todo to a different column
class MoveTodoRequest extends Equatable {
  final String todoId;
  final TaskStatus newStatus;
  final int? position;

  const MoveTodoRequest({
    required this.todoId,
    required this.newStatus,
    this.position,
  });

  Map<String, dynamic> toJson() {
    return {
      'todo_id': todoId,
      'new_status': newStatus.value,
      if (position != null) 'position': position,
    };
  }

  @override
  List<Object?> get props => [todoId, newStatus, position];
}

/// Request model for reordering todos within a column
class ReorderTodosRequest extends Equatable {
  final List<String> todoIds;
  final TaskStatus status;

  const ReorderTodosRequest({required this.todoIds, required this.status});

  Map<String, dynamic> toJson() {
    return {'todo_ids': todoIds, 'status': status.value};
  }

  @override
  List<Object?> get props => [todoIds, status];
}

/// Request model for bulk moving todos
class BulkMoveTodosRequest extends Equatable {
  final List<MoveTodoRequest> moves;

  const BulkMoveTodosRequest({required this.moves});

  Map<String, dynamic> toJson() {
    return {'moves': moves.map((move) => move.toJson()).toList()};
  }

  @override
  List<Object?> get props => [moves];
}

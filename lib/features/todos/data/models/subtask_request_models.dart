import 'package:equatable/equatable.dart';
import '../../domain/entities/todo.dart';

/// Request model for creating a new subtask
class CreateSubtaskRequest extends Equatable {
  const CreateSubtaskRequest({
    required this.todoId,
    required this.name,
    this.description,
    this.status = TaskStatus.notStarted,
    this.priority = Priority.medium,
    this.estimatedTime,
    this.dueDate,
    this.sortOrder = 0,
  });

  final String todoId;
  final String name;
  final String? description;
  final TaskStatus status;
  final Priority priority;
  final int? estimatedTime;
  final DateTime? dueDate;
  final int sortOrder;

  Map<String, dynamic> toJson() {
    return {
      'todo_id': todoId,
      'name': name,
      'description': description,
      'status': status.value,
      'priority': priority.value,
      'estimated_time': estimatedTime,
      'due_date': dueDate?.toIso8601String(),
      'sort_order': sortOrder,
    };
  }

  @override
  List<Object?> get props => [
    todoId,
    name,
    description,
    status,
    priority,
    estimatedTime,
    dueDate,
    sortOrder,
  ];
}

/// Request model for updating a subtask
class UpdateSubtaskRequest extends Equatable {
  const UpdateSubtaskRequest({
    this.name,
    this.description,
    this.status,
    this.priority,
    this.estimatedTime,
    this.dueDate,
    this.sortOrder,
  });

  final String? name;
  final String? description;
  final TaskStatus? status;
  final Priority? priority;
  final int? estimatedTime;
  final DateTime? dueDate;
  final int? sortOrder;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (name != null) json['name'] = name;
    if (description != null) json['description'] = description;
    if (status != null) json['status'] = status!.value;
    if (priority != null) json['priority'] = priority!.value;
    if (estimatedTime != null) json['estimated_time'] = estimatedTime;
    if (dueDate != null) json['due_date'] = dueDate!.toIso8601String();
    if (sortOrder != null) json['sort_order'] = sortOrder;

    return json;
  }

  @override
  List<Object?> get props => [
    name,
    description,
    status,
    priority,
    estimatedTime,
    dueDate,
    sortOrder,
  ];
}

/// Request model for reordering subtasks
class ReorderSubtasksRequest extends Equatable {
  const ReorderSubtasksRequest({
    required this.todoId,
    required this.subtaskIds,
  });

  final String todoId;
  final List<String> subtaskIds;

  Map<String, dynamic> toJson() {
    return {'todo_id': todoId, 'subtask_ids': subtaskIds};
  }

  @override
  List<Object?> get props => [todoId, subtaskIds];
}

/// Quick create subtask request for inline creation
class QuickCreateSubtaskRequest extends Equatable {
  const QuickCreateSubtaskRequest({required this.todoId, required this.name});

  final String todoId;
  final String name;

  Map<String, dynamic> toJson() {
    return {
      'todo_id': todoId,
      'name': name,
      'status': TaskStatus.notStarted.value,
      'priority': Priority.medium.value,
      'sort_order': 0,
    };
  }

  @override
  List<Object?> get props => [todoId, name];
}

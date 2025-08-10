import 'package:equatable/equatable.dart';
import 'todo.dart';

/// Subtask entity representing a sub-task within a todo.
/// This is the core domain model for subtask data.
class Subtask extends Equatable {
  const Subtask({
    required this.id,
    required this.todoId,
    required this.name,
    required this.description,
    required this.status,
    required this.priority,
    this.estimatedTime,
    this.actualTime,
    this.sortOrder = 0,
    this.isArchived = false,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
    this.assignedUserId,
  });

  final String id;
  final String todoId;
  final String name;
  final String description;
  final TodoStatus status;
  final TodoPriority priority;
  final int? estimatedTime; // in minutes
  final int? actualTime; // in minutes
  final int sortOrder;
  final bool isArchived;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? completedAt;
  final String? assignedUserId;

  /// Check if subtask is completed
  bool get isCompleted => status == TodoStatus.completed;

  /// Get estimated time in hours
  double get estimatedTimeInHours {
    if (estimatedTime == null) return 0.0;
    return estimatedTime! / 60.0;
  }

  /// Get actual time in hours
  double get actualTimeInHours {
    if (actualTime == null) return 0.0;
    return actualTime! / 60.0;
  }

  /// Create a copy of subtask with updated fields
  Subtask copyWith({
    String? id,
    String? todoId,
    String? name,
    String? description,
    TodoStatus? status,
    TodoPriority? priority,
    int? estimatedTime,
    int? actualTime,
    int? sortOrder,
    bool? isArchived,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    String? assignedUserId,
  }) {
    return Subtask(
      id: id ?? this.id,
      todoId: todoId ?? this.todoId,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      actualTime: actualTime ?? this.actualTime,
      sortOrder: sortOrder ?? this.sortOrder,
      isArchived: isArchived ?? this.isArchived,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
      assignedUserId: assignedUserId ?? this.assignedUserId,
    );
  }

  @override
  List<Object?> get props => [
    id,
    todoId,
    name,
    description,
    status,
    priority,
    estimatedTime,
    actualTime,
    sortOrder,
    isArchived,
    createdAt,
    updatedAt,
    completedAt,
    assignedUserId,
  ];

  @override
  String toString() {
    return 'Subtask(id: $id, name: $name, status: $status, priority: $priority)';
  }
}

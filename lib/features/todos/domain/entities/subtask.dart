import 'package:equatable/equatable.dart';
import 'todo.dart';

/// Subtask entity representing a sub-item of a todo
class Subtask extends Equatable {
  const Subtask({
    required this.id,
    required this.todoId,
    required this.name,
    this.description,
    this.status = TaskStatus.notStarted,
    this.priority = Priority.medium,
    this.estimatedTime,
    this.actualTime = 0,
    this.dueDate,
    this.completedAt,
    this.sortOrder = 0,
    this.isArchived = false,
    this.aiGenerated = false,
    this.aiEstimatedDuration,
    this.aiMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String todoId;
  final String name;
  final String? description;
  final TaskStatus status;
  final Priority priority;
  final int? estimatedTime; // in minutes
  final int actualTime; // in minutes
  final DateTime? dueDate;
  final DateTime? completedAt;
  final int sortOrder;
  final bool isArchived;
  final bool aiGenerated;
  final int? aiEstimatedDuration;
  final Map<String, dynamic>? aiMetadata;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Check if subtask is completed
  bool get isCompleted =>
      status == TaskStatus.completed || status == TaskStatus.done;

  /// Check if subtask is overdue
  bool get isOverdue {
    if (dueDate == null || isCompleted) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  /// Create a copy of subtask with updated fields
  Subtask copyWith({
    String? id,
    String? todoId,
    String? name,
    String? description,
    TaskStatus? status,
    Priority? priority,
    int? estimatedTime,
    int? actualTime,
    DateTime? dueDate,
    DateTime? completedAt,
    int? sortOrder,
    bool? isArchived,
    bool? aiGenerated,
    int? aiEstimatedDuration,
    Map<String, dynamic>? aiMetadata,
    DateTime? createdAt,
    DateTime? updatedAt,
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
      dueDate: dueDate ?? this.dueDate,
      completedAt: completedAt ?? this.completedAt,
      sortOrder: sortOrder ?? this.sortOrder,
      isArchived: isArchived ?? this.isArchived,
      aiGenerated: aiGenerated ?? this.aiGenerated,
      aiEstimatedDuration: aiEstimatedDuration ?? this.aiEstimatedDuration,
      aiMetadata: aiMetadata ?? this.aiMetadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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
    dueDate,
    completedAt,
    sortOrder,
    isArchived,
    aiGenerated,
    aiEstimatedDuration,
    aiMetadata,
    createdAt,
    updatedAt,
  ];

  @override
  String toString() {
    return 'Subtask(id: $id, name: $name, status: $status, todoId: $todoId)';
  }

  /// Create Subtask from JSON
  factory Subtask.fromJson(Map<String, dynamic> json) {
    return Subtask(
      id: json['id'] ?? '',
      todoId: json['todo_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'],
      status: TaskStatus.fromString(json['status'] ?? 'not_started'),
      priority: Priority.fromString(json['priority'] ?? 'medium'),
      estimatedTime: json['estimated_time'],
      actualTime: json['actual_time'] ?? 0,
      dueDate: json['due_date'] != null
          ? DateTime.tryParse(json['due_date'])
          : null,
      completedAt: json['completed_at'] != null
          ? DateTime.tryParse(json['completed_at'])
          : null,
      sortOrder: json['sort_order'] ?? 0,
      isArchived: json['is_archived'] ?? false,
      aiGenerated: json['ai_generated'] ?? false,
      aiEstimatedDuration: json['ai_estimated_duration'],
      aiMetadata: json['ai_metadata'] != null
          ? Map<String, dynamic>.from(json['ai_metadata'])
          : null,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }

  /// Convert Subtask to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todo_id': todoId,
      'name': name,
      'description': description,
      'status': status.value,
      'priority': priority.value,
      'estimated_time': estimatedTime,
      'actual_time': actualTime,
      'due_date': dueDate?.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
      'sort_order': sortOrder,
      'is_archived': isArchived,
      'ai_generated': aiGenerated,
      'ai_estimated_duration': aiEstimatedDuration,
      'ai_metadata': aiMetadata,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

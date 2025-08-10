import 'package:equatable/equatable.dart';

/// Todo entity representing a task in a project.
/// This is the core domain model for todo/task data.
class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.projectId,
    required this.taskName,
    required this.taskDescription,
    required this.status,
    required this.priority,
    this.estimatedTime,
    this.timeUnit = 'minutes',
    this.actualTime,
    this.dueDate,
    this.tags = const [],
    this.difficultyRating,
    this.energyLevelRequired,
    this.context,
    this.isPinned = false,
    this.isArchived = false,
    this.sortOrder = 0,
    required this.createdAt,
    required this.updatedAt,
    this.completedAt,
    this.assignedUserId,
    this.parentTodoId,
    this.subtaskCount = 0,
    this.completedSubtaskCount = 0,
  });

  final String id;
  final String projectId;
  final String taskName;
  final String taskDescription;
  final TodoStatus status;
  final TodoPriority priority;
  final int? estimatedTime;
  final String timeUnit;
  final int? actualTime;
  final DateTime? dueDate;
  final List<String> tags;
  final int? difficultyRating;
  final int? energyLevelRequired;
  final String? context;
  final bool isPinned;
  final bool isArchived;
  final int sortOrder;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? completedAt;
  final String? assignedUserId;
  final String? parentTodoId;
  final int subtaskCount;
  final int completedSubtaskCount;

  /// Calculate completion percentage for subtasks
  double get subtaskCompletionPercentage {
    if (subtaskCount == 0) return 0.0;
    return (completedSubtaskCount / subtaskCount) * 100;
  }

  /// Check if todo is completed
  bool get isCompleted => status == TodoStatus.completed;

  /// Check if todo is overdue
  bool get isOverdue {
    if (dueDate == null || isCompleted) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  /// Get remaining subtask count
  int get remainingSubtaskCount => subtaskCount - completedSubtaskCount;

  /// Check if todo has subtasks
  bool get hasSubtasks => subtaskCount > 0;

  /// Get estimated time in hours
  double get estimatedTimeInHours {
    if (estimatedTime == null) return 0.0;
    return timeUnit == 'hours'
        ? estimatedTime!.toDouble()
        : estimatedTime! / 60.0;
  }

  /// Get actual time in hours
  double get actualTimeInHours {
    if (actualTime == null) return 0.0;
    return timeUnit == 'hours' ? actualTime!.toDouble() : actualTime! / 60.0;
  }

  /// Create a copy of todo with updated fields
  Todo copyWith({
    String? id,
    String? projectId,
    String? taskName,
    String? taskDescription,
    TodoStatus? status,
    TodoPriority? priority,
    int? estimatedTime,
    String? timeUnit,
    int? actualTime,
    DateTime? dueDate,
    List<String>? tags,
    int? difficultyRating,
    int? energyLevelRequired,
    String? context,
    bool? isPinned,
    bool? isArchived,
    int? sortOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? completedAt,
    String? assignedUserId,
    String? parentTodoId,
    int? subtaskCount,
    int? completedSubtaskCount,
  }) {
    return Todo(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      taskName: taskName ?? this.taskName,
      taskDescription: taskDescription ?? this.taskDescription,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      timeUnit: timeUnit ?? this.timeUnit,
      actualTime: actualTime ?? this.actualTime,
      dueDate: dueDate ?? this.dueDate,
      tags: tags ?? this.tags,
      difficultyRating: difficultyRating ?? this.difficultyRating,
      energyLevelRequired: energyLevelRequired ?? this.energyLevelRequired,
      context: context ?? this.context,
      isPinned: isPinned ?? this.isPinned,
      isArchived: isArchived ?? this.isArchived,
      sortOrder: sortOrder ?? this.sortOrder,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      completedAt: completedAt ?? this.completedAt,
      assignedUserId: assignedUserId ?? this.assignedUserId,
      parentTodoId: parentTodoId ?? this.parentTodoId,
      subtaskCount: subtaskCount ?? this.subtaskCount,
      completedSubtaskCount:
          completedSubtaskCount ?? this.completedSubtaskCount,
    );
  }

  @override
  List<Object?> get props => [
    id,
    projectId,
    taskName,
    taskDescription,
    status,
    priority,
    estimatedTime,
    timeUnit,
    actualTime,
    dueDate,
    tags,
    difficultyRating,
    energyLevelRequired,
    context,
    isPinned,
    isArchived,
    sortOrder,
    createdAt,
    updatedAt,
    completedAt,
    assignedUserId,
    parentTodoId,
    subtaskCount,
    completedSubtaskCount,
  ];

  @override
  String toString() {
    return 'Todo(id: $id, taskName: $taskName, status: $status, priority: $priority)';
  }
}

/// Todo status enumeration
enum TodoStatus {
  backlog,
  todo,
  inProgress,
  review,
  completed,
  cancelled;

  String get displayName {
    switch (this) {
      case TodoStatus.backlog:
        return 'Backlog';
      case TodoStatus.todo:
        return 'To Do';
      case TodoStatus.inProgress:
        return 'In Progress';
      case TodoStatus.review:
        return 'Review';
      case TodoStatus.completed:
        return 'Completed';
      case TodoStatus.cancelled:
        return 'Cancelled';
    }
  }

  String get apiValue {
    switch (this) {
      case TodoStatus.backlog:
        return 'backlog';
      case TodoStatus.todo:
        return 'todo';
      case TodoStatus.inProgress:
        return 'in_progress';
      case TodoStatus.review:
        return 'review';
      case TodoStatus.completed:
        return 'completed';
      case TodoStatus.cancelled:
        return 'cancelled';
    }
  }

  static TodoStatus fromApiValue(String value) {
    switch (value.toLowerCase()) {
      case 'backlog':
        return TodoStatus.backlog;
      case 'todo':
        return TodoStatus.todo;
      case 'in_progress':
        return TodoStatus.inProgress;
      case 'review':
        return TodoStatus.review;
      case 'completed':
        return TodoStatus.completed;
      case 'cancelled':
        return TodoStatus.cancelled;
      default:
        return TodoStatus.todo;
    }
  }
}

/// Todo priority enumeration
enum TodoPriority {
  low,
  medium,
  high,
  urgent;

  String get displayName {
    switch (this) {
      case TodoPriority.low:
        return 'Low';
      case TodoPriority.medium:
        return 'Medium';
      case TodoPriority.high:
        return 'High';
      case TodoPriority.urgent:
        return 'Urgent';
    }
  }

  String get apiValue {
    switch (this) {
      case TodoPriority.low:
        return 'low';
      case TodoPriority.medium:
        return 'medium';
      case TodoPriority.high:
        return 'high';
      case TodoPriority.urgent:
        return 'urgent';
    }
  }

  static TodoPriority fromApiValue(String value) {
    switch (value.toLowerCase()) {
      case 'low':
        return TodoPriority.low;
      case 'medium':
        return TodoPriority.medium;
      case 'high':
        return TodoPriority.high;
      case 'urgent':
        return TodoPriority.urgent;
      default:
        return TodoPriority.medium;
    }
  }
}

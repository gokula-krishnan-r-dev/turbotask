/// Todo entity representing a task/todo item.
/// This is the core domain model for todo data.
class Todo {
  const Todo({
    required this.id,
    required this.taskName,
    this.taskDescription,
    this.taskImageOrEmoji,
    this.statusIcon,
    this.estimatedTime,
    this.actualTime = 0,
    this.timeUnit = TimeUnit.minutes,
    this.priority = Priority.medium,
    required this.status,
    this.completionPercentage = 0.0,
    this.dueDate,
    this.startDate,
    this.completedAt,
    this.tags = const [],
    this.difficultyRating,
    this.energyLevelRequired,
    this.location,
    this.context,
    this.assignedTo,
    this.assignedToName,
    this.isRecurring = false,
    this.isArchived = false,
    this.isPinned = false,
    this.subtaskCount = 0,
    this.completedSubtasks = 0,
    this.commentCount = 0,
    this.attachmentCount = 0,
    required this.createdAt,
    required this.updatedAt,
    required this.projectId,
    this.projectTitle,
    this.releaseVersionId,
    this.parentTodoId,
  });

  final String id;
  final String taskName;
  final String? taskDescription;
  final String? taskImageOrEmoji;
  final String? statusIcon;
  final int? estimatedTime;
  final int actualTime;
  final TimeUnit timeUnit;
  final Priority priority;
  final TaskStatus status;
  final double completionPercentage;
  final DateTime? dueDate;
  final DateTime? startDate;
  final DateTime? completedAt;
  final List<String> tags;
  final int? difficultyRating;
  final int? energyLevelRequired;
  final String? location;
  final String? context;
  final String? assignedTo;
  final String? assignedToName;
  final bool isRecurring;
  final bool isArchived;
  final bool isPinned;
  final int subtaskCount;
  final int completedSubtasks;
  final int commentCount;
  final int attachmentCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String projectId;
  final String? projectTitle;
  final String? releaseVersionId;
  final String? parentTodoId;

  /// Check if todo is completed
  bool get isCompleted =>
      status == TaskStatus.completed || status == TaskStatus.done;

  /// Check if todo is overdue
  bool get isOverdue {
    if (dueDate == null || isCompleted) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  /// Get remaining subtasks count
  int get remainingSubtasks => subtaskCount - completedSubtasks;

  /// Get subtask completion percentage
  double get subtaskCompletionPercentage {
    if (subtaskCount == 0) return 0.0;
    return (completedSubtasks / subtaskCount) * 100;
  }

  /// Create a copy of todo with updated fields
  Todo copyWith({
    String? id,
    String? taskName,
    String? taskDescription,
    String? taskImageOrEmoji,
    String? statusIcon,
    int? estimatedTime,
    int? actualTime,
    TimeUnit? timeUnit,
    Priority? priority,
    TaskStatus? status,
    double? completionPercentage,
    DateTime? dueDate,
    DateTime? startDate,
    DateTime? completedAt,
    List<String>? tags,
    int? difficultyRating,
    int? energyLevelRequired,
    String? location,
    String? context,
    String? assignedTo,
    String? assignedToName,
    bool? isRecurring,
    bool? isArchived,
    bool? isPinned,
    int? subtaskCount,
    int? completedSubtasks,
    int? commentCount,
    int? attachmentCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? projectId,
    String? projectTitle,
    String? releaseVersionId,
    String? parentTodoId,
  }) {
    return Todo(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      taskDescription: taskDescription ?? this.taskDescription,
      taskImageOrEmoji: taskImageOrEmoji ?? this.taskImageOrEmoji,
      statusIcon: statusIcon ?? this.statusIcon,
      estimatedTime: estimatedTime ?? this.estimatedTime,
      actualTime: actualTime ?? this.actualTime,
      timeUnit: timeUnit ?? this.timeUnit,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      completionPercentage: completionPercentage ?? this.completionPercentage,
      dueDate: dueDate ?? this.dueDate,
      startDate: startDate ?? this.startDate,
      completedAt: completedAt ?? this.completedAt,
      tags: tags ?? this.tags,
      difficultyRating: difficultyRating ?? this.difficultyRating,
      energyLevelRequired: energyLevelRequired ?? this.energyLevelRequired,
      location: location ?? this.location,
      context: context ?? this.context,
      assignedTo: assignedTo ?? this.assignedTo,
      assignedToName: assignedToName ?? this.assignedToName,
      isRecurring: isRecurring ?? this.isRecurring,
      isArchived: isArchived ?? this.isArchived,
      isPinned: isPinned ?? this.isPinned,
      subtaskCount: subtaskCount ?? this.subtaskCount,
      completedSubtasks: completedSubtasks ?? this.completedSubtasks,
      commentCount: commentCount ?? this.commentCount,
      attachmentCount: attachmentCount ?? this.attachmentCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      projectId: projectId ?? this.projectId,
      projectTitle: projectTitle ?? this.projectTitle,
      releaseVersionId: releaseVersionId ?? this.releaseVersionId,
      parentTodoId: parentTodoId ?? this.parentTodoId,
    );
  }

  List<Object?> get props => [
    id,
    taskName,
    taskDescription,
    taskImageOrEmoji,
    statusIcon,
    estimatedTime,
    actualTime,
    timeUnit,
    priority,
    status,
    completionPercentage,
    dueDate,
    startDate,
    completedAt,
    tags,
    difficultyRating,
    energyLevelRequired,
    location,
    context,
    assignedTo,
    assignedToName,
    isRecurring,
    isArchived,
    isPinned,
    subtaskCount,
    completedSubtasks,
    commentCount,
    attachmentCount,
    createdAt,
    updatedAt,
    projectId,
    projectTitle,
    releaseVersionId,
    parentTodoId,
  ];

  @override
  String toString() {
    return 'Todo(id: $id, taskName: $taskName, status: $status, priority: $priority)';
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] ?? '',
      taskName: json['task_name'] ?? '',
      taskDescription: json['task_description'],
      taskImageOrEmoji: json['task_image_or_emoji'],
      statusIcon: json['status_icon'],
      estimatedTime: json['estimated_time'],
      actualTime: json['actual_time'] ?? 0,
      timeUnit: TimeUnit.fromString(json['time_unit'] ?? 'minutes'),
      priority: Priority.fromString(json['priority'] ?? 'medium'),
      status: TaskStatus.fromString(json['status'] ?? 'not_started'),
      completionPercentage: (json['completion_percentage'] ?? 0.0).toDouble(),
      dueDate: json['due_date'] != null
          ? DateTime.tryParse(json['due_date'])
          : null,
      startDate: json['start_date'] != null
          ? DateTime.tryParse(json['start_date'])
          : null,
      completedAt: json['completed_at'] != null
          ? DateTime.tryParse(json['completed_at'])
          : null,
      tags: (json['tags'] as List?)?.cast<String>() ?? [],
      difficultyRating: json['difficulty_rating'],
      energyLevelRequired: json['energy_level_required'],
      location: json['location'],
      context: json['context'],
      assignedTo: json['assigned_to'],
      assignedToName: json['assigned_to_name'],
      isRecurring: json['is_recurring'] ?? false,
      isArchived: json['is_archived'] ?? false,
      isPinned: json['is_pinned'] ?? false,
      subtaskCount: json['subtask_count'] ?? 0,
      completedSubtasks: json['completed_subtasks'] ?? 0,
      commentCount: json['comment_count'] ?? 0,
      attachmentCount: json['attachment_count'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
      projectId: json['project_id'] ?? '',
      projectTitle: json['project_title'],
      releaseVersionId: json['release_version_id'],
      parentTodoId: json['parent_todo_id'],
    );
  }
}

/// Priority levels for todos
enum Priority {
  low,
  medium,
  high,
  urgent;

  String get displayName {
    switch (this) {
      case Priority.low:
        return 'Low';
      case Priority.medium:
        return 'Medium';
      case Priority.high:
        return 'High';
      case Priority.urgent:
        return 'Urgent';
    }
  }

  String get value {
    switch (this) {
      case Priority.low:
        return 'low';
      case Priority.medium:
        return 'medium';
      case Priority.high:
        return 'high';
      case Priority.urgent:
        return 'urgent';
    }
  }

  static Priority fromString(String value) {
    switch (value.toLowerCase()) {
      case 'low':
        return Priority.low;
      case 'medium':
        return Priority.medium;
      case 'high':
        return Priority.high;
      case 'urgent':
        return Priority.urgent;
      default:
        return Priority.medium;
    }
  }
}

/// Task status for kanban columns
enum TaskStatus {
  notStarted,
  backlog,
  inProgress,
  pending,
  completed,
  cancelled,
  today,
  onHold,
  done,
  todo,
  blocked,
  review,
  testing;

  String get displayName {
    switch (this) {
      case TaskStatus.notStarted:
        return 'Not Started';
      case TaskStatus.backlog:
        return 'Backlog';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.pending:
        return 'Pending';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.cancelled:
        return 'Cancelled';
      case TaskStatus.onHold:
        return 'On Hold';
      case TaskStatus.done:
        return 'Done';
      case TaskStatus.today:
        return 'Today';
      case TaskStatus.todo:
        return 'Todo';
      case TaskStatus.blocked:
        return 'Blocked';
      case TaskStatus.review:
        return 'Review';
      case TaskStatus.testing:
        return 'Testing';
    }
  }

  String get value {
    switch (this) {
      case TaskStatus.notStarted:
        return 'not_started';
      case TaskStatus.backlog:
        return 'backlog';
      case TaskStatus.inProgress:
        return 'in_progress';
      case TaskStatus.pending:
        return 'pending';
      case TaskStatus.completed:
        return 'completed';
      case TaskStatus.cancelled:
        return 'cancelled';
      case TaskStatus.today:
        return 'today';
      case TaskStatus.onHold:
        return 'on_hold';
      case TaskStatus.done:
        return 'done';
      case TaskStatus.todo:
        return 'todo';
      case TaskStatus.blocked:
        return 'blocked';
      case TaskStatus.review:
        return 'review';
      case TaskStatus.testing:
        return 'testing';
    }
  }

  /// Get default kanban columns
  static List<TaskStatus> get kanbanColumns => [
    TaskStatus.backlog,
    TaskStatus.inProgress,
    TaskStatus.todo,
    TaskStatus.done,
  ];

  static TaskStatus fromString(String value) {
    switch (value.toLowerCase()) {
      case 'not_started':
        return TaskStatus.notStarted;
      case 'backlog':
        return TaskStatus.backlog;
      case 'in_progress':
        return TaskStatus.inProgress;
      case 'pending':
        return TaskStatus.pending;
      case 'completed':
        return TaskStatus.completed;
      case 'cancelled':
        return TaskStatus.cancelled;
      case 'today':
        return TaskStatus.today;
      case 'on_hold':
        return TaskStatus.onHold;
      case 'done':
        return TaskStatus.done;
      case 'todo':
        return TaskStatus.todo;
      case 'blocked':
        return TaskStatus.blocked;
      case 'review':
        return TaskStatus.review;
      case 'testing':
        return TaskStatus.testing;
      default:
        return TaskStatus.notStarted;
    }
  }
}

/// Time unit for estimates
enum TimeUnit {
  minutes,
  hours,
  days;

  String get displayName {
    switch (this) {
      case TimeUnit.minutes:
        return 'Minutes';
      case TimeUnit.hours:
        return 'Hours';
      case TimeUnit.days:
        return 'Days';
    }
  }

  String get value {
    switch (this) {
      case TimeUnit.minutes:
        return 'minutes';
      case TimeUnit.hours:
        return 'hours';
      case TimeUnit.days:
        return 'days';
    }
  }

  static TimeUnit fromString(String value) {
    switch (value.toLowerCase()) {
      case 'minutes':
        return TimeUnit.minutes;
      case 'hours':
        return TimeUnit.hours;
      case 'days':
        return TimeUnit.days;
      default:
        return TimeUnit.minutes;
    }
  }
}

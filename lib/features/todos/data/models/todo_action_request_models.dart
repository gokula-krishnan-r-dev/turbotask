/// Request models for todo actions

/// Request model for updating a todo
class UpdateTodoRequest {
  const UpdateTodoRequest({
    this.taskName,
    this.taskDescription,
    this.taskImageOrEmoji,
    this.statusIcon,
    this.estimatedTime,
    this.actualTime,
    this.priority,
    this.status,
    this.dueDate,
    this.startDate,
    this.tags,
    this.difficultyRating,
    this.energyLevelRequired,
    this.location,
    this.context,
    this.assignedTo,
    this.isRecurring,
    this.isPinned,
  });

  final String? taskName;
  final String? taskDescription;
  final String? taskImageOrEmoji;
  final String? statusIcon;
  final int? estimatedTime;
  final int? actualTime;
  final String? priority;
  final String? status;
  final DateTime? dueDate;
  final DateTime? startDate;
  final List<String>? tags;
  final int? difficultyRating;
  final int? energyLevelRequired;
  final String? location;
  final String? context;
  final String? assignedTo;
  final bool? isRecurring;
  final bool? isPinned;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (taskName != null) json['task_name'] = taskName;
    if (taskDescription != null) json['task_description'] = taskDescription;
    if (taskImageOrEmoji != null)
      json['task_image_or_emoji'] = taskImageOrEmoji;
    if (statusIcon != null) json['status_icon'] = statusIcon;
    if (estimatedTime != null) json['estimated_time'] = estimatedTime;
    if (actualTime != null) json['actual_time'] = actualTime;
    if (priority != null) json['priority'] = priority;
    if (status != null) json['status'] = status;
    if (dueDate != null) json['due_date'] = dueDate!.toIso8601String();
    if (startDate != null) json['start_date'] = startDate!.toIso8601String();
    if (tags != null) json['tags'] = tags;
    if (difficultyRating != null) json['difficulty_rating'] = difficultyRating;
    if (energyLevelRequired != null)
      json['energy_level_required'] = energyLevelRequired;
    if (location != null) json['location'] = location;
    if (context != null) json['context'] = context;
    if (assignedTo != null) json['assigned_to'] = assignedTo;
    if (isRecurring != null) json['is_recurring'] = isRecurring;
    if (isPinned != null) json['is_pinned'] = isPinned;

    return json;
  }
}

class StartBreakRequest {
  final String todoId;
  final String? projectId;
  final String breakType;
  final String? reason;
  final int? estimatedDuration; // in minutes

  const StartBreakRequest({
    required this.todoId,
    this.projectId,
    required this.breakType,
    this.reason,
    this.estimatedDuration,
  });

  Map<String, dynamic> toJson() {
    return {
      'todo_id': todoId,
      if (projectId != null) 'project_id': projectId,
      'break_type': breakType,
      if (reason != null) 'reason': reason,
      if (estimatedDuration != null) 'estimated_duration': estimatedDuration,
    };
  }
}

/// Break types enum
enum BreakType {
  short,
  long,
  meal,
  personal,
  emergency;

  String get value {
    switch (this) {
      case BreakType.short:
        return 'short';
      case BreakType.long:
        return 'long';
      case BreakType.meal:
        return 'meal';
      case BreakType.personal:
        return 'personal';
      case BreakType.emergency:
        return 'emergency';
    }
  }

  String get displayName {
    switch (this) {
      case BreakType.short:
        return 'Short Break';
      case BreakType.long:
        return 'Long Break';
      case BreakType.meal:
        return 'Meal Break';
      case BreakType.personal:
        return 'Personal Break';
      case BreakType.emergency:
        return 'Emergency Break';
    }
  }

  int get defaultDuration {
    switch (this) {
      case BreakType.short:
        return 5;
      case BreakType.long:
        return 15;
      case BreakType.meal:
        return 30;
      case BreakType.personal:
        return 10;
      case BreakType.emergency:
        return 0;
    }
  }
}

/// Todo action types for UI
enum TodoActionType {
  complete,
  incomplete,
  pin,
  break_,
  pause,
  skip,
  note;

  String get value {
    switch (this) {
      case TodoActionType.complete:
        return 'complete';
      case TodoActionType.incomplete:
        return 'incomplete';
      case TodoActionType.pin:
        return 'pin';
      case TodoActionType.break_:
        return 'break';
      case TodoActionType.pause:
        return 'pause';
      case TodoActionType.skip:
        return 'skip';
      case TodoActionType.note:
        return 'note';
    }
  }

  String get displayName {
    switch (this) {
      case TodoActionType.complete:
        return 'Complete';
      case TodoActionType.incomplete:
        return 'Mark Incomplete';
      case TodoActionType.pin:
        return 'Pin';
      case TodoActionType.break_:
        return 'Take Break';
      case TodoActionType.pause:
        return 'Pause';
      case TodoActionType.skip:
        return 'Skip';
      case TodoActionType.note:
        return 'Add Note';
    }
  }
}

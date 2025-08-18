/// Request models for todo actions
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

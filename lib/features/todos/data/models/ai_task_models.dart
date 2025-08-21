import 'package:equatable/equatable.dart';

/// Request model for creating an optimized AI-enhanced task
class CreateOptimizedAITaskRequest extends Equatable {
  final String projectId;
  final String taskName;
  final String? taskDescription;
  final String? projectContext;
  final String? userPreferences;

  const CreateOptimizedAITaskRequest({
    required this.projectId,
    required this.taskName,
    this.taskDescription,
    this.projectContext,
    this.userPreferences,
  });

  Map<String, dynamic> toJson() {
    return {
      'project_id': projectId,
      'task_name': taskName,
      'task_description': taskDescription,
      'project_context': projectContext,
      'user_preferences': userPreferences,
    };
  }

  @override
  List<Object?> get props => [
    projectId,
    taskName,
    taskDescription,
    projectContext,
    userPreferences,
  ];
}

/// Response model for optimized AI task creation
class OptimizedAITaskResponse extends Equatable {
  final String taskId;
  final String taskName;
  final String projectId;
  final String status;
  final String aiEnhancementJob;
  final String message;

  const OptimizedAITaskResponse({
    required this.taskId,
    required this.taskName,
    required this.projectId,
    required this.status,
    required this.aiEnhancementJob,
    required this.message,
  });

  factory OptimizedAITaskResponse.fromJson(Map<String, dynamic> json) {
    return OptimizedAITaskResponse(
      taskId: json['task_id'] as String,
      taskName: json['task_name'] as String,
      projectId: json['project_id'] as String,
      status: json['status'] as String,
      aiEnhancementJob: json['ai_enhancement_job'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task_id': taskId,
      'task_name': taskName,
      'project_id': projectId,
      'status': status,
      'ai_enhancement_job': aiEnhancementJob,
      'message': message,
    };
  }

  @override
  List<Object?> get props => [
    taskId,
    taskName,
    projectId,
    status,
    aiEnhancementJob,
    message,
  ];
}

/// AI Enhancement notification model for WebSocket messages
class AIEnhancementNotification extends Equatable {
  final String type;
  final String taskId;
  final String? requestId;
  final int? duration;
  final String? message;
  final String? error;

  const AIEnhancementNotification({
    required this.type,
    required this.taskId,
    this.requestId,
    this.duration,
    this.message,
    this.error,
  });

  factory AIEnhancementNotification.fromJson(Map<String, dynamic> json) {
    return AIEnhancementNotification(
      type: json['type'] as String,
      taskId: json['task_id'] as String,
      requestId: json['request_id'] as String?,
      duration: json['duration'] as int?,
      message: json['message'] as String?,
      error: json['error'] as String?,
    );
  }

  bool get isCompleted => type == 'ai_enhancement_completed';
  bool get isError => type == 'ai_enhancement_error';

  @override
  List<Object?> get props => [
    type,
    taskId,
    requestId,
    duration,
    message,
    error,
  ];
}

/// AI Regeneration request model
class RegenerateAIEnhancementsRequest extends Equatable {
  final String taskId;

  const RegenerateAIEnhancementsRequest({required this.taskId});

  Map<String, dynamic> toJson() {
    return {'task_id': taskId};
  }

  @override
  List<Object?> get props => [taskId];
}

/// AI Description improvement request model
class ImproveDescriptionRequest extends Equatable {
  final String taskName;
  final String? currentDescription;
  final String? priority;
  final List<String>? tags;

  const ImproveDescriptionRequest({
    required this.taskName,
    this.currentDescription,
    this.priority,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    return {
      'task_name': taskName,
      'current_description': currentDescription,
      'priority': priority,
      'tags': tags,
    };
  }

  @override
  List<Object?> get props => [taskName, currentDescription, priority, tags];
}

/// AI Subtask refinement request model
class RefineSubtasksRequest extends Equatable {
  final String todoId;
  final List<String>? subtaskNames;
  final String? userFeedback;

  const RefineSubtasksRequest({
    required this.todoId,
    this.subtaskNames,
    this.userFeedback,
  });

  Map<String, dynamic> toJson() {
    return {
      'todo_id': todoId,
      'subtask_names': subtaskNames,
      'user_feedback': userFeedback,
    };
  }

  @override
  List<Object?> get props => [todoId, subtaskNames, userFeedback];
}

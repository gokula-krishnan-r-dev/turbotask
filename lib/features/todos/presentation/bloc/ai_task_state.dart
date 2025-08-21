part of 'ai_task_bloc.dart';

abstract class AITaskState extends Equatable {
  const AITaskState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class AITaskInitial extends AITaskState {
  const AITaskInitial();
}

/// Creating optimized AI task
class AITaskCreating extends AITaskState {
  const AITaskCreating();
}

/// AI task created successfully (immediate response)
class AITaskCreated extends AITaskState {
  final OptimizedAITaskResponse response;
  final AITaskEnhancement enhancement;

  const AITaskCreated({required this.response, required this.enhancement});

  @override
  List<Object?> get props => [response, enhancement];
}

/// AI enhancement completed (from WebSocket)
class AITaskEnhancementCompleted extends AITaskState {
  final String taskId;
  final AITaskEnhancement enhancement;
  final String message;

  const AITaskEnhancementCompleted({
    required this.taskId,
    required this.enhancement,
    required this.message,
  });

  @override
  List<Object?> get props => [taskId, enhancement, message];
}

/// AI enhancement failed (from WebSocket)
class AITaskEnhancementFailed extends AITaskState {
  final String taskId;
  final AITaskEnhancement enhancement;
  final String error;

  const AITaskEnhancementFailed({
    required this.taskId,
    required this.enhancement,
    required this.error,
  });

  @override
  List<Object?> get props => [taskId, enhancement, error];
}

/// Regenerating AI enhancements
class AITaskRegenerating extends AITaskState {
  const AITaskRegenerating();
}

/// AI enhancements regenerated
class AITaskEnhancementsRegenerated extends AITaskState {
  final Todo todo;

  const AITaskEnhancementsRegenerated({required this.todo});

  @override
  List<Object?> get props => [todo];
}

/// Improving task description
class AITaskImprovingDescription extends AITaskState {
  const AITaskImprovingDescription();
}

/// Task description improved
class AITaskDescriptionImproved extends AITaskState {
  final Map<String, dynamic> improvedDescription;

  const AITaskDescriptionImproved({required this.improvedDescription});

  @override
  List<Object?> get props => [improvedDescription];
}

/// Refining task subtasks
class AITaskRefiningSubtasks extends AITaskState {
  const AITaskRefiningSubtasks();
}

/// Task subtasks refined
class AITaskSubtasksRefined extends AITaskState {
  final List<Map<String, dynamic>> refinedSubtasks;

  const AITaskSubtasksRefined({required this.refinedSubtasks});

  @override
  List<Object?> get props => [refinedSubtasks];
}

/// AI task operation error
class AITaskError extends AITaskState {
  final String message;

  const AITaskError(this.message);

  @override
  List<Object?> get props => [message];
}

/// AI enhancement tracking model
class AITaskEnhancement extends Equatable {
  final String taskId;
  final String taskName;
  final AIEnhancementStatus status;
  final String? requestId;
  final DateTime createdAt;
  final DateTime? completedAt;
  final int? duration;
  final String? error;

  const AITaskEnhancement({
    required this.taskId,
    required this.taskName,
    required this.status,
    this.requestId,
    required this.createdAt,
    this.completedAt,
    this.duration,
    this.error,
  });

  AITaskEnhancement copyWith({
    String? taskId,
    String? taskName,
    AIEnhancementStatus? status,
    String? requestId,
    DateTime? createdAt,
    DateTime? completedAt,
    int? duration,
    String? error,
  }) {
    return AITaskEnhancement(
      taskId: taskId ?? this.taskId,
      taskName: taskName ?? this.taskName,
      status: status ?? this.status,
      requestId: requestId ?? this.requestId,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      duration: duration ?? this.duration,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
    taskId,
    taskName,
    status,
    requestId,
    createdAt,
    completedAt,
    duration,
    error,
  ];
}

/// AI enhancement status
enum AIEnhancementStatus { pending, completed, failed }

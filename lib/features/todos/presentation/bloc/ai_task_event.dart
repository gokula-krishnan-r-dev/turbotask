part of 'ai_task_bloc.dart';

abstract class AITaskEvent extends Equatable {
  const AITaskEvent();

  @override
  List<Object?> get props => [];
}

/// Create an optimized AI-enhanced task
class CreateOptimizedAITask extends AITaskEvent {
  final CreateOptimizedAITaskRequest request;

  const CreateOptimizedAITask(this.request);

  @override
  List<Object?> get props => [request];
}

/// Regenerate AI enhancements for an existing task
class RegenerateAIEnhancements extends AITaskEvent {
  final String taskId;

  const RegenerateAIEnhancements(this.taskId);

  @override
  List<Object?> get props => [taskId];
}

/// Improve task description using AI
class ImproveTaskDescription extends AITaskEvent {
  final ImproveDescriptionRequest request;

  const ImproveTaskDescription(this.request);

  @override
  List<Object?> get props => [request];
}

/// Refine task subtasks using AI
class RefineTaskSubtasks extends AITaskEvent {
  final RefineSubtasksRequest request;

  const RefineTaskSubtasks(this.request);

  @override
  List<Object?> get props => [request];
}

/// Handle AI enhancement notification received from WebSocket
class AIEnhancementNotificationReceived extends AITaskEvent {
  final AIEnhancementNotification notification;

  const AIEnhancementNotificationReceived(this.notification);

  @override
  List<Object?> get props => [notification];
}

/// Start listening to AI enhancement notifications
class StartListeningToAINotifications extends AITaskEvent {
  const StartListeningToAINotifications();
}

/// Stop listening to AI enhancement notifications
class StopListeningToAINotifications extends AITaskEvent {
  const StopListeningToAINotifications();
}

/// Clear AI task state
class ClearAITaskState extends AITaskEvent {
  const ClearAITaskState();
}

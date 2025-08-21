import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/websocket_service.dart';
import '../../data/models/ai_task_models.dart';
import '../../domain/entities/todo.dart';
import '../../domain/usecases/ai_task_usecase.dart';

part 'ai_task_event.dart';
part 'ai_task_state.dart';

@injectable
class AITaskBloc extends Bloc<AITaskEvent, AITaskState> {
  final AITaskUseCase _aiTaskUseCase;
  final WebSocketService _webSocketService;

  StreamSubscription<AIEnhancementNotification>? _aiNotificationSubscription;
  final Map<String, AITaskEnhancement> _pendingEnhancements = {};

  AITaskBloc(this._aiTaskUseCase, this._webSocketService)
    : super(const AITaskInitial()) {
    on<CreateOptimizedAITask>(_onCreateOptimizedAITask);
    on<RegenerateAIEnhancements>(_onRegenerateAIEnhancements);
    on<ImproveTaskDescription>(_onImproveTaskDescription);
    on<RefineTaskSubtasks>(_onRefineTaskSubtasks);
    on<AIEnhancementNotificationReceived>(_onAIEnhancementNotificationReceived);
    on<StartListeningToAINotifications>(_onStartListeningToAINotifications);
    on<StopListeningToAINotifications>(_onStopListeningToAINotifications);
    on<ClearAITaskState>(_onClearAITaskState);

    // Start listening to AI notifications
    add(const StartListeningToAINotifications());
  }

  Future<void> _onCreateOptimizedAITask(
    CreateOptimizedAITask event,
    Emitter<AITaskState> emit,
  ) async {
    emit(const AITaskCreating());

    try {
      final response = await _aiTaskUseCase.createOptimizedAITask(
        event.request,
      );

      // Track this enhancement request
      _pendingEnhancements[response.taskId] = AITaskEnhancement(
        taskId: response.taskId,
        taskName: response.taskName,
        status: AIEnhancementStatus.pending,
        requestId: response.aiEnhancementJob,
        createdAt: DateTime.now(),
      );

      emit(
        AITaskCreated(
          response: response,
          enhancement: _pendingEnhancements[response.taskId]!,
        ),
      );

      log('AI Task created successfully: ${response.taskId}');
    } catch (e) {
      emit(AITaskError('Failed to create AI task: ${e.toString()}'));
      log('Error creating AI task: $e');
    }
  }

  Future<void> _onRegenerateAIEnhancements(
    RegenerateAIEnhancements event,
    Emitter<AITaskState> emit,
  ) async {
    emit(const AITaskRegenerating());

    try {
      final todo = await _aiTaskUseCase.regenerateAIEnhancements(event.taskId);
      emit(AITaskEnhancementsRegenerated(todo: todo));
      log('AI enhancements regenerated for task: ${event.taskId}');
    } catch (e) {
      emit(
        AITaskError('Failed to regenerate AI enhancements: ${e.toString()}'),
      );
      log('Error regenerating AI enhancements: $e');
    }
  }

  Future<void> _onImproveTaskDescription(
    ImproveTaskDescription event,
    Emitter<AITaskState> emit,
  ) async {
    emit(const AITaskImprovingDescription());

    try {
      final result = await _aiTaskUseCase.improveDescription(event.request);
      emit(AITaskDescriptionImproved(improvedDescription: result));
      log('Task description improved');
    } catch (e) {
      emit(AITaskError('Failed to improve description: ${e.toString()}'));
      log('Error improving description: $e');
    }
  }

  Future<void> _onRefineTaskSubtasks(
    RefineTaskSubtasks event,
    Emitter<AITaskState> emit,
  ) async {
    emit(const AITaskRefiningSubtasks());

    try {
      final subtasks = await _aiTaskUseCase.refineSubtasks(event.request);
      emit(AITaskSubtasksRefined(refinedSubtasks: subtasks));
      log('Task subtasks refined');
    } catch (e) {
      emit(AITaskError('Failed to refine subtasks: ${e.toString()}'));
      log('Error refining subtasks: $e');
    }
  }

  void _onAIEnhancementNotificationReceived(
    AIEnhancementNotificationReceived event,
    Emitter<AITaskState> emit,
  ) {
    final notification = event.notification;
    final taskId = notification.taskId;

    if (_pendingEnhancements.containsKey(taskId)) {
      final enhancement = _pendingEnhancements[taskId]!;

      if (notification.isCompleted) {
        _pendingEnhancements[taskId] = enhancement.copyWith(
          status: AIEnhancementStatus.completed,
          completedAt: DateTime.now(),
          duration: notification.duration,
        );

        emit(
          AITaskEnhancementCompleted(
            taskId: taskId,
            enhancement: _pendingEnhancements[taskId]!,
            message:
                notification.message ?? 'AI enhancement completed successfully',
          ),
        );

        log('AI enhancement completed for task: $taskId');
      } else if (notification.isError) {
        _pendingEnhancements[taskId] = enhancement.copyWith(
          status: AIEnhancementStatus.failed,
          completedAt: DateTime.now(),
          error: notification.error,
        );

        emit(
          AITaskEnhancementFailed(
            taskId: taskId,
            enhancement: _pendingEnhancements[taskId]!,
            error: notification.error ?? 'AI enhancement failed',
          ),
        );

        log('AI enhancement failed for task: $taskId - ${notification.error}');
      }
    }
  }

  void _onStartListeningToAINotifications(
    StartListeningToAINotifications event,
    Emitter<AITaskState> emit,
  ) {
    _aiNotificationSubscription?.cancel();
    _aiNotificationSubscription = _webSocketService.aiEnhancementNotifications
        .listen(
          (notification) {
            add(AIEnhancementNotificationReceived(notification));
          },
          onError: (error) {
            log('Error listening to AI notifications: $error');
          },
        );

    log('Started listening to AI enhancement notifications');
  }

  void _onStopListeningToAINotifications(
    StopListeningToAINotifications event,
    Emitter<AITaskState> emit,
  ) {
    _aiNotificationSubscription?.cancel();
    _aiNotificationSubscription = null;
    log('Stopped listening to AI enhancement notifications');
  }

  void _onClearAITaskState(ClearAITaskState event, Emitter<AITaskState> emit) {
    emit(const AITaskInitial());
  }

  /// Get enhancement status for a specific task
  AITaskEnhancement? getEnhancementStatus(String taskId) {
    return _pendingEnhancements[taskId];
  }

  /// Get all pending enhancements
  Map<String, AITaskEnhancement> get pendingEnhancements =>
      Map.unmodifiable(_pendingEnhancements);

  @override
  Future<void> close() {
    _aiNotificationSubscription?.cancel();
    return super.close();
  }
}

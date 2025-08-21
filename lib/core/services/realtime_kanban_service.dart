import 'dart:async';
import 'dart:developer';

import 'package:injectable/injectable.dart';

import '../../features/todos/presentation/bloc/kanban_board_bloc.dart';
import 'websocket_service.dart';

/// Service that manages real-time kanban board updates via WebSocket
@singleton
class RealtimeKanbanService {
  final WebSocketService _webSocketService;
  StreamSubscription? _generalNotificationSubscription;
  StreamSubscription? _aiEnhancementSubscription;

  // Map to track active kanban blocs by project ID
  final Map<String, KanbanBoardBloc> _activeKanbanBlocs = {};

  RealtimeKanbanService(this._webSocketService);

  /// Start listening for real-time updates for a specific project
  void startListening(String projectId, KanbanBoardBloc kanbanBloc) {
    log('🔄 Starting real-time listening for project: $projectId');

    // Store the kanban bloc for this project
    _activeKanbanBlocs[projectId] = kanbanBloc;

    // Listen for general notifications that might affect the kanban board
    _generalNotificationSubscription?.cancel();
    _generalNotificationSubscription = _webSocketService.generalNotifications
        .listen(
          (notification) => _handleGeneralNotification(notification, projectId),
        );

    // Listen for AI enhancement completions
    _aiEnhancementSubscription?.cancel();
    _aiEnhancementSubscription = _webSocketService.aiEnhancementNotifications
        .listen(
          (notification) =>
              _handleAIEnhancementNotification(notification, projectId),
        );

    log('✅ Real-time listening started for project: $projectId');
  }

  /// Stop listening for real-time updates for a specific project
  void stopListening(String projectId) {
    log('🛑 Stopping real-time listening for project: $projectId');

    _activeKanbanBlocs.remove(projectId);

    // If no more active projects, cancel subscriptions
    if (_activeKanbanBlocs.isEmpty) {
      _generalNotificationSubscription?.cancel();
      _aiEnhancementSubscription?.cancel();
    }
  }

  /// Handle general WebSocket notifications
  void _handleGeneralNotification(
    Map<String, dynamic> notification,
    String projectId,
  ) {
    log('📨 RealtimeKanbanService received notification: $notification');
    log('🎯 Current project ID: $projectId');

    final notificationType = notification['type'] as String?;
    final payload = notification['payload'] as Map<String, dynamic>?;
    final timestamp = notification['timestamp'] as String?;
    final eventId = notification['event_id'] as String?;
    final userNotificationId = notification['user_id'] as String?;

    log('📝 Notification type: $notificationType');
    log('📦 Notification payload: $payload');
    log('🕐 Timestamp: $timestamp');
    log('🆔 Event ID: $eventId');
    log('👤 User notification target: $userNotificationId');

    // Extract task/project information from payload
    final todoPayload = payload?['todo'] as Map<String, dynamic>?;
    final taskProjectId = todoPayload?['project_id'] as String?;
    final taskId = todoPayload?['id'] as String?;
    final taskName = todoPayload?['task_name'] as String?;

    // Check if this notification is relevant to the current project
    final relevantProjectId =
        taskProjectId ?? payload?['project_id'] as String?;

    if (relevantProjectId != null && relevantProjectId != projectId) {
      log(
        '🚫 Notification is for different project ($relevantProjectId), ignoring',
      );
      return;
    }

    // Handle different notification types with enhanced logging and dynamic reload
    switch (notificationType) {
      case 'todo_created':
        log('✅ Task created notification - Dynamic reload initiated');
        log(
          '📋 Task details: ID=$taskId, Name="$taskName", Project=$taskProjectId',
        );
        _dynamicKanbanReload(projectId, 'Task created', {
          'taskId': taskId,
          'taskName': taskName,
          'action': 'created',
          'timestamp': timestamp,
          'eventId': eventId,
        });
        break;
      case 'todo_updated':
        log('🔄 Task updated notification - Dynamic reload initiated');
        log(
          '📋 Task details: ID=$taskId, Name="$taskName", Project=$taskProjectId',
        );

        // Check if it's an AI enhancement completion
        final aiEnhanced = todoPayload?['ai_enhanced'] as bool?;
        final enhancementType = payload?['enhancement_type'] as String?;

        if (aiEnhanced == true || enhancementType == 'ai_completion') {
          log('🤖 AI enhancement detected in task update');
        }

        _dynamicKanbanReload(projectId, 'Task updated', {
          'taskId': taskId,
          'taskName': taskName,
          'action': 'updated',
          'aiEnhanced': aiEnhanced,
          'enhancementType': enhancementType,
          'timestamp': timestamp,
          'eventId': eventId,
        });
        break;
      case 'todo_deleted':
        log('🗑️ Task deleted notification - Dynamic reload initiated');
        log(
          '📋 Task details: ID=$taskId, Name="$taskName", Project=$taskProjectId',
        );
        _dynamicKanbanReload(projectId, 'Task deleted', {
          'taskId': taskId,
          'taskName': taskName,
          'action': 'deleted',
          'timestamp': timestamp,
          'eventId': eventId,
        });
        break;
      case 'task_moved':
        log('📋 Task moved notification - Dynamic reload initiated');
        _dynamicKanbanReload(projectId, 'Task moved', {
          'taskId': taskId,
          'action': 'moved',
          'timestamp': timestamp,
          'eventId': eventId,
        });
        break;
      case 'project_updated':
        log('📁 Project updated notification - Dynamic reload initiated');
        _dynamicKanbanReload(projectId, 'Project updated', {
          'projectId': relevantProjectId,
          'action': 'project_updated',
          'timestamp': timestamp,
          'eventId': eventId,
        });
        break;
      case 'ai_enhancement_completed':
        log(
          '🤖 AI enhancement completed notification - Dynamic reload initiated',
        );
        final enhancementTaskId = payload?['task_id'] as String?;
        _dynamicKanbanReload(projectId, 'AI enhancement completed', {
          'taskId': enhancementTaskId,
          'action': 'ai_enhanced',
          'enhancementType': 'ai_completion',
          'timestamp': timestamp,
          'eventId': eventId,
        });
        break;
      case 'ai_enhancement_error':
        log('❌ AI enhancement error notification received');
        final errorTaskId = payload?['task_id'] as String?;
        final error = payload?['error'] as String?;
        log('❌ AI enhancement failed for task $errorTaskId: $error');
        break;
      default:
        log('ℹ️ Unhandled notification type: $notificationType');
    }
  }

  /// Handle AI enhancement notifications
  void _handleAIEnhancementNotification(
    dynamic notification,
    String projectId,
  ) {
    log('🤖 Received AI enhancement notification: ${notification.type}');

    final taskId = notification.taskId as String?;
    final affectedProjectId = notification.projectId as String?;

    if (affectedProjectId == projectId) {
      _dynamicKanbanReload(projectId, 'AI enhancement completed', {
        'taskId': taskId,
        'action': 'ai_enhanced',
        'enhancementType': 'ai_completion',
        'timestamp': DateTime.now().toIso8601String(),
        'eventId': 'ai_enhancement_${DateTime.now().millisecondsSinceEpoch}',
      });
    }
  }

  /// Dynamic kanban reload with enhanced tracking and professional handling
  void _dynamicKanbanReload(
    String projectId,
    String reason,
    Map<String, dynamic> metadata,
  ) {
    final kanbanBloc = _activeKanbanBlocs[projectId];
    if (kanbanBloc != null) {
      log('🚀 Dynamic Kanban Reload Initiated');
      log('📁 Project ID: $projectId');
      log('📋 Reason: $reason');
      log('📊 Metadata: $metadata');
      log('⏰ Reload timestamp: ${DateTime.now().toIso8601String()}');

      // Add reload event with metadata for tracking
      kanbanBloc.add(RefreshKanbanBoard(projectId));

      // Log successful reload initiation
      final taskId = metadata['taskId'];
      final taskName = metadata['taskName'];
      final action = metadata['action'];

      if (taskId != null && taskName != null) {
        log(
          '✅ Dynamic reload triggered for task: "$taskName" (ID: $taskId) - Action: $action',
        );
      } else if (taskId != null) {
        log(
          '✅ Dynamic reload triggered for task ID: $taskId - Action: $action',
        );
      } else {
        log('✅ Dynamic reload triggered for project-level change');
      }

      // Professional notification to user (can be used for snackbars, etc.)
      _notifyUserOfRealtimeUpdate(reason, metadata);
    } else {
      log(
        '❌ Dynamic reload failed: No active kanban bloc found for project $projectId',
      );
      log('📊 Available project blocs: ${_activeKanbanBlocs.keys.toList()}');
    }
  }

  /// Professional user notification for real-time updates
  void _notifyUserOfRealtimeUpdate(
    String reason,
    Map<String, dynamic> metadata,
  ) {
    final taskName = metadata['taskName'] as String?;
    final action = metadata['action'] as String?;

    String userMessage;
    switch (action) {
      case 'created':
        userMessage = taskName != null
            ? '✅ New task created: "$taskName"'
            : '✅ New task created';
        break;
      case 'updated':
        final aiEnhanced = metadata['aiEnhanced'] as bool?;
        if (aiEnhanced == true) {
          userMessage = taskName != null
              ? '🤖 AI enhanced task: "$taskName"'
              : '🤖 Task enhanced by AI';
        } else {
          userMessage = taskName != null
              ? '🔄 Task updated: "$taskName"'
              : '🔄 Task updated';
        }
        break;
      case 'deleted':
        userMessage = taskName != null
            ? '🗑️ Task deleted: "$taskName"'
            : '🗑️ Task deleted';
        break;
      case 'moved':
        userMessage = taskName != null
            ? '📋 Task moved: "$taskName"'
            : '📋 Task moved';
        break;
      case 'ai_enhanced':
        userMessage = taskName != null
            ? '🤖 AI enhancement completed: "$taskName"'
            : '🤖 AI enhancement completed';
        break;
      case 'project_updated':
        userMessage = '📁 Project updated';
        break;
      default:
        userMessage = '🔄 Board updated';
    }

    log('🔔 User notification: $userMessage');
    // This can be connected to a snackbar or toast notification system
    // For now, we're just logging it for professional tracking
  }

  /// Get current WebSocket connection status
  bool get isConnected => _webSocketService.isConnected;

  /// Get WebSocket connection status stream
  Stream<bool> get connectionStatus => _webSocketService.connectionStatus;

  /// Connect to WebSocket if not already connected
  Future<void> ensureConnected() async {
    if (!_webSocketService.isConnected) {
      log('🔌 Connecting to WebSocket...');
      await _webSocketService.connect();
    }
  }

  /// Dispose resources
  void dispose() {
    log('🗑️ Disposing RealtimeKanbanService');
    _generalNotificationSubscription?.cancel();
    _aiEnhancementSubscription?.cancel();
    _activeKanbanBlocs.clear();
  }
}

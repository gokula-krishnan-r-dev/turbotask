import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

import '../../features/todos/data/models/ai_task_models.dart';
import '../auth/auth_manager.dart';

@singleton
class WebSocketService {
  final AuthManager _authManager;
  WebSocketChannel? _channel;
  StreamSubscription? _subscription;
  Timer? _heartbeatTimer;
  Timer? _reconnectTimer;

  bool _isConnected = false;
  bool _shouldReconnect = true;
  int _reconnectAttempts = 0;
  static const int _maxReconnectAttempts = 5;
  static const Duration _reconnectInterval = Duration(seconds: 5);
  static const Duration _heartbeatInterval = Duration(seconds: 30);

  // Stream controllers for different types of notifications
  final StreamController<AIEnhancementNotification> _aiEnhancementController =
      StreamController<AIEnhancementNotification>.broadcast();
  final StreamController<Map<String, dynamic>> _generalNotificationController =
      StreamController<Map<String, dynamic>>.broadcast();
  final StreamController<bool> _connectionStatusController =
      StreamController<bool>.broadcast();

  // Public streams
  Stream<AIEnhancementNotification> get aiEnhancementNotifications =>
      _aiEnhancementController.stream;
  Stream<Map<String, dynamic>> get generalNotifications =>
      _generalNotificationController.stream;
  Stream<bool> get connectionStatus => _connectionStatusController.stream;

  WebSocketService(this._authManager);

  /// Connect to WebSocket server
  Future<void> connect() async {
    if (_isConnected && _channel != null) {
      log('WebSocket already connected');
      return;
    }

    _shouldReconnect = true;
    await _connect();
  }

  Future<void> _connect() async {
    try {
      final tokens = _authManager.currentTokens;
      if (tokens?.accessToken == null) {
        log('No auth token available for WebSocket connection');
        return;
      }

      // Replace with your actual WebSocket URL
      const baseUrl =
          'ws://localhost:8080'; // Update this to match your backend
      final uri = Uri.parse(
        '$baseUrl/api/v1/ws/connect?token=${tokens!.accessToken}',
      );

      log('Connecting to WebSocket: $uri');
      _channel = WebSocketChannel.connect(uri);

      await _channel!.ready;

      _isConnected = true;
      _reconnectAttempts = 0;
      _connectionStatusController.add(true);

      log('WebSocket connected successfully');

      // Start listening to messages
      _subscription = _channel!.stream.listen(
        _handleMessage,
        onError: _handleError,
        onDone: _handleDisconnection,
      );

      // Start heartbeat
      _startHeartbeat();
    } catch (e) {
      log('WebSocket connection failed: $e');
      _isConnected = false;
      _connectionStatusController.add(false);
      _scheduleReconnect();
    }
  }

  /// Handle incoming WebSocket messages
  void _handleMessage(dynamic message) {
    try {
      final data = jsonDecode(message as String) as Map<String, dynamic>;
      log('🔔 WebSocket message received: $message $data');

      final messageType = data['type'] as String?;
      final payload = data['payload'] as Map<String, dynamic>?;

      log('📝 Message type: $messageType');
      log('📦 Payload: $payload');

      switch (messageType) {
        case 'todo_created':
          log('✅ Todo created message received');
          _generalNotificationController.add(data);
          break;
        case 'todo_updated':
          log('🔄 Todo updated message received');
          _generalNotificationController.add(data);
          break;
        case 'todo_deleted':
          log('🗑️ Todo deleted message received');
          _generalNotificationController.add(data);
          break;
        case 'notification':
          log('🔔 Notification message received');
          _handleNotificationMessage(payload ?? {});
          break;
        case 'ai_enhancement_completed':
        case 'ai_enhancement_error':
          log('🤖 AI enhancement message received: $messageType');
          if (messageType != null) {
            _handleAIEnhancementMessage(messageType, payload ?? {});
          }
          // Also forward to general notifications for kanban updates
          _generalNotificationController.add(data);
          break;
        case 'pong':
          log('💓 Heartbeat pong received');
          break;
        case 'connect':
          log('🔗 Connection message received');
          break;
        case 'error':
          log('❌ Error message received: $payload');
          break;
        default:
          log('❓ Unknown message type: $messageType');
          _generalNotificationController.add(data);
      }
    } catch (e) {
      log('💥 Error parsing WebSocket message: $e');
      log('📄 Raw message: $message');
    }
  }

  /// Handle notification messages
  void _handleNotificationMessage(Map<String, dynamic> payload) {
    final notificationType = payload['type'] as String?;

    if (notificationType != null &&
        (notificationType == 'ai_enhancement_completed' ||
            notificationType == 'ai_enhancement_error')) {
      _handleAIEnhancementMessage(notificationType, payload);
    } else {
      _generalNotificationController.add(payload);
    }
  }

  /// Handle AI enhancement notifications
  void _handleAIEnhancementMessage(String type, Map<String, dynamic> payload) {
    try {
      final notification = AIEnhancementNotification.fromJson({
        'type': type,
        ...payload,
      });

      log(
        'AI Enhancement notification: ${notification.type} for task ${notification.taskId}',
      );
      _aiEnhancementController.add(notification);
    } catch (e) {
      log('Error parsing AI enhancement notification: $e');
    }
  }

  /// Handle WebSocket errors
  void _handleError(Object error) {
    log('WebSocket error: $error');
    _isConnected = false;
    _connectionStatusController.add(false);
    _scheduleReconnect();
  }

  /// Handle WebSocket disconnection
  void _handleDisconnection() {
    log('WebSocket disconnected');
    _isConnected = false;
    _connectionStatusController.add(false);
    _stopHeartbeat();
    _scheduleReconnect();
  }

  /// Schedule reconnection attempt
  void _scheduleReconnect() {
    if (!_shouldReconnect || _reconnectAttempts >= _maxReconnectAttempts) {
      log('Max reconnect attempts reached or reconnection disabled');
      return;
    }

    _reconnectAttempts++;
    log('Scheduling reconnection attempt $_reconnectAttempts');

    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(_reconnectInterval, () {
      if (_shouldReconnect) {
        _connect();
      }
    });
  }

  /// Start heartbeat to keep connection alive
  void _startHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = Timer.periodic(_heartbeatInterval, (timer) {
      if (_isConnected && _channel != null) {
        try {
          _channel!.sink.add(
            jsonEncode({
              'type': 'ping',
              'payload': {'message': 'ping'},
              'timestamp': DateTime.now().toUtc().toIso8601String(),
              'event_id': DateTime.now().millisecondsSinceEpoch.toString(),
            }),
          );
          log('💓 Sent heartbeat ping');
        } catch (e) {
          log('Error sending heartbeat: $e');
        }
      }
    });
  }

  /// Stop heartbeat timer
  void _stopHeartbeat() {
    _heartbeatTimer?.cancel();
    _heartbeatTimer = null;
  }

  /// Send a message through WebSocket
  void sendMessage(Map<String, dynamic> message) {
    if (_isConnected && _channel != null) {
      try {
        // Ensure message has required fields for backend compatibility
        final formattedMessage = {
          'type': message['type'] ?? 'unknown',
          'payload': message['payload'] ?? {},
          'timestamp':
              message['timestamp'] ?? DateTime.now().toUtc().toIso8601String(),
          'event_id':
              message['event_id'] ??
              DateTime.now().millisecondsSinceEpoch.toString(),
          ...message, // Include any additional fields
        };

        _channel!.sink.add(jsonEncode(formattedMessage));
        log('📤 Sent WebSocket message: ${formattedMessage['type']}');
      } catch (e) {
        log('Error sending WebSocket message: $e');
      }
    } else {
      log('Cannot send message: WebSocket not connected');
    }
  }

  /// Disconnect from WebSocket
  Future<void> disconnect() async {
    _shouldReconnect = false;
    _reconnectTimer?.cancel();
    _stopHeartbeat();

    if (_channel != null) {
      try {
        await _subscription?.cancel();
        await _channel!.sink.close(status.normalClosure);
      } catch (e) {
        log('Error closing WebSocket: $e');
      }
    }

    _isConnected = false;
    _connectionStatusController.add(false);
    _channel = null;
    _subscription = null;

    log('WebSocket disconnected');
  }

  /// Get current connection status
  bool get isConnected => _isConnected;

  /// Dispose resources
  void dispose() {
    disconnect();
    _aiEnhancementController.close();
    _generalNotificationController.close();
    _connectionStatusController.close();
  }
}

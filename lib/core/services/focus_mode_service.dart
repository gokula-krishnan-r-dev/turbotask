import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../features/todos/domain/entities/todo.dart';

/// Service to manage focus mode sessions and active tasks
@singleton
class FocusModeService extends ChangeNotifier {
  Todo? _activeTask;
  Timer? _sessionTimer;
  Duration _elapsedTime = Duration.zero;
  bool _isSessionActive = false;
  DateTime? _sessionStartTime;

  // Getters
  Todo? get activeTask => _activeTask;
  Duration get elapsedTime => _elapsedTime;
  bool get isSessionActive => _isSessionActive;
  DateTime? get sessionStartTime => _sessionStartTime;

  /// Start a focus session with a specific task
  void startFocusSession(Todo task) {
    print(
      'FocusModeService: Starting focus session for task: ${task.taskName}',
    );

    _activeTask = task;
    _sessionStartTime = DateTime.now();
    _elapsedTime = Duration.zero;
    _isSessionActive = true;

    // Start the timer that updates every second
    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sessionStartTime != null) {
        _elapsedTime = DateTime.now().difference(_sessionStartTime!);
        notifyListeners();
      }
    });

    notifyListeners();
  }

  /// Stop the current focus session
  void stopFocusSession() {
    print('FocusModeService: Stopping focus session');

    _sessionTimer?.cancel();
    _sessionTimer = null;
    _isSessionActive = false;

    notifyListeners();
  }

  /// Pause the current focus session
  void pauseFocusSession() {
    print('FocusModeService: Pausing focus session');

    _sessionTimer?.cancel();
    _sessionTimer = null;
    _isSessionActive = false;

    notifyListeners();
  }

  /// Resume the paused focus session
  void resumeFocusSession() {
    if (_activeTask == null) return;

    print('FocusModeService: Resuming focus session');

    _isSessionActive = true;

    // Resume timer from current elapsed time
    final currentElapsed = _elapsedTime;
    _sessionStartTime = DateTime.now().subtract(currentElapsed);

    _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sessionStartTime != null) {
        _elapsedTime = DateTime.now().difference(_sessionStartTime!);
        notifyListeners();
      }
    });

    notifyListeners();
  }

  /// Switch to a different task
  void switchTask(Todo newTask) {
    print('FocusModeService: Switching to task: ${newTask.taskName}');

    stopFocusSession();
    startFocusSession(newTask);
  }

  /// Get formatted time string (HH:MM:SS)
  String get formattedTime {
    final hours = _elapsedTime.inHours;
    final minutes = (_elapsedTime.inMinutes % 60);
    final seconds = (_elapsedTime.inSeconds % 60);

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  /// Get session statistics
  Map<String, dynamic> getSessionStats() {
    return {
      'taskId': _activeTask?.id,
      'taskName': _activeTask?.taskName,
      'elapsedTime': _elapsedTime,
      'formattedTime': formattedTime,
      'isActive': _isSessionActive,
      'startTime': _sessionStartTime,
    };
  }

  /// Reset the service
  void reset() {
    print('FocusModeService: Resetting service');

    stopFocusSession();
    _activeTask = null;
    _elapsedTime = Duration.zero;
    _sessionStartTime = null;

    notifyListeners();
  }

  @override
  void dispose() {
    _sessionTimer?.cancel();
    super.dispose();
  }
}

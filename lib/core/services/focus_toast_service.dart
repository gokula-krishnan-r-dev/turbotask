import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

/// Service to manage focus timer toast notifications with sound
@singleton
class FocusToastService extends ChangeNotifier {
  Timer? _toastTimer;
  Timer? _dismissTimer;
  bool _isToastVisible = false;
  int _elapsedSeconds = 0;
  int _currentMessageIndex = 0;
  bool _respectFocusMode = true;

  // Configuration
  static const int intervalSeconds = 5;
  static const int milestoneMinutes = 10;

  // Toast state
  String _currentTitle = '';
  String _currentSubtitle = '';
  bool _isMilestone = false;

  // Getters
  bool get isToastVisible => _isToastVisible;
  String get currentTitle => _currentTitle;
  String get currentSubtitle => _currentSubtitle;
  bool get isMilestone => _isMilestone;
  bool get respectFocusMode => _respectFocusMode;

  // Sound players
  static const MethodChannel _channel = MethodChannel(
    'com.turbotask/native_sound',
  );

  // Regular toast messages
  final List<Map<String, String>> _regularMessages = [
    {"title": "Stay focused", "subtitle": "You're doing great—keep going."},
    {"title": "Focus on the task", "subtitle": "Tiny ping to stay in flow."},
    {"title": "Back to flow", "subtitle": "Just a nudge—eyes on the task."},
  ];

  // Elapsed time message template
  final Map<String, String> _elapsedTemplate = {
    "title": "Stay focused · {elapsed}",
    "subtitle": "Minimal nudge—keep momentum.",
  };

  // Milestone messages
  final Map<String, String> _milestone10 = {
    "title": "⭐ Focus milestone",
    "subtitle": "10 minutes completed. Nice work—keep it rolling!",
  };

  /// Start the focus toast service
  void startToasts() {
    if (_toastTimer != null) {
      stopToasts();
    }

    _elapsedSeconds = 0;
    _currentMessageIndex = 0;

    // Schedule toasts at regular intervals
    _toastTimer = Timer.periodic(const Duration(seconds: intervalSeconds), (
      timer,
    ) {
      _elapsedSeconds += intervalSeconds;
      _showToast();
    });

    print('FocusToastService: Started toast notifications');
  }

  /// Stop the focus toast service
  void stopToasts() {
    _toastTimer?.cancel();
    _toastTimer = null;
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _isToastVisible = false;
    _elapsedSeconds = 0;

    print('FocusToastService: Stopped toast notifications');
    notifyListeners();
  }

  /// Pause toast notifications (when focus timer is paused)
  void pauseToasts() {
    _toastTimer?.cancel();
    _toastTimer = null;
    _dismissTimer?.cancel();
    _dismissTimer = null;
    _isToastVisible = false;

    print('FocusToastService: Paused toast notifications');
    notifyListeners();
  }

  /// Resume toast notifications (when focus timer is resumed)
  void resumeToasts() {
    if (_toastTimer != null) {
      return;
    }

    // Schedule toasts at regular intervals
    _toastTimer = Timer.periodic(const Duration(seconds: intervalSeconds), (
      timer,
    ) {
      _elapsedSeconds += intervalSeconds;
      _showToast();
    });

    print('FocusToastService: Resumed toast notifications');
  }

  /// Set whether to respect system focus/do not disturb mode
  void setRespectFocusMode(bool respect) {
    _respectFocusMode = respect;
  }

  /// Show a toast notification
  void _showToast() {
    // Check if milestone reached
    final int elapsedMinutes = _elapsedSeconds ~/ 60;
    final bool isMilestoneReached =
        elapsedMinutes > 0 &&
        elapsedMinutes % milestoneMinutes == 0 &&
        _elapsedSeconds % 60 == 0;

    // Select message based on milestone or regular rotation
    if (isMilestoneReached) {
      _isMilestone = true;
      _currentTitle = _milestone10["title"]!;
      _currentSubtitle = _milestone10["subtitle"]!.replaceAll(
        "{minutes}",
        elapsedMinutes.toString(),
      );
      _playSound(true);
    } else {
      _isMilestone = false;

      // Rotate through regular messages or use elapsed time template
      if (_elapsedSeconds % 15 == 0) {
        // Use elapsed time template every 15 seconds
        final String elapsedFormatted = _formatElapsedTime();
        _currentTitle = _elapsedTemplate["title"]!.replaceAll(
          "{elapsed}",
          elapsedFormatted,
        );
        _currentSubtitle = _elapsedTemplate["subtitle"]!;
      } else {
        // Rotate through regular messages
        final message = _regularMessages[_currentMessageIndex];
        _currentTitle = message["title"]!;
        _currentSubtitle = message["subtitle"]!;

        // Increment message index for next time
        _currentMessageIndex =
            (_currentMessageIndex + 1) % _regularMessages.length;
      }

      _playSound(false);
    }

    _isToastVisible = true;
    notifyListeners();

    // Auto-dismiss after 2 seconds
    _dismissTimer?.cancel();
    _dismissTimer = Timer(const Duration(milliseconds: 1800), () {
      _isToastVisible = false;
      notifyListeners();
    });
  }

  /// Format elapsed time as MM:SS
  String _formatElapsedTime() {
    final int minutes = _elapsedSeconds ~/ 60;
    final int seconds = _elapsedSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  /// Play notification sound
  Future<void> _playSound(bool isMilestone) async {
    if (!Platform.isMacOS) return;

    try {
      final String soundType = isMilestone ? 'milestone' : 'regular';
      await _channel.invokeMethod('playSound', {'type': soundType});
    } catch (e) {
      print('FocusToastService: Failed to play sound: $e');
    }
  }

  /// Get configuration for implementation
  Map<String, dynamic> getConfiguration() {
    return {
      "intervalSeconds": intervalSeconds,
      "respectFocusMode": _respectFocusMode,
      "sounds": {"regular": "chime_soft", "milestone": "chime_bright"},
      "positions": {"toast": "top-center"},
      "copy": {
        "regular": _regularMessages,
        "elapsedTemplate": _elapsedTemplate,
        "milestone10": _milestone10,
      },
    };
  }

  @override
  void dispose() {
    _toastTimer?.cancel();
    _dismissTimer?.cancel();
    super.dispose();
  }
}

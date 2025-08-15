import 'dart:async';
import 'package:flutter/services.dart';

class FocusToastPlugin {
  static const MethodChannel _channel = MethodChannel('focus_toast_plugin');

  static Future<void> playSound(String type) async {
    await _channel.invokeMethod('playSound', {'type': type});
  }

  static Future<void> createToastWindow() async {
    await _channel.invokeMethod('createToastWindow');
  }

  static Future<void> showToastWindow(int viewId) async {
    await _channel.invokeMethod('showToastWindow', {'viewId': viewId});
  }

  static Future<void> closeToastWindow() async {
    await _channel.invokeMethod('closeToastWindow');
  }
}

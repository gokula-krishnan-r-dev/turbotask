import 'dart:io';
import 'package:flutter/material.dart';
import 'package:turbotask/features/projects/presentation/pages/projects_home_page.dart';
import 'package:window_manager/window_manager.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'floating_panel_settings.dart';

/// Manager for floating panel window operations
class FloatingPanelManager {
  static const double _panelWidth = 380.0;
  static const double _screenMargin = 0.0;
  static const double _topMargin = 40; // Space for menu bar
  static const double _bottomMargin = 40; // Space for dock
  static const String _panelTitle = 'TurboTask Panel';

  static bool _isInitialized = false;
  static bool _isPanelVisible = false;

  /// Initialize floating panel for macOS
  static Future<void> initializeFloatingPanel(
    BuildContext context, {
    bool isFocusMode = false,
  }) async {
    if (!Platform.isMacOS || _isInitialized) return;

    await windowManager.ensureInitialized();

    // Get screen dimensions to calculate height
    final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();

    // Determine window height based on mode
    final screenHeight = isFocusMode
        ? 150.0 // Compact height for Focus Mode
        : primaryDisplay.size.height; // Full height for normal panel

    print(
      "FloatingPanelManager: isFocusMode=$isFocusMode, screenHeight=$screenHeight",
    );

    final panelHeight = screenHeight - _topMargin - _bottomMargin;

    // Configure window options for floating panel
    final WindowOptions windowOptions = WindowOptions(
      size: Size(_panelWidth, panelHeight),
      center: false,
      backgroundColor: Colors.transparent,
      skipTaskbar: true,
      titleBarStyle: TitleBarStyle.hidden,
      alwaysOnTop: true,
      windowButtonVisibility: false,
      fullScreen: false,
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await positionPanelOnScreen();
      await windowManager.setTitle(_panelTitle);
      await windowManager.show();
      await windowManager.focus();
      _isPanelVisible = true;
    });

    _isInitialized = true;
  }

  //initialize floating panel for mac os stop and make it normal window
  static Future<void> initializeFloatingPanelStop() async {
    if (!Platform.isMacOS || _isInitialized) return;

    await windowManager.ensureInitialized();

    // Get screen dimensions to calculate full height
    final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();
    final screenHeight = primaryDisplay.size.height;
    final panelHeight = screenHeight - _topMargin - _bottomMargin;

    // Configure window options for floating panel
    final WindowOptions windowOptions = WindowOptions(
      size: Size(_panelWidth, panelHeight),
      center: false,
      backgroundColor: Colors.transparent,
      skipTaskbar: true,
      titleBarStyle: TitleBarStyle.hidden,
      alwaysOnTop: false,
      fullScreen: false,
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
      _isPanelVisible = true;
    });

    _isInitialized = true;
  }

  /// Position panel on screen based on user preference
  static Future<void> positionPanelOnScreen() async {
    if (!Platform.isMacOS) return;

    try {
      final position = await FloatingPanelSettings.getPanelPosition();
      final primaryDisplay = await screenRetriever.getPrimaryDisplay();

      {
        final screenWidth = primaryDisplay.size.width;

        double x, y;

        // Position based on user preference
        if (position == PanelPosition.left) {
          x = _screenMargin;
        } else {
          x = screenWidth - _panelWidth - _screenMargin;
        }

        // Position at top with margin for menu bar
        y = _topMargin;

        await windowManager.setPosition(Offset(x, y));
      }
    } catch (e) {
      debugPrint('Error positioning panel: $e');
      // Fallback position
      await windowManager.setPosition(const Offset(50, 100));
    }
  }

  /// Update panel position when settings change
  static Future<void> updatePanelPosition(PanelPosition newPosition) async {
    if (!Platform.isMacOS || !_isInitialized) return;

    await FloatingPanelSettings.setPanelPosition(newPosition);
    await positionPanelOnScreen();
  }

  /// Show the floating panel
  static Future<void> showPanel() async {
    if (!Platform.isMacOS || !_isInitialized) return;

    //close current Windos and open a floating panel

    await windowManager.show();
    await windowManager.focus();
    await FloatingPanelSettings.setPanelVisibility(true);
    _isPanelVisible = true;
  }

  /// Hide the floating panel
  static Future<void> hidePanel(BuildContext context) async {
    if (!Platform.isMacOS || !_isInitialized) return;
    await initializeFloatingPanelStop();
    //open a new window and navigate to Home page
    if (context.mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const ProjectsHomePage()),
        (route) => false,
      );
    }
    await FloatingPanelSettings.setPanelVisibility(false);
    _isPanelVisible = false;
  }

  /// Toggle panel visibility
  static Future<void> togglePanel(BuildContext context) async {
    if (_isPanelVisible) {
      await hidePanel(context);
    } else {
      await showPanel();
    }
  }

  /// Check if panel is visible
  static bool get isPanelVisible => _isPanelVisible;

  /// Check if panel is initialized
  static bool get isInitialized => _isInitialized;

  /// Set panel to always on top
  static Future<void> setAlwaysOnTop(bool alwaysOnTop) async {
    if (!Platform.isMacOS || !_isInitialized) return;
    await windowManager.setAlwaysOnTop(alwaysOnTop);
  }

  /// Focus the panel window
  static Future<void> focusPanel() async {
    if (!Platform.isMacOS || !_isInitialized) return;
    await windowManager.focus();
  }

  /// Get panel size
  static Future<Size> get panelSize async {
    final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();
    final screenHeight = primaryDisplay.size.height;
    final panelHeight = screenHeight - _topMargin - _bottomMargin;
    return Size(_panelWidth, panelHeight);
  }

  /// Resize panel for Focus Mode
  static Future<void> resizePanelForFocusMode(bool isFocusMode) async {
    if (!Platform.isMacOS || !_isInitialized) return;

    try {
      final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();

      // Determine window height based on mode
      final screenHeight = isFocusMode
          ? 150.0 // Compact height for Focus Mode
          : primaryDisplay.size.height; // Full height for normal panel

      final panelHeight = screenHeight - _topMargin - _bottomMargin;

      print(
        "FloatingPanelManager: Resizing panel - isFocusMode=$isFocusMode, screenHeight=$screenHeight, panelHeight=$panelHeight",
      );

      // Resize the window
      await windowManager.setSize(Size(_panelWidth, panelHeight));

      // Reposition to ensure it stays in the correct place
      await positionPanelOnScreen();
    } catch (e) {
      debugPrint('Error resizing panel for focus mode: $e');
    }
  }

  /// Get panel bounds for positioning calculations
  static Future<Rect?> getPanelBounds() async {
    if (!Platform.isMacOS || !_isInitialized) return null;

    try {
      final position = await windowManager.getPosition();
      final primaryDisplay = await ScreenRetriever.instance.getPrimaryDisplay();
      final screenHeight = primaryDisplay.size.height;
      final panelHeight = screenHeight - _topMargin - _bottomMargin;
      return Rect.fromLTWH(position.dx, position.dy, _panelWidth, panelHeight);
    } catch (e) {
      debugPrint('Error getting panel bounds: $e');
      return null;
    }
  }
}

import 'package:shared_preferences/shared_preferences.dart';

/// Panel position enum
enum PanelPosition { left, right }

/// Service for managing floating panel settings and preferences
class FloatingPanelSettings {
  static const String _panelPositionKey = 'floating_panel_position';
  static const String _defaultProjectKey = 'default_project_id';
  static const String _panelVisibilityKey = 'floating_panel_visible';

  /// Get panel position from local storage
  static Future<PanelPosition> getPanelPosition() async {
    final prefs = await SharedPreferences.getInstance();
    final positionString = prefs.getString(_panelPositionKey) ?? 'right';
    return positionString == 'left' ? PanelPosition.left : PanelPosition.right;
  }

  /// Save panel position to local storage
  static Future<void> setPanelPosition(PanelPosition position) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _panelPositionKey,
      position == PanelPosition.left ? 'left' : 'right',
    );
  }

  /// Get default project ID
  static Future<String?> getDefaultProjectId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_defaultProjectKey);
  }

  /// Save default project ID
  static Future<void> setDefaultProjectId(String projectId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_defaultProjectKey, projectId);
  }

  /// Get panel visibility
  static Future<bool> getPanelVisibility() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_panelVisibilityKey) ?? true;
  }

  /// Set panel visibility
  static Future<void> setPanelVisibility(bool visible) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_panelVisibilityKey, visible);
  }

  /// Clear all settings
  static Future<void> clearSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_panelPositionKey);
    await prefs.remove(_defaultProjectKey);
    await prefs.remove(_panelVisibilityKey);
  }
}

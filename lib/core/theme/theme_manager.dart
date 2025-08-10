import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Manages theme state and persistence across app sessions.
/// Handles light/dark mode switching and system theme detection.
class ThemeManager extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';

  ThemeMode _themeMode = ThemeMode.system;
  late SharedPreferences _prefs;

  ThemeMode get themeMode => _themeMode;

  /// Initialize the theme manager and load saved theme preference
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    await _loadTheme();
  }

  /// Load theme preference from shared preferences
  Future<void> _loadTheme() async {
    final themeModeIndex = _prefs.getInt(_themeKey);
    if (themeModeIndex != null) {
      _themeMode = ThemeMode.values[themeModeIndex];
      notifyListeners();
    }
  }

  /// Save theme preference to shared preferences
  Future<void> _saveTheme() async {
    await _prefs.setInt(_themeKey, _themeMode.index);
  }

  /// Switch to light theme
  Future<void> setLightTheme() async {
    _themeMode = ThemeMode.light;
    await _saveTheme();
    notifyListeners();
    _updateSystemUIOverlay(Brightness.light);
  }

  /// Switch to dark theme
  Future<void> setDarkTheme() async {
    _themeMode = ThemeMode.dark;
    await _saveTheme();
    notifyListeners();
    _updateSystemUIOverlay(Brightness.dark);
  }

  /// Use system theme
  Future<void> setSystemTheme() async {
    _themeMode = ThemeMode.system;
    await _saveTheme();
    notifyListeners();
    _updateSystemUIOverlay(null);
  }

  /// Toggle between light and dark theme
  Future<void> toggleTheme() async {
    if (_themeMode == ThemeMode.light) {
      await setDarkTheme();
    } else {
      await setLightTheme();
    }
  }

  /// Update system UI overlay style based on theme
  void _updateSystemUIOverlay(Brightness? brightness) {
    final currentBrightness =
        brightness ??
        WidgetsBinding.instance.platformDispatcher.platformBrightness;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: currentBrightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
        statusBarBrightness: currentBrightness,
        systemNavigationBarColor: currentBrightness == Brightness.dark
            ? const Color(0xFF121212)
            : Colors.white,
        systemNavigationBarIconBrightness: currentBrightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
  }

  /// Check if current theme is dark
  bool isDarkMode(BuildContext context) {
    if (_themeMode == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
    return _themeMode == ThemeMode.dark;
  }

  /// Get the appropriate theme brightness
  Brightness getBrightness(BuildContext context) {
    if (_themeMode == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness;
    }
    return _themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light;
  }
}

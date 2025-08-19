import 'package:flutter/material.dart';

/// Central definition of all colors used throughout the app.
/// This ensures consistency and makes theme switching easier.
class AppColors {
  AppColors._();

  // Core colors
  static const Color black = Color(0xFF0F0F10);
  static const Color white = Color(0xFFF7F7F8);

  // Gray scale
  static const Color gray900 = Color(0xFF121212);
  static const Color gray800 = Color(0xFF1E1E1E);
  static const Color gray700 = Color(0xFF2A2A2A);
  static const Color gray600 = Color(0xFF2E2E2E);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray50 = Color(0xFFF9FAFB);

  // Brand colors - matching the mockup gradient theme
  static const Color violet = Color(0xFFB78BFF);
  static const Color mint = Color(0xFF8DE0C8);
  static const Color teal = Color(0xFF3AC3B6);
  static const Color softGreen = Color(0xFFBDE08C);

  // Additional UI colors
  static const Color blue = Color(0xFF3B82F6);
  static const Color orange = Color(0xFFF97316);
  static const Color purple = Color(0xFF8B5CF6);

  // Semantic colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);
  static const Color primary = blue;

  // UI colors
  static const Color background = Color(0xFFF9FAFB);
  static const Color border = Color(0xFFE5E7EB);

  // Text colors for light theme
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);

  // Text colors for dark theme
  static const Color textPrimaryDark = Color(0xFFF9FAFB);
  static const Color textSecondaryDark = Color(0xFFD1D5DB);
  static const Color textTertiaryDark = Color(0xFF9CA3AF);

  // Background colors
  static const Color backgroundLight = white;
  static const Color backgroundDark = gray900;
  static const Color surfaceLight = white;
  static const Color surfaceDark = gray800;
}

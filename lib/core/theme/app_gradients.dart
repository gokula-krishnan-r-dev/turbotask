import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Central definition of gradients used throughout the app.
/// This ensures visual consistency especially for buttons and backgrounds.
class AppGradients {
  AppGradients._();

  /// Primary gradient used for the app logo and main CTAs
  /// Violet to mint gradient as shown in the mockup
  static const LinearGradient primary = LinearGradient(
    colors: [AppColors.violet, AppColors.mint],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Alternative primary gradient with different direction
  static const LinearGradient primaryHorizontal = LinearGradient(
    colors: [AppColors.violet, AppColors.mint],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  /// Secondary gradient for additional UI elements
  static const LinearGradient secondary = LinearGradient(
    colors: [AppColors.mint, AppColors.softGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Subtle gradient for backgrounds
  static const LinearGradient subtle = LinearGradient(
    colors: [AppColors.gray50, AppColors.white],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Dark mode subtle gradient
  static const LinearGradient subtleDark = LinearGradient(
    colors: [AppColors.gray900, AppColors.gray800],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  /// Success gradient
  static const LinearGradient success = LinearGradient(
    colors: [AppColors.success, AppColors.teal],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Warning gradient
  static const LinearGradient warning = LinearGradient(
    colors: [AppColors.warning, Color(0xFFFBBF24)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Error gradient
  static const LinearGradient error = LinearGradient(
    colors: [AppColors.error, Color(0xFFF87171)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

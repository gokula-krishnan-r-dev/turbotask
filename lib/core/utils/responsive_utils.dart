import 'package:flutter/material.dart';

/// Utility class for responsive design and layout calculations.
/// Provides helpers for desktop-specific layouts and breakpoints.
class ResponsiveUtils {
  ResponsiveUtils._();

  // Breakpoints for responsive design
  static const double mobileBreakpoint = 640;
  static const double tabletBreakpoint = 768;
  static const double desktopBreakpoint = 1024;
  static const double largeDesktopBreakpoint = 1280;

  /// Get screen width
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Get screen height
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Check if current screen is mobile
  static bool isMobile(BuildContext context) {
    return getScreenWidth(context) < mobileBreakpoint;
  }

  /// Check if current screen is tablet
  static bool isTablet(BuildContext context) {
    final width = getScreenWidth(context);
    return width >= mobileBreakpoint && width < desktopBreakpoint;
  }

  /// Check if current screen is iPad-sized
  static bool isIPad(BuildContext context) {
    final width = getScreenWidth(context);
    final height = getScreenHeight(context);
    // iPad dimensions: 768x1024 (portrait), 1024x768 (landscape)
    return (width >= 768 && width <= 1024) || (height >= 768 && height <= 1024);
  }

  /// Check if current screen is desktop
  static bool isDesktop(BuildContext context) {
    return getScreenWidth(context) >= desktopBreakpoint;
  }

  /// Check if current screen is large desktop
  static bool isLargeDesktop(BuildContext context) {
    return getScreenWidth(context) >= largeDesktopBreakpoint;
  }

  /// Get responsive padding based on screen size
  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.all(16);
    } else if (isTablet(context)) {
      return const EdgeInsets.all(24);
    } else {
      return const EdgeInsets.all(32);
    }
  }

  /// Get responsive horizontal padding
  static EdgeInsets getResponsiveHorizontalPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 16);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 32);
    } else {
      return const EdgeInsets.symmetric(horizontal: 48);
    }
  }

  /// Get maximum content width for centering content
  static double getMaxContentWidth(BuildContext context) {
    if (isMobile(context)) {
      return double.infinity;
    } else if (isTablet(context)) {
      return 600;
    } else {
      return 800;
    }
  }

  /// Get responsive card width
  static double getCardWidth(BuildContext context) {
    final screenWidth = getScreenWidth(context);
    if (isMobile(context)) {
      return screenWidth - 32; // 16px padding on each side
    } else if (isTablet(context)) {
      return 400;
    } else {
      return 450;
    }
  }

  /// Get responsive dialog width
  static double getDialogWidth(BuildContext context) {
    if (isMobile(context)) {
      return getScreenWidth(context) * 0.9;
    } else if (isTablet(context)) {
      return 500;
    } else {
      return 600;
    }
  }

  /// Get responsive font size multiplier
  static double getFontSizeMultiplier(BuildContext context) {
    if (isMobile(context)) {
      return 1.0;
    } else if (isTablet(context)) {
      return 1.1;
    } else {
      return 1.2;
    }
  }

  /// Get responsive spacing
  static double getResponsiveSpacing(BuildContext context, double baseSpacing) {
    if (isMobile(context)) {
      return baseSpacing;
    } else if (isTablet(context)) {
      return baseSpacing * 1.2;
    } else {
      return baseSpacing * 1.4;
    }
  }

  /// Get responsive border radius
  static double getResponsiveBorderRadius(
    BuildContext context,
    double baseRadius,
  ) {
    if (isMobile(context)) {
      return baseRadius;
    } else {
      return baseRadius * 1.2;
    }
  }

  /// Wrap widget with responsive constraints
  static Widget wrapWithResponsiveConstraints(
    BuildContext context,
    Widget child, {
    double? maxWidth,
    bool center = true,
  }) {
    final effectiveMaxWidth = maxWidth ?? getMaxContentWidth(context);

    Widget constrainedChild = ConstrainedBox(
      constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
      child: child,
    );

    if (center && !isMobile(context)) {
      constrainedChild = Center(child: constrainedChild);
    }

    return constrainedChild;
  }

  /// Get adaptive logo size based on screen size
  static double getLogoSize(BuildContext context) {
    if (isMobile(context)) {
      return 80;
    } else if (isTablet(context) || isIPad(context)) {
      return 96;
    } else {
      return 112;
    }
  }

  /// Get adaptive input field height
  static double getInputFieldHeight(BuildContext context) {
    if (isMobile(context)) {
      return 52;
    } else if (isTablet(context) || isIPad(context)) {
      return 56;
    } else {
      return 60;
    }
  }

  /// Get adaptive button height
  static double getButtonHeight(BuildContext context) {
    if (isMobile(context)) {
      return 50;
    } else if (isTablet(context) || isIPad(context)) {
      return 54;
    } else {
      return 56;
    }
  }

  /// Get adaptive button width for mobile
  static double getButtonWidth(BuildContext context) {
    if (isMobile(context)) {
      return double.infinity;
    } else if (isTablet(context) || isIPad(context)) {
      return 320;
    } else {
      return 280;
    }
  }

  /// Get adaptive form max width
  static double getFormMaxWidth(BuildContext context) {
    if (isMobile(context)) {
      return double.infinity;
    } else if (isTablet(context) || isIPad(context)) {
      return 480;
    } else {
      return 540; // Slightly narrower for better centering on desktop
    }
  }

  /// Get responsive layout for forms with better mobile/tablet support
  static Widget getResponsiveFormLayout(
    BuildContext context,
    List<Widget> children, {
    double? maxWidth,
  }) {
    final effectiveMaxWidth = maxWidth ?? getFormMaxWidth(context);
    final screenHeight = getScreenHeight(context);

    // For desktop, use a more centered approach
    if (isDesktop(context)) {
      return Scaffold(
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: effectiveMaxWidth,
              maxHeight:
                  screenHeight * 0.9, // Limit height for better centering
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 48,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: children,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // For mobile/tablet, use SafeArea with full height
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: effectiveMaxWidth,
            minHeight: screenHeight,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: getResponsivePadding(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Get adaptive OTP field size
  static double getOtpFieldSize(BuildContext context) {
    if (isMobile(context)) {
      return 48;
    } else if (isTablet(context) || isIPad(context)) {
      return 56;
    } else {
      return 60;
    }
  }

  /// Get adaptive OTP field spacing
  static double getOtpFieldSpacing(BuildContext context) {
    if (isMobile(context)) {
      return 8;
    } else if (isTablet(context) || isIPad(context)) {
      return 12;
    } else {
      return 16;
    }
  }

  /// Get kanban column width for project detail page
  static double getColumnWidth(BuildContext context) {
    if (isMobile(context)) {
      return getScreenWidth(context) * 0.85; // 85% of screen width on mobile
    } else if (isTablet(context)) {
      return 320;
    } else {
      return 350;
    }
  }
}

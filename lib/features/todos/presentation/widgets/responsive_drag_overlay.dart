import 'package:flutter/material.dart';

import '../../../../core/utils/responsive_utils.dart';
import '../../domain/entities/todo.dart';

/// Responsive drag overlay that adapts to different screen sizes
class ResponsiveDragOverlay extends StatelessWidget {
  const ResponsiveDragOverlay({
    super.key,
    required this.todo,
    required this.child,
  });

  final Todo todo;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isTablet = ResponsiveUtils.isTablet(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    // Adjust overlay size based on screen size
    double overlayWidth;
    double overlayScale;

    if (isDesktop) {
      overlayWidth = 320;
      overlayScale = 1.1;
    } else if (isTablet) {
      overlayWidth = 280;
      overlayScale = 1.05;
    } else {
      overlayWidth = MediaQuery.of(context).size.width * 0.8;
      overlayScale = 1.02;
    }

    return Transform.scale(
      scale: overlayScale,
      child: Container(
        width: overlayWidth,
        constraints: BoxConstraints(
          maxWidth: overlayWidth,
          minHeight: isMobile ? 80 : 100,
        ),
        child: child,
      ),
    );
  }
}

/// Mobile-specific drag feedback for better touch interaction
class MobileDragFeedback extends StatelessWidget {
  const MobileDragFeedback({
    super.key,
    required this.todo,
    required this.child,
  });

  final Todo todo;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 16,
      borderRadius: BorderRadius.circular(12),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.cardColor,
          border: Border.all(
            color: theme.primaryColor.withValues(alpha: 0.5),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
              spreadRadius: 2,
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 30,
              offset: const Offset(0, 15),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

/// Desktop-specific drag feedback with enhanced visual effects
class DesktopDragFeedback extends StatelessWidget {
  const DesktopDragFeedback({
    super.key,
    required this.todo,
    required this.child,
  });

  final Todo todo;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 12,
      borderRadius: BorderRadius.circular(12),
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: theme.cardColor,
          border: Border.all(
            color: theme.primaryColor.withValues(alpha: 0.4),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: theme.primaryColor.withValues(alpha: 0.2),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

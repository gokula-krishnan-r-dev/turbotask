import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/services/focus_toast_service.dart';
import '../../../../core/theme/app_colors.dart';

/// A widget that displays focus timer toast notifications
class FocusToastWidget extends StatefulWidget {
  final FocusToastService toastService;

  const FocusToastWidget({super.key, required this.toastService});

  @override
  State<FocusToastWidget> createState() => _FocusToastWidgetState();
}

class _FocusToastWidgetState extends State<FocusToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animations
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, -0.5), end: Offset.zero).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
        );

    // Listen for toast visibility changes
    widget.toastService.addListener(_onToastChanged);
  }

  @override
  void dispose() {
    widget.toastService.removeListener(_onToastChanged);
    _animationController.dispose();
    super.dispose();
  }

  void _onToastChanged() {
    if (widget.toastService.isToastVisible) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Only show on macOS
    if (!Platform.isMacOS) return const SizedBox.shrink();

    return AnimatedBuilder(
      animation: widget.toastService,
      builder: (context, _) {
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            return Positioned(
              top: MediaQuery.of(context).padding.top + 8,
              left: 0,
              right: 0,
              child: Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: _buildToastContent(context),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildToastContent(BuildContext context) {
    final theme = Theme.of(context);
    final isMilestone = widget.toastService.isMilestone;

    return Container(
      width: 320,
      constraints: const BoxConstraints(maxHeight: 80),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface.withOpacity(0.95),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isMilestone
                  ? AppColors.warning.withOpacity(0.2)
                  : AppColors.mint.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Text(
              isMilestone ? '⭐' : '🔔',
              style: const TextStyle(fontSize: 16),
              semanticsLabel: isMilestone
                  ? 'Milestone reached'
                  : 'Focus reminder',
            ),
          ),

          const SizedBox(width: 12),

          // Content
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  widget.toastService.currentTitle,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 2),

                // Subtitle
                Text(
                  widget.toastService.currentSubtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.8),
                    fontSize: 12,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../core/services/focus_mode_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../todos/domain/entities/todo.dart';

/// Floating window widget for focus mode (300x100px)
class FocusModeFloatingWindow extends StatefulWidget {
  final FocusModeService focusModeService;
  final List<Todo> availableTasks;
  final String projectId;
  final Function(Todo task, TaskStatus newStatus) onTaskStatusUpdate;
  final VoidCallback onClose;

  const FocusModeFloatingWindow({
    super.key,
    required this.focusModeService,
    required this.availableTasks,
    required this.projectId,
    required this.onTaskStatusUpdate,
    required this.onClose,
  });

  @override
  State<FocusModeFloatingWindow> createState() =>
      _FocusModeFloatingWindowState();
}

class _FocusModeFloatingWindowState extends State<FocusModeFloatingWindow>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListenableBuilder(
      listenable: widget.focusModeService,
      builder: (context, child) {
        final activeTask = widget.focusModeService.activeTask;

        if (activeTask == null) {
          return _buildNoTaskState(theme);
        }

        return MouseRegion(
          onEnter: (_) => _onHover(true),
          onExit: (_) => _onHover(false),
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Stack(
                  children: [
                    // Main content
                    _buildMainContent(theme, activeTask),

                    // Hover overlay with actions
                    if (_isHovered)
                      Positioned.fill(
                        child: FadeTransition(
                          opacity: _opacityAnimation,
                          child: _buildHoverOverlay(theme, activeTask),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _onHover(bool isHovered) {
    if (_isHovered != isHovered) {
      setState(() {
        _isHovered = isHovered;
      });

      if (isHovered) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  Widget _buildMainContent(ThemeData theme, Todo activeTask) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Active indicator dot
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 8),

          // Task info - compact version
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Task name
                AutoSizeText(
                  activeTask.taskName,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 2),

                // Priority
                AutoSizeText(
                  activeTask.priority.value,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Timer display - compact
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                widget.focusModeService.formattedTime,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: AppColors.mint,
                  fontFeatures: [FontFeature.tabularFigures()],
                ),
              ),

              AutoSizeText(
                widget.focusModeService.isSessionActive ? 'Active' : 'Paused',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  color: widget.focusModeService.isSessionActive
                      ? AppColors.success
                      : theme.colorScheme.onSurface.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHoverOverlay(ThemeData theme, Todo activeTask) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.surface.withOpacity(0.9),
            theme.colorScheme.surface.withOpacity(0.95),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.mint.withOpacity(0.3), width: 1),
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Pause/Resume button
          _buildCompactActionButton(
            theme,
            icon: widget.focusModeService.isSessionActive
                ? Icons.pause
                : Icons.play_arrow,
            onPressed: () {
              if (widget.focusModeService.isSessionActive) {
                widget.focusModeService.pauseFocusSession();
              } else {
                widget.focusModeService.resumeFocusSession();
              }
            },
          ),

          // Complete button
          _buildCompactActionButton(
            theme,
            icon: Icons.check_circle,
            onPressed: () =>
                widget.onTaskStatusUpdate(activeTask, TaskStatus.completed),
          ),

          // Skip button
          _buildCompactActionButton(
            theme,
            icon: Icons.skip_next,
            onPressed: () => _skipToNextTask(),
          ),

          // Close button
          _buildCompactActionButton(
            theme,
            icon: Icons.close,
            onPressed: widget.onClose,
          ),
        ],
      ),
    );
  }

  Widget _buildCompactActionButton(
    ThemeData theme, {
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
        ),
        child: Icon(icon, size: 14, color: theme.colorScheme.primary),
      ),
    );
  }

  Widget _buildNoTaskState(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.task_outlined,
            color: theme.colorScheme.onSurface.withOpacity(0.5),
            size: 24,
          ),
          const SizedBox(height: 8),
          AutoSizeText(
            'No active task',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _skipToNextTask() {
    final availableTasks = widget.availableTasks
        .where((task) => task.id != widget.focusModeService.activeTask?.id)
        .where((task) => !task.isCompleted)
        .toList();

    if (availableTasks.isNotEmpty) {
      widget.focusModeService.switchTask(availableTasks.first);
    }
  }
}

import 'package:flutter/material.dart';
import '../../../../core/services/focus_mode_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../todos/domain/entities/todo.dart';
import '../../../../core/di/injection.dart';

class TaskTimerWidget extends StatefulWidget {
  final Todo task;
  final bool isFirstTask;
  final bool showControls;

  const TaskTimerWidget({
    super.key,
    required this.task,
    required this.isFirstTask,
    this.showControls = false,
  });

  @override
  State<TaskTimerWidget> createState() => _TaskTimerWidgetState();
}

class _TaskTimerWidgetState extends State<TaskTimerWidget> {
  late final FocusModeService _focusModeService;
  bool get _isActiveTask =>
      _focusModeService.activeTask?.id == widget.task.id &&
      _focusModeService.isSessionActive;

  @override
  void initState() {
    super.initState();
    _focusModeService = getIt<FocusModeService>();
    _focusModeService.addListener(_onFocusModeChanged);
  }

  @override
  void dispose() {
    _focusModeService.removeListener(_onFocusModeChanged);
    super.dispose();
  }

  void _onFocusModeChanged() {
    if (mounted) {
      setState(() {});
    }
  }

  void _toggleFocusSession() {
    if (_isActiveTask) {
      _focusModeService.pauseFocusSession();
    } else if (_focusModeService.activeTask?.id == widget.task.id) {
      _focusModeService.resumeFocusSession();
    } else {
      _focusModeService.startFocusSession(widget.task);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: _focusModeService,
      builder: (context, _) {
        final isThisTaskActive =
            _focusModeService.activeTask?.id == widget.task.id;
        final isSessionActive = _focusModeService.isSessionActive;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Timer display
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color:
                    (isThisTaskActive || widget.isFirstTask) && isSessionActive
                    ? AppColors.mint.withOpacity(0.1)
                    : theme.colorScheme.surfaceVariant.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color:
                      (isThisTaskActive || widget.isFirstTask) &&
                          isSessionActive
                      ? AppColors.mint.withOpacity(0.3)
                      : theme.colorScheme.outline.withOpacity(0.1),
                ),
              ),
              child: Text(
                _focusModeService.formattedTime.isEmpty
                    ? '00:00'
                    : _focusModeService.formattedTime,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color:
                      (isThisTaskActive || widget.isFirstTask) &&
                          isSessionActive
                      ? AppColors.mint
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),

            // Controls (only shown on hover or if explicitly requested)
            if (widget.showControls) ...[
              const SizedBox(width: 8),
              // Play/Pause button
              _buildControlButton(
                isThisTaskActive && isSessionActive
                    ? Icons.pause
                    : Icons.play_arrow,
                isThisTaskActive && isSessionActive ? 'Pause' : 'Start',
                _toggleFocusSession,
                isThisTaskActive && isSessionActive
                    ? AppColors.mint
                    : theme.colorScheme.primary,
              ),
              const SizedBox(width: 4),
              // Focus mode button
              _buildControlButton(Icons.center_focus_strong, 'Focus Mode', () {
                _focusModeService.startFocusSession(widget.task);
                // Navigation to focus mode would be handled at a higher level
              }, AppColors.mint),
              const SizedBox(width: 4),
              // Complete task button
              _buildControlButton(
                Icons.check_circle_outline,
                'Complete Task',
                () {
                  // Task completion would be handled at a higher level
                },
                theme.colorScheme.primary,
              ),
            ],
          ],
        );
      },
    );
  }

  Widget _buildControlButton(
    IconData icon,
    String tooltip,
    VoidCallback onPressed,
    Color color,
  ) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, size: 16, color: color),
        ),
      ),
    );
  }
}

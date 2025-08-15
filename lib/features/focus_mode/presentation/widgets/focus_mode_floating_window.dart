import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../core/services/focus_mode_service.dart';
import '../../../../core/services/floating_panel_manager.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../todos/domain/entities/todo.dart';
import '../../../breaks/presentation/bloc/break_bloc.dart';
import '../../../breaks/presentation/bloc/break_event.dart';
import '../../../breaks/presentation/bloc/break_state.dart';
import '../../../breaks/presentation/pages/break_page.dart';

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

  // Loading states for different actions
  bool _isBreakLoading = false;
  bool _isCompleteLoading = false;
  bool _isSkipLoading = false;

  // Debouncing and request management
  Timer? _debounceTimer;
  static const Duration _debounceDuration = Duration(milliseconds: 500);

  // Track active requests to prevent concurrent API calls
  final Set<String> _activeRequests = <String>{};

  // Break bloc subscription
  StreamSubscription<BreakState>? _breakSubscription;

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
    _debounceTimer?.cancel();
    _breakSubscription?.cancel();
    _activeRequests.clear();
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
            isLoading: _isCompleteLoading,
            onPressed: _isCompleteLoading
                ? null
                : () => _debouncedCompleteTask(activeTask),
          ),

          // Skip button
          _buildCompactActionButton(
            theme,
            icon: Icons.skip_next,
            isLoading: _isSkipLoading,
            onPressed: _isSkipLoading ? null : () => _debouncedSkipTask(),
          ),

          // Break button
          _buildCompactActionButton(
            theme,
            icon: Icons.coffee,
            isLoading: _isBreakLoading,
            onPressed: _isBreakLoading
                ? null
                : () => _debouncedStartBreak(activeTask),
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
    required VoidCallback? onPressed,
    bool isLoading = false,
  }) {
    final isDisabled = onPressed == null || isLoading;

    return InkWell(
      onTap: isDisabled ? null : onPressed,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isDisabled
              ? theme.colorScheme.onSurface.withOpacity(0.1)
              : theme.colorScheme.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: isDisabled
                ? theme.colorScheme.onSurface.withOpacity(0.2)
                : theme.colorScheme.primary.withOpacity(0.3),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 14,
                height: 14,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: theme.colorScheme.primary,
                ),
              )
            : Icon(
                icon,
                size: 14,
                color: isDisabled
                    ? theme.colorScheme.onSurface.withOpacity(0.5)
                    : theme.colorScheme.primary,
              ),
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

  /// Debounced wrapper for completing a task
  void _debouncedCompleteTask(Todo task) {
    if (_activeRequests.contains('complete_${task.id}')) {
      print(
        'FocusModeFloatingWindow: Complete task request already in progress',
      );
      return;
    }

    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDuration, () {
      _handleCompleteTask(task);
    });
  }

  /// Debounced wrapper for skipping to next task
  void _debouncedSkipTask() {
    if (_activeRequests.contains('skip_task')) {
      print('FocusModeFloatingWindow: Skip task request already in progress');
      return;
    }

    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDuration, () {
      _handleSkipTask();
    });
  }

  /// Debounced wrapper for starting a break
  void _debouncedStartBreak(Todo task) {
    if (_activeRequests.contains('break_${task.id}')) {
      print('FocusModeFloatingWindow: Break start request already in progress');
      return;
    }

    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDuration, () {
      _handleStartBreak(task);
    });
  }

  /// Handle task completion with loading state
  Future<void> _handleCompleteTask(Todo task) async {
    final requestId = 'complete_${task.id}';

    if (_activeRequests.contains(requestId)) return;

    setState(() {
      _isCompleteLoading = true;
    });

    _activeRequests.add(requestId);

    try {
      print('FocusModeFloatingWindow: Completing task: ${task.id}');
      await widget.onTaskStatusUpdate(task, TaskStatus.completed);

      // Show success feedback
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Task "${task.taskName}" completed!'),
            backgroundColor: AppColors.success,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print('FocusModeFloatingWindow: Error completing task: $e');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to complete task: ${e.toString()}'),
            backgroundColor: AppColors.error,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      _activeRequests.remove(requestId);
      if (mounted) {
        setState(() {
          _isCompleteLoading = false;
        });
      }
    }
  }

  /// Handle skipping to next task with loading state
  Future<void> _handleSkipTask() async {
    const requestId = 'skip_task';

    if (_activeRequests.contains(requestId)) return;

    setState(() {
      _isSkipLoading = true;
    });

    _activeRequests.add(requestId);

    try {
      final availableTasks = widget.availableTasks
          .where((task) => task.id != widget.focusModeService.activeTask?.id)
          .where((task) => !task.isCompleted)
          .toList();

      if (availableTasks.isNotEmpty) {
        print(
          'FocusModeFloatingWindow: Switching to next task: ${availableTasks.first.id}',
        );
        widget.focusModeService.switchTask(availableTasks.first);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Switched to "${availableTasks.first.taskName}"'),
              backgroundColor: AppColors.mint,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No more tasks available'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      print('FocusModeFloatingWindow: Error skipping task: $e');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to skip task: ${e.toString()}'),
            backgroundColor: AppColors.error,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      _activeRequests.remove(requestId);
      if (mounted) {
        setState(() {
          _isSkipLoading = false;
        });
      }
    }
  }

  /// Handle starting a break with proper loading state and error handling
  Future<void> _handleStartBreak(Todo activeTask) async {
    final requestId = 'break_${activeTask.id}';

    if (_activeRequests.contains(requestId)) return;

    setState(() {
      _isBreakLoading = true;
    });

    _activeRequests.add(requestId);

    try {
      print(
        'FocusModeFloatingWindow: Starting break for task: ${activeTask.id}',
      );

      // Get the break bloc
      final breakBloc = getIt<BreakBloc>();

      // Cancel any existing subscription to avoid multiple listeners
      await _breakSubscription?.cancel();

      // Start the break
      breakBloc.add(
        StartBreak(
          todoId: activeTask.id,
          projectId: widget.projectId,
          breakType: 'manual',
          notes: 'Break started from Focus Mode',
        ),
      );

      // Listen for the break creation result with a timeout
      _breakSubscription = breakBloc.stream
          .timeout(
            const Duration(seconds: 10),
            onTimeout: (sink) {
              sink.addError('Break creation timed out. Please try again.');
              sink.close();
            },
          )
          .listen(
            (state) async {
              print('FocusModeFloatingWindow: Break state: $state');

              if (state is ActiveBreakLoaded && state.activeBreak != null) {
                print('FocusModeFloatingWindow: Break created successfully');

                try {
                  // Resize panel for break mode on macOS
                  if (Platform.isMacOS) {
                    await FloatingPanelManager.resizePanelForFocusMode(true);
                  }

                  // Navigate to break page with the actual break session
                  if (mounted) {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BreakPage(
                          breakSession: state.activeBreak!,
                          projectId: widget.projectId,
                          onClose: () {
                            Navigator.of(context).pop();
                            // The break page will handle resizing back to normal
                          },
                        ),
                      ),
                    );
                  }
                } catch (e) {
                  print(
                    'FocusModeFloatingWindow: Error navigating to break page: $e',
                  );
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Break started but navigation failed: ${e.toString()}',
                        ),
                        backgroundColor: AppColors.warning,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  }
                }

                // Clean up subscription after successful navigation
                await _breakSubscription?.cancel();
                _breakSubscription = null;
              } else if (state is BreakError) {
                print(
                  'FocusModeFloatingWindow: Break creation failed: ${state.message}',
                );

                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Failed to start break: ${state.message}'),
                      backgroundColor: AppColors.error,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                }

                // Clean up subscription after error
                await _breakSubscription?.cancel();
                _breakSubscription = null;
              }
            },
            onError: (error) {
              print('FocusModeFloatingWindow: Break stream error: $error');

              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Break creation failed: ${error.toString()}'),
                    backgroundColor: AppColors.error,
                    duration: const Duration(seconds: 3),
                  ),
                );
              }
            },
          );
    } catch (e) {
      print('FocusModeFloatingWindow: Error starting break: $e');

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to start break: ${e.toString()}'),
            backgroundColor: AppColors.error,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      _activeRequests.remove(requestId);

      // Delay loading state reset to prevent UI flicker
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _isBreakLoading = false;
          });
        }
      });
    }
  }
}

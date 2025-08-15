import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/focus_mode_service.dart';
import '../../../../core/services/focus_toast_service.dart';
import '../../../../core/services/floating_panel_manager.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../todos/domain/entities/todo.dart';
import '../../../todos/presentation/bloc/kanban_board_bloc.dart';
import '../widgets/focus_mode_floating_window.dart';
import '../widgets/focus_toast_widget.dart';

/// Focus Mode page with a small floating window (300x100px) for task management
class FocusModePage extends StatefulWidget {
  final List<Todo> availableTasks;
  final String projectId;

  const FocusModePage({
    super.key,
    required this.availableTasks,
    required this.projectId,
  });

  @override
  State<FocusModePage> createState() => _FocusModePageState();
}

class _FocusModePageState extends State<FocusModePage> {
  late FocusModeService _focusModeService;
  late FocusToastService _focusToastService;

  @override
  void initState() {
    super.initState();
    _focusModeService = getIt<FocusModeService>();
    _focusToastService = getIt<FocusToastService>();

    // Auto-start with first available task
    if (widget.availableTasks.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusModeService.startFocusSession(widget.availableTasks.first);

        // Start toast notifications for macOS
        if (Platform.isMacOS) {
          _focusToastService.startToasts();
        }
      });
    }

    // Listen for focus mode state changes
    _focusModeService.addListener(_onFocusModeStateChanged);
  }

  void _onFocusModeStateChanged() {
    // Sync toast service with focus mode service
    if (_focusModeService.isSessionActive) {
      _focusToastService.resumeToasts();
    } else {
      _focusToastService.pauseToasts();
    }
  }

  @override
  void dispose() {
    // Don't stop the focus mode service on dispose to maintain session across navigation
    _focusModeService.removeListener(_onFocusModeStateChanged);

    // But do stop the toast notifications
    if (Platform.isMacOS) {
      _focusToastService.stopToasts();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Main floating window
          Container(
            width: 380,
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  theme.colorScheme.surface.withOpacity(0.95),
                  theme.colorScheme.surface.withOpacity(0.98),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: theme.colorScheme.outline.withOpacity(0.2),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 40,
                  offset: const Offset(0, 16),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: BlocProvider(
              create: (context) => getIt<KanbanBoardBloc>(),
              child: FocusModeFloatingWindow(
                focusModeService: _focusModeService,
                availableTasks: widget.availableTasks,
                projectId: widget.projectId,
                onTaskStatusUpdate: _updateTaskStatus,
                onClose: _closeFocusMode,
              ),
            ),
          ),

          // Toast notifications (macOS only)
          if (Platform.isMacOS)
            FocusToastWidget(toastService: _focusToastService),
        ],
      ),
    );
  }

  /// Update task status via API
  Future<void> _updateTaskStatus(Todo task, TaskStatus newStatus) async {
    try {
      print('FocusMode: Updating task ${task.id} to status ${newStatus.value}');

      // Update via Kanban Board Bloc
      context.read<KanbanBoardBloc>().add(
        MoveTodoToColumn(
          projectId: widget.projectId,
          todoId: task.id,
          newStatus: newStatus,
          position: 0,
        ),
      );

      // Show success feedback
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Task updated to ${newStatus.displayName}'),
            backgroundColor: AppColors.success,
            duration: const Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print('FocusMode: Error updating task status: $e');

      // Show error feedback
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update task: ${e.toString()}'),
            backgroundColor: AppColors.error,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  /// Close Focus Mode and resize panel back to normal
  Future<void> _closeFocusMode() async {
    try {
      print('FocusMode: Closing Focus Mode and resizing panel back to normal');

      // Resize panel back to normal height on macOS
      if (Platform.isMacOS) {
        await FloatingPanelManager.resizePanelForFocusMode(false);
      }

      // Navigate back
      if (mounted) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      print('FocusMode: Error closing focus mode: $e');

      // Still navigate back even if resize fails
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }
}

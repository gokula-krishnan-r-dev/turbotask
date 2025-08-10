import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/responsive_utils.dart';
import '../../domain/entities/todo.dart';
import '../../domain/entities/subtask.dart';
import 'todo_card.dart';
import 'responsive_drag_overlay.dart';
import 'loading_todo_overlay.dart';

/// Draggable wrapper for todo cards with smooth animations and loading states
class DraggableTodoCard extends StatefulWidget {
  const DraggableTodoCard({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onToggleCompletion,
    required this.onTogglePin,
    required this.onStatusChanged,
    this.isBeingDragged = false,
    this.isUpdating = false,
    this.subtasks = const [],
    this.onCreateSubtask,
    this.onToggleSubtask,
    this.isLoadingSubtasks = false,
  });

  final Todo todo;
  final VoidCallback onTap;
  final VoidCallback onToggleCompletion;
  final VoidCallback onTogglePin;
  final Function(TodoStatus) onStatusChanged;
  final bool isBeingDragged;
  final bool isUpdating;
  final List<Subtask> subtasks;
  final Function(String title)? onCreateSubtask;
  final Function(String subtaskId)? onToggleSubtask;
  final bool isLoadingSubtasks;

  @override
  State<DraggableTodoCard> createState() => _DraggableTodoCardState();
}

class _DraggableTodoCardState extends State<DraggableTodoCard>
    with TickerProviderStateMixin {
  late AnimationController _dragController;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _elevationAnimation;

  @override
  void initState() {
    super.initState();

    _dragController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(parent: _scaleController, curve: Curves.easeOut));

    _elevationAnimation = Tween<double>(
      begin: 0.0,
      end: 8.0,
    ).animate(CurvedAnimation(parent: _dragController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _dragController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _elevationAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Material(
            elevation: _elevationAnimation.value,
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
            child: Draggable<Todo>(
              data: widget.todo,
              feedback: _buildDragFeedback(context, theme),
              childWhenDragging: _buildChildWhenDragging(context, theme),
              dragAnchorStrategy: pointerDragAnchorStrategy,
              onDragStarted: () {
                HapticFeedback.lightImpact();
                _dragController.forward();
                _scaleController.forward();
              },
              onDragEnd: (details) {
                _dragController.reverse();
                _scaleController.reverse();
              },
              onDragCompleted: () {
                _dragController.reverse();
                _scaleController.reverse();
              },
              child: GestureDetector(
                onTap: widget.onTap,
                child: LoadingTodoOverlay(
                  isLoading: widget.isUpdating,
                  loadingText: 'Moving...',
                  child: TodoCard(
                    todo: widget.todo,
                    onTap: widget.onTap,
                    onToggleCompletion: widget.onToggleCompletion,
                    onTogglePin: widget.onTogglePin,
                    onStatusChanged: widget.onStatusChanged,
                    subtasks: widget.subtasks,
                    onCreateSubtask: widget.onCreateSubtask,
                    onToggleSubtask: widget.onToggleSubtask,
                    isLoadingSubtasks: widget.isLoadingSubtasks,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDragFeedback(BuildContext context, ThemeData theme) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    Widget feedback = TodoCard(
      todo: widget.todo,
      onTap: () {},
      onToggleCompletion: () {},
      onTogglePin: () {},
      onStatusChanged: (_) {},
    );

    if (isDesktop) {
      return ResponsiveDragOverlay(
        todo: widget.todo,
        child: DesktopDragFeedback(todo: widget.todo, child: feedback),
      );
    } else {
      return ResponsiveDragOverlay(
        todo: widget.todo,
        child: MobileDragFeedback(todo: widget.todo, child: feedback),
      );
    }
  }

  Widget _buildChildWhenDragging(BuildContext context, ThemeData theme) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.cardColor.withValues(alpha: 0.3),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.2),
          style: BorderStyle.solid,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Skeleton title
            Container(
              height: 16,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: theme.dividerColor.withValues(alpha: 0.2),
              ),
            ),
            const SizedBox(height: 8),
            // Skeleton description
            Container(
              height: 12,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: theme.dividerColor.withValues(alpha: 0.1),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 12,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: theme.dividerColor.withValues(alpha: 0.1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Enhanced haptic feedback utility
class HapticFeedback {
  static void lightImpact() {
    try {
      // Use the system haptic feedback
      SystemSound.play(SystemSoundType.click);
    } catch (e) {
      // Fallback for platforms that don't support haptic feedback
    }
  }

  static void mediumImpact() {
    try {
      SystemSound.play(SystemSoundType.alert);
    } catch (e) {
      // Fallback
    }
  }

  static void selectionClick() {
    try {
      SystemSound.play(SystemSoundType.click);
    } catch (e) {
      // Fallback
    }
  }
}

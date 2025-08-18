import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/todos/presentation/bloc/kanban_board_bloc.dart';
import '../../../todos/domain/entities/todo.dart';
import '../../../todos/data/models/todo_action_request_models.dart';
import '../../../todos/presentation/bloc/todo_actions_bloc.dart';
import '../../../todos/presentation/bloc/todo_actions_event.dart';
import '../../../todos/presentation/bloc/todo_actions_state.dart';

class HoverButtonWidget extends StatefulWidget {
  final bool isSubtasksExpanded;
  final bool isSubtasksVisible;
  final VoidCallback onSubtasksExpandToggle;
  final VoidCallback onNotesOpen;
  final Todo? todo;
  final Function(Todo)? onTodoUpdated;
  final VoidCallback? onRefresh;

  const HoverButtonWidget({
    super.key,
    required this.isSubtasksExpanded,
    required this.isSubtasksVisible,
    required this.onSubtasksExpandToggle,
    required this.onNotesOpen,
    this.todo,
    this.onTodoUpdated,
    this.onRefresh,
  });

  @override
  State<HoverButtonWidget> createState() => _HoverButtonWidgetState();
}

class _HoverButtonWidgetState extends State<HoverButtonWidget>
    with TickerProviderStateMixin {
  bool _isActionInProgress = false;

  void _performAction(TodoActionType actionType) {
    if (widget.todo == null || _isActionInProgress) return;

    setState(() {
      _isActionInProgress = true;
    });

    final bloc = context.read<TodoActionsBloc>();

    switch (actionType) {
      case TodoActionType.complete:
        if (widget.todo!.isCompleted) {
          bloc.add(IncompleteTodoEvent(widget.todo!.id));
        } else {
          bloc.add(CompleteTodoEvent(widget.todo!.id));
        }
        break;
      case TodoActionType.pin:
        bloc.add(PinTodoEvent(widget.todo!.id));
        break;
      case TodoActionType.break_:
        _showBreakDialog();
        return;
      case TodoActionType.pause:
        bloc.add(PauseTodoEvent(widget.todo!.id));
        break;
      case TodoActionType.skip:
        bloc.add(SkipTodoEvent(widget.todo!.id));
        break;
      case TodoActionType.note:
        widget.onNotesOpen();
        setState(() {
          _isActionInProgress = false;
        });
        return;
      default:
        setState(() {
          _isActionInProgress = false;
        });
        return;
    }
  }

  void _showBreakDialog() {
    showDialog(
      context: context,
      builder: (context) => _BreakDialog(
        onBreakSelected: (breakType) {
          // Check if widget is still mounted before accessing context
          if (!mounted) return;

          final bloc = context.read<TodoActionsBloc>();
          bloc.add(
            StartBreakEvent(
              todoId: widget.todo!.id,
              projectId: widget.todo!.projectId,
              breakType: breakType,
            ),
          );
        },
      ),
    ).then((_) {
      // Check if widget is still mounted before calling setState
      if (mounted) {
        setState(() {
          _isActionInProgress = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<TodoActionsBloc, TodoActionsState>(
      listener: (context, state) {
        // Check if widget is still mounted before calling setState
        if (mounted) {
          setState(() {
            _isActionInProgress = state.isLoading;
          });
        }

        if (state.isSuccess && !state.isLoading) {
          // Refetch data after successful action
          widget.onRefresh?.call();

          // Refetch kanban board to get updated data
          if (mounted) {
            context.read<KanbanBoardBloc>().add(
              LoadKanbanBoard(widget.todo!.projectId),
            );
          }

          if (state.updatedTodo != null && widget.onTodoUpdated != null) {
            widget.onTodoUpdated!(state.updatedTodo!);
          }

          // Reset the actions state for next operation
          context.read<TodoActionsBloc>().add(const ResetActionsEvent());
        }

        if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error!), backgroundColor: Colors.red),
          );
        }
      },
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Subtask button
                _ActionButton(
                  onTap: widget.onSubtasksExpandToggle,
                  child: SvgPicture.asset(
                    'assets/icons/subtask.svg',
                    width: 16,
                    height: 16,
                  ),
                  theme: theme,
                  hoverText: 'Subtasks',
                  hoverColor: Colors.blue,
                ),

                const SizedBox(width: 8),

                // Note button
                _ActionButton(
                  onTap: widget.onNotesOpen,
                  child: Icon(
                    Icons.note_outlined,
                    size: 16,
                    color: AppColors.mint,
                  ),
                  theme: theme,
                  hoverText: 'Add Note',
                  hoverColor: AppColors.mint,
                ),

                if (widget.todo != null) ...[
                  const SizedBox(width: 8),

                  // Complete/Incomplete button
                  _ActionButton(
                    onTap: () => _performAction(TodoActionType.complete),
                    child: Icon(
                      widget.todo!.isCompleted
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                      size: 16,
                      color: widget.todo!.isCompleted
                          ? Colors.green
                          : theme.iconTheme.color,
                    ),
                    theme: theme,
                    isLoading: _isActionInProgress,
                    hoverText: widget.todo!.isCompleted
                        ? 'Incomplete'
                        : 'Complete',
                    hoverColor: Colors.green,
                  ),

                  const SizedBox(width: 6),

                  // Break button
                  _ActionButton(
                    onTap: () => _performAction(TodoActionType.break_),
                    child: Icon(
                      Icons.coffee_outlined,
                      size: 16,
                      color: Colors.amber,
                    ),
                    theme: theme,
                    isLoading: _isActionInProgress,
                    hoverText: 'Break',
                    hoverColor: Colors.amber,
                  ),

                  const SizedBox(width: 6),

                  // Pause button
                  _ActionButton(
                    onTap: () => _performAction(TodoActionType.pause),
                    child: Icon(
                      Icons.pause_circle_outline,
                      size: 16,
                      color: Colors.orange,
                    ),
                    theme: theme,
                    isLoading: _isActionInProgress,
                    hoverText: 'Pause',
                    hoverColor: Colors.orange,
                  ),

                  const SizedBox(width: 6),

                  // Skip button
                  _ActionButton(
                    onTap: () => _performAction(TodoActionType.skip),
                    child: Icon(
                      Icons.skip_next_outlined,
                      size: 16,
                      color: Colors.blue,
                    ),
                    theme: theme,
                    isLoading: _isActionInProgress,
                    hoverText: 'Skip',
                    hoverColor: Colors.blue,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  final ThemeData theme;
  final bool isLoading;
  final String? hoverText;
  final Color? hoverColor;

  const _ActionButton({
    required this.onTap,
    required this.child,
    required this.theme,
    this.isLoading = false,
    this.hoverText,
    this.hoverColor,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton>
    with TickerProviderStateMixin {
  late AnimationController _pressController;
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _hoverWidthAnimation;
  late Animation<double> _hoverOpacityAnimation;
  late Animation<Color?> _hoverColorAnimation;

  bool _isPressed = false;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _pressController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _pressController, curve: Curves.easeInOut),
    );

    _hoverWidthAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeOutCubic),
    );

    _hoverOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
    );

    _hoverColorAnimation =
        ColorTween(
          begin: widget.theme.colorScheme.surfaceVariant,
          end: widget.hoverColor ?? AppColors.mint,
        ).animate(
          CurvedAnimation(parent: _hoverController, curve: Curves.easeInOut),
        );
  }

  @override
  void dispose() {
    _pressController.dispose();
    _hoverController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
    _pressController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    _pressController.reverse();
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
    _pressController.reverse();
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });

    if (isHovered && widget.hoverText != null) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_scaleAnimation, _hoverController]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: MouseRegion(
            onEnter: (_) => _onHover(true),
            onExit: (_) => _onHover(false),
            child: GestureDetector(
              onTap: widget.isLoading ? null : widget.onTap,
              onTapDown: _onTapDown,
              onTapUp: _onTapUp,
              onTapCancel: _onTapCancel,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                decoration: BoxDecoration(
                  color: _hoverColorAnimation.value?.withOpacity(
                    _isPressed ? 0.8 : (_isHovered ? 0.7 : 0.5),
                  ),
                  borderRadius: BorderRadius.circular(55),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.child,
                    if (widget.hoverText != null)
                      ClipRect(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          widthFactor: _hoverWidthAnimation.value,
                          child: Opacity(
                            opacity: _hoverOpacityAnimation.value,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                widget.hoverText!,
                                style: widget.theme.textTheme.bodySmall
                                    ?.copyWith(
                                      color: _isHovered
                                          ? Colors.white
                                          : widget
                                                .theme
                                                .textTheme
                                                .bodySmall
                                                ?.color,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                    ),
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _BreakDialog extends StatelessWidget {
  final Function(BreakType) onBreakSelected;

  const _BreakDialog({required this.onBreakSelected});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Take a Break'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: BreakType.values.map((breakType) {
          return ListTile(
            leading: Icon(_getBreakIcon(breakType), color: AppColors.mint),
            title: Text(breakType.displayName),
            subtitle: Text('${breakType.defaultDuration} minutes'),
            onTap: () {
              Navigator.of(context).pop();
              onBreakSelected(breakType);
            },
          );
        }).toList(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  IconData _getBreakIcon(BreakType breakType) {
    switch (breakType) {
      case BreakType.short:
        return Icons.timer;
      case BreakType.long:
        return Icons.schedule;
      case BreakType.meal:
        return Icons.restaurant;
      case BreakType.personal:
        return Icons.person;
      case BreakType.emergency:
        return Icons.emergency;
    }
  }
}

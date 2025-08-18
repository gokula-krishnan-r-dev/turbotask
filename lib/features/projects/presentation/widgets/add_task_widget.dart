import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import '../../../../core/theme/app_colors.dart';

/// Intent for opening the add task widget
class OpenAddTaskIntent extends Intent {
  const OpenAddTaskIntent();
}

/// Widget for adding new tasks inline within kanban columns
class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({
    super.key,
    required this.columnId,
    required this.onAddTask,
  });

  final String columnId;
  final Function(String taskName) onAddTask;

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  bool _isSubmitting = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _autoCollapseTimer;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  // Auto-collapse duration (in seconds)
  static const int _autoCollapseDuration = 10;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    // Listen to focus changes to manage auto-collapse
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _autoCollapseTimer?.cancel();
    _animationController.dispose();
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      _cancelAutoCollapse();
    } else if (_isExpanded && _controller.text.isEmpty) {
      _startAutoCollapse();
    }
  }

  void _startAutoCollapse() {
    _cancelAutoCollapse();
    _autoCollapseTimer = Timer(
      const Duration(seconds: _autoCollapseDuration),
      () {
        if (mounted && _isExpanded && _controller.text.isEmpty) {
          _handleCancel();
        }
      },
    );
  }

  void _cancelAutoCollapse() {
    _autoCollapseTimer?.cancel();
    _autoCollapseTimer = null;
  }

  void _toggleExpanded() {
    _cancelAutoCollapse();
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
        // Focus the text field when expanded
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _focusNode.requestFocus();
          }
        });
      } else {
        _animationController.reverse();
        // Clear the text field when collapsed
        _controller.clear();
      }
    });
  }

  void _openAddTask() {
    if (!_isExpanded) {
      _cancelAutoCollapse();
      setState(() {
        _isExpanded = true;
      });
      _animationController.forward();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _focusNode.requestFocus();
        }
      });
    } else {
      // If already expanded, just focus the text field and cancel auto-collapse
      _cancelAutoCollapse();
      if (mounted) {
        _focusNode.requestFocus();
      }
    }
  }

  Future<void> _handleSubmit() async {
    final taskName = _controller.text.trim();
    if (taskName.isEmpty || _isSubmitting) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Add the task
      widget.onAddTask(taskName);

      // Clear the text field
      _controller.clear();

      // Show brief success feedback
      _showTaskAddedFeedback();

      // Keep widget expanded for continuous task creation
      // and refocus for the next task
      await Future.delayed(const Duration(milliseconds: 100));

      if (mounted) {
        _focusNode.requestFocus();
        // Start auto-collapse timer for better UX
        _startAutoCollapse();
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  void _handleCancel() {
    _cancelAutoCollapse();
    _controller.clear();
    setState(() {
      _isExpanded = false;
    });
    _animationController.reverse();
  }

  void _showTaskAddedFeedback() {
    // Brief visual feedback that task was added
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: AppColors.mint, size: 16),
            const SizedBox(width: 8),
            const Text('Task added successfully'),
          ],
        ),
        duration: const Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green.shade600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(
          LogicalKeyboardKey.meta, // Command key on Mac
          LogicalKeyboardKey.keyN,
        ): const OpenAddTaskIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.control, // Ctrl key on Windows/Linux
          LogicalKeyboardKey.keyN,
        ): const OpenAddTaskIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.escape, // Escape to close
        ): const DismissIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          OpenAddTaskIntent: CallbackAction<OpenAddTaskIntent>(
            onInvoke: (_) {
              _openAddTask();
              return null;
            },
          ),
          DismissIntent: CallbackAction<DismissIntent>(
            onInvoke: (_) {
              if (_isExpanded) {
                _handleCancel();
              }
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: false,
          child: Builder(
            builder: (context) {
              if (!_isExpanded) {
                return _buildCollapsedState(theme);
              }
              return _buildExpandedState(theme);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCollapsedState(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: _toggleExpanded,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.dividerColor.withValues(alpha: 0.2),
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.add, size: 20, color: AppColors.mint),
              const SizedBox(width: 8),
              Text(
                'Add a task',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.mint,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.mint.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.mint.withOpacity(0.3),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  Platform.isMacOS ? '⌘N' : 'Ctrl+N',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.mint.withOpacity(0.8),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedState(ThemeData theme) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Card(
              elevation: 4,
              shadowColor: Colors.black.withValues(alpha: 0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: AppColors.mint.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with task counter or instruction
                    Row(
                      children: [
                        Icon(Icons.add_task, size: 16, color: AppColors.mint),
                        const SizedBox(width: 6),
                        Text(
                          'Add new task',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.mint,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        if (_autoCollapseTimer != null)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: theme.dividerColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Auto-close in ${_autoCollapseDuration}s',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 10,
                                color: theme.textTheme.bodySmall?.color
                                    ?.withValues(alpha: 0.6),
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Title input
                    TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      enabled: !_isSubmitting,
                      decoration: InputDecoration(
                        hintText: 'Enter task name...',
                        hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyMedium?.color?.withValues(
                            alpha: 0.5,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: theme.dividerColor.withValues(alpha: 0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppColors.mint,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        suffixIcon: _isSubmitting
                            ? Container(
                                margin: const EdgeInsets.all(12),
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.mint,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      style: theme.textTheme.bodyMedium,
                      maxLines: 3,
                      minLines: 1,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _handleSubmit(),
                      onChanged: (_) {
                        // Cancel auto-collapse when user is typing
                        _cancelAutoCollapse();
                      },
                    ),

                    const SizedBox(height: 12),

                    // Action buttons
                    Row(
                      children: [
                        // Add button
                        ElevatedButton(
                          onPressed: _isSubmitting ? null : _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.black,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: theme.disabledColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_isSubmitting) ...[
                                SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ],
                              Text(
                                _isSubmitting ? 'Adding...' : 'Add Task',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        // Cancel button
                        TextButton(
                          onPressed: _isSubmitting ? null : _handleCancel,
                          style: TextButton.styleFrom(
                            foregroundColor: theme.textTheme.bodyMedium?.color
                                ?.withValues(alpha: 0.7),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const Spacer(),

                        // Quick actions
                        PopupMenuButton<String>(
                          enabled: !_isSubmitting,
                          icon: Icon(
                            Icons.more_horiz,
                            size: 18,
                            color: _isSubmitting
                                ? theme.disabledColor
                                : theme.iconTheme.color?.withValues(alpha: 0.6),
                          ),
                          tooltip: 'More options',
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              value: 'priority',
                              child: Row(
                                children: [
                                  Icon(Icons.flag, size: 16),
                                  SizedBox(width: 8),
                                  Text('Set Priority'),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'assignee',
                              child: Row(
                                children: [
                                  Icon(Icons.person, size: 16),
                                  SizedBox(width: 8),
                                  Text('Assign To'),
                                ],
                              ),
                            ),
                            const PopupMenuItem(
                              value: 'duedate',
                              child: Row(
                                children: [
                                  Icon(Icons.schedule, size: 16),
                                  SizedBox(width: 8),
                                  Text('Due Date'),
                                ],
                              ),
                            ),
                          ],
                          onSelected: (value) {
                            // Cancel auto-collapse when interacting with options
                            _cancelAutoCollapse();
                            switch (value) {
                              case 'priority':
                                _showPrioritySelector();
                                break;
                              case 'assignee':
                                _showAssigneeSelector();
                                break;
                              case 'duedate':
                                _showDatePicker();
                                break;
                            }
                          },
                        ),
                      ],
                    ),

                    // Helpful tip for continuous task creation
                    const SizedBox(height: 8),
                    Text(
                      'Press Enter to add quickly or Escape to close',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodySmall?.color?.withValues(
                          alpha: 0.5,
                        ),
                        fontSize: 11,
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

  void _showPrioritySelector() {
    // TODO: Implement priority selector dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Priority selector coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showAssigneeSelector() {
    // TODO: Implement assignee selector dialog
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Assignee selector coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showDatePicker() {
    // TODO: Implement date picker
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Date picker coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

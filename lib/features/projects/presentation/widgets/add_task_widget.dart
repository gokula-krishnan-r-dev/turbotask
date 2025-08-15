import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

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

class _AddTaskWidgetState extends State<AddTaskWidget> {
  bool _isExpanded = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        // Focus the text field when expanded
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _focusNode.requestFocus();
        });
      } else {
        // Clear the text field when collapsed
        _controller.clear();
      }
    });
  }

  void _handleSubmit() {
    final taskName = _controller.text.trim();
    if (taskName.isNotEmpty) {
      widget.onAddTask(taskName);
      _controller.clear();
      setState(() {
        _isExpanded = true;
      });
    }
  }

  void _handleCancel() {
    _controller.clear();
    setState(() {
      _isExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (!_isExpanded) {
      return _buildCollapsedState(theme);
    }

    return _buildExpandedState(theme);
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedState(ThemeData theme) {
    return Container(
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
              // Title input
              TextField(
                controller: _controller,
                focusNode: _focusNode,
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
                    borderSide: BorderSide(color: AppColors.mint, width: 2),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                ),
                style: theme.textTheme.bodyMedium,
                maxLines: 3,
                minLines: 1,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => _handleSubmit(),
              ),

              const SizedBox(height: 12),

              // Action buttons
              Row(
                children: [
                  // Add button
                  ElevatedButton(
                    onPressed: _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mint,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Add Task',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Cancel button
                  TextButton(
                    onPressed: _handleCancel,
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
                    icon: Icon(
                      Icons.more_horiz,
                      size: 18,
                      color: theme.iconTheme.color?.withValues(alpha: 0.6),
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
                      // TODO: Implement quick actions
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
            ],
          ),
        ),
      ),
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

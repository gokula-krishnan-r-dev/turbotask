import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/todo.dart';
import '../../domain/entities/subtask.dart';

/// Card widget for displaying individual todos with subtask support
class TodoCard extends StatefulWidget {
  const TodoCard({
    super.key,
    required this.todo,
    required this.onTap,
    required this.onToggleCompletion,
    required this.onTogglePin,
    required this.onStatusChanged,
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
  final List<Subtask> subtasks;
  final Function(String title)? onCreateSubtask;
  final Function(String subtaskId)? onToggleSubtask;
  final bool isLoadingSubtasks;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> with TickerProviderStateMixin {
  bool _isExpanded = false;
  bool _showCreateSubtask = false;
  final TextEditingController _subtaskController = TextEditingController();
  final FocusNode _subtaskFocusNode = FocusNode();
  late AnimationController _expansionController;
  late Animation<double> _expansionAnimation;

  @override
  void initState() {
    super.initState();
    _expansionController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _expansionAnimation = CurvedAnimation(
      parent: _expansionController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _expansionController.dispose();
    _subtaskController.dispose();
    _subtaskFocusNode.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _expansionController.forward();
      } else {
        _expansionController.reverse();
        _showCreateSubtask = false;
      }
    });
  }

  void _showAddSubtask() {
    setState(() {
      _showCreateSubtask = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _subtaskFocusNode.requestFocus();
    });
  }

  void _hideAddSubtask() {
    setState(() {
      _showCreateSubtask = false;
      _subtaskController.clear();
    });
  }

  void _createSubtask() {
    final title = _subtaskController.text.trim();
    if (title.isNotEmpty && widget.onCreateSubtask != null) {
      widget.onCreateSubtask!(title);
      _hideAddSubtask();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final priorityColor = _getPriorityColor(widget.todo.priority);
    final completedSubtasks = widget.subtasks
        .where((s) => s.isCompleted)
        .length;
    final totalSubtasks = widget.subtasks.length;

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: widget.todo.isCompleted
                    ? LinearGradient(
                        colors: [
                          AppColors.mint.withValues(alpha: 0.05),
                          AppColors.mint.withValues(alpha: 0.02),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with title and actions
                  _buildHeader(context, theme, priorityColor),

                  if (widget.todo.taskDescription.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    _buildDescription(context, theme),
                  ],

                  const SizedBox(height: 12),

                  // Subtasks summary and toggle
                  if (totalSubtasks > 0 || widget.onCreateSubtask != null)
                    _buildSubtaskSummary(
                      context,
                      theme,
                      completedSubtasks,
                      totalSubtasks,
                    ),

                  // Tags and metadata
                  _buildFooter(context, theme, priorityColor),
                ],
              ),
            ),
          ),

          // Expandable subtasks section
          AnimatedBuilder(
            animation: _expansionAnimation,
            builder: (context, child) {
              return ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  heightFactor: _expansionAnimation.value,
                  child: _buildSubtasksSection(context, theme),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    ThemeData theme,
    Color priorityColor,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Completion checkbox
        GestureDetector(
          onTap: widget.onToggleCompletion,
          child: Container(
            width: 20,
            height: 20,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.todo.isCompleted
                    ? AppColors.mint
                    : theme.dividerColor.withValues(alpha: 0.3),
                width: 2,
              ),
              color: widget.todo.isCompleted
                  ? AppColors.mint
                  : Colors.transparent,
            ),
            child: widget.todo.isCompleted
                ? const Icon(Icons.check, size: 14, color: Colors.white)
                : null,
          ),
        ),

        const SizedBox(width: 12),

        // Title and priority indicator
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Priority indicator
                  if (widget.todo.priority != TodoPriority.low) ...[
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: priorityColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],

                  // Title
                  Expanded(
                    child: Text(
                      widget.todo.taskName,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                        decoration: widget.todo.isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                        color: widget.todo.isCompleted
                            ? theme.textTheme.bodyMedium?.color?.withValues(
                                alpha: 0.6,
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Actions
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Pin toggle
            GestureDetector(
              onTap: widget.onTogglePin,
              child: Container(
                padding: const EdgeInsets.all(4),
                child: Icon(
                  widget.todo.isPinned
                      ? Icons.push_pin
                      : Icons.push_pin_outlined,
                  size: 16,
                  color: widget.todo.isPinned
                      ? AppColors.warning
                      : theme.iconTheme.color?.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDescription(BuildContext context, ThemeData theme) {
    return Text(
      widget.todo.taskDescription,
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtaskSummary(
    BuildContext context,
    ThemeData theme,
    int completed,
    int total,
  ) {
    return GestureDetector(
      onTap: _toggleExpansion,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(
              _isExpanded ? Icons.expand_less : Icons.expand_more,
              size: 16,
              color: AppColors.blue,
            ),
            const SizedBox(width: 4),
            Text(
              '$completed/$total Subtasks',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: LinearProgressIndicator(
                value: total > 0 ? completed / total : 0,
                backgroundColor: AppColors.blue.withValues(alpha: 0.1),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
                minHeight: 2,
              ),
            ),
            const SizedBox(width: 8),
            if (widget.onCreateSubtask != null)
              GestureDetector(
                onTap: () {
                  if (!_isExpanded) _toggleExpansion();
                  Future.delayed(
                    const Duration(milliseconds: 300),
                    _showAddSubtask,
                  );
                },
                child: Icon(
                  Icons.add_circle_outline,
                  size: 16,
                  color: AppColors.blue,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubtasksSection(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Existing subtasks
          if (widget.subtasks.isNotEmpty) ...[
            ...widget.subtasks.map(
              (subtask) => _buildSubtaskItem(context, theme, subtask),
            ),
            const SizedBox(height: 8),
          ],

          // Create new subtask form
          if (_showCreateSubtask && widget.onCreateSubtask != null)
            _buildCreateSubtaskForm(context, theme)
          else if (!_showCreateSubtask && widget.onCreateSubtask != null)
            _buildAddSubtaskButton(context, theme),

          // Loading indicator
          if (widget.isLoadingSubtasks)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSubtaskItem(
    BuildContext context,
    ThemeData theme,
    Subtask subtask,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          // Completion checkbox
          GestureDetector(
            onTap: () => widget.onToggleSubtask?.call(subtask.id),
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: subtask.isCompleted
                      ? AppColors.mint
                      : theme.dividerColor.withValues(alpha: 0.3),
                  width: 1.5,
                ),
                color: subtask.isCompleted
                    ? AppColors.mint
                    : Colors.transparent,
              ),
              child: subtask.isCompleted
                  ? const Icon(Icons.check, size: 10, color: Colors.white)
                  : null,
            ),
          ),

          const SizedBox(width: 12),

          // Subtask title
          Expanded(
            child: Text(
              subtask.name,
              style: theme.textTheme.bodySmall?.copyWith(
                decoration: subtask.isCompleted
                    ? TextDecoration.lineThrough
                    : null,
                color: subtask.isCompleted
                    ? theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6)
                    : theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateSubtaskForm(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.blue.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.blue.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Icon(Icons.add_circle_outline, size: 16, color: AppColors.blue),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _subtaskController,
              focusNode: _subtaskFocusNode,
              style: theme.textTheme.bodySmall,
              decoration: InputDecoration(
                hintText: 'Enter subtask title',
                hintStyle: theme.textTheme.bodySmall?.copyWith(
                  color: theme.textTheme.bodyMedium?.color?.withValues(
                    alpha: 0.5,
                  ),
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onSubmitted: (_) => _createSubtask(),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: _createSubtask,
                child: Icon(Icons.check, size: 16, color: AppColors.mint),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _hideAddSubtask,
                child: Icon(Icons.close, size: 16, color: AppColors.error),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddSubtaskButton(BuildContext context, ThemeData theme) {
    return GestureDetector(
      onTap: _showAddSubtask,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.blue.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.blue.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            Icon(Icons.add, size: 16, color: AppColors.blue),
            const SizedBox(width: 8),
            Text(
              'Add Subtask',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(
    BuildContext context,
    ThemeData theme,
    Color priorityColor,
  ) {
    return Row(
      children: [
        // Status badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: _getStatusColor(widget.todo.status).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _getStatusColor(widget.todo.status).withValues(alpha: 0.3),
            ),
          ),
          child: Text(
            widget.todo.status.displayName,
            style: theme.textTheme.bodySmall?.copyWith(
              color: _getStatusColor(widget.todo.status),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(width: 8),

        // Due date if available
        if (widget.todo.dueDate != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.schedule, size: 10, color: AppColors.warning),
                const SizedBox(width: 4),
                Text(
                  _formatDate(widget.todo.dueDate!),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.warning,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],

        const Spacer(),

        // Estimated time if available
        if (widget.todo.estimatedTime != null) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.access_time,
                size: 10,
                color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 4),
              Text(
                '${widget.todo.estimatedTime}${widget.todo.timeUnit.substring(0, 1)}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.textTheme.bodySmall?.color?.withValues(
                    alpha: 0.7,
                  ),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Color _getPriorityColor(TodoPriority priority) {
    switch (priority) {
      case TodoPriority.urgent:
        return AppColors.error;
      case TodoPriority.high:
        return AppColors.error;
      case TodoPriority.medium:
        return AppColors.warning;
      case TodoPriority.low:
        return AppColors.mint;
    }
  }

  Color _getStatusColor(TodoStatus status) {
    switch (status) {
      case TodoStatus.backlog:
        return AppColors.gray500;
      case TodoStatus.todo:
        return AppColors.blue;
      case TodoStatus.inProgress:
        return AppColors.orange;
      case TodoStatus.review:
        return AppColors.purple;
      case TodoStatus.completed:
        return AppColors.mint;
      case TodoStatus.cancelled:
        return AppColors.error;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = date.difference(now).inDays;

    if (difference == 0) return 'Today';
    if (difference == 1) return 'Tomorrow';
    if (difference == -1) return 'Yesterday';
    if (difference > 0) return '${difference}d';
    return '${difference.abs()}d ago';
  }
}

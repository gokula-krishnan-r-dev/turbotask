import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/inline_edit_text.dart';
import '../../data/datasources/subtask_remote_datasource.dart';
import '../../data/models/subtask_request_models.dart';
import '../../domain/entities/subtask.dart';
import '../../domain/entities/todo.dart';
import '../bloc/subtask_bloc.dart';

class SubtaskItemWidget extends StatefulWidget {
  const SubtaskItemWidget({
    super.key,
    required this.subtask,
    this.onTap,
    this.onLongPress,
    this.showActions = true,
  });

  final Subtask subtask;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final bool showActions;

  @override
  State<SubtaskItemWidget> createState() => _SubtaskItemWidgetState();
}

class _SubtaskItemWidgetState extends State<SubtaskItemWidget> {
  late final SubtaskRemoteDataSource _subtaskDataSource;
  bool _isUpdatingName = false;

  @override
  void initState() {
    super.initState();
    _subtaskDataSource = getIt<SubtaskRemoteDataSource>();
  }

  Future<bool> _updateSubtaskName(String newName) async {
    if (newName.trim().isEmpty) {
      return false;
    }

    setState(() {
      _isUpdatingName = true;
    });

    try {
      final request = UpdateSubtaskRequest(name: newName.trim());
      await _subtaskDataSource.updateSubtask(widget.subtask.id, request);

      setState(() {
        _isUpdatingName = false;
      });

      // Show success feedback
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: AppColors.mint, size: 16),
                const SizedBox(width: 8),
                const Text('Subtask name updated successfully'),
              ],
            ),
            duration: const Duration(milliseconds: 1500),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green.shade600,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );

        // Trigger refresh to show updated data
        context.read<SubtaskBloc>().add(RefreshSubtasks(widget.subtask.todoId));
      }

      return true;
    } catch (e) {
      setState(() {
        _isUpdatingName = false;
      });

      // Show error feedback
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Text('Failed to update subtask: ${e.toString()}'),
              ],
            ),
            duration: const Duration(milliseconds: 3000),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red.shade600,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }

      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = widget.subtask.isCompleted;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: InkWell(
        onTap: widget.onTap,
        onLongPress: widget.onLongPress,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: isCompleted
                ? AppColors.success.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isCompleted
                  ? AppColors.success.withOpacity(0.3)
                  : theme.dividerColor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Checkbox
              GestureDetector(
                onTap: () {
                  context.read<SubtaskBloc>().add(
                    ToggleSubtaskStatus(widget.subtask.id),
                  );
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: isCompleted ? AppColors.success : Colors.transparent,
                    border: Border.all(
                      color: isCompleted
                          ? AppColors.success
                          : theme.dividerColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: isCompleted
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),
              ),

              const SizedBox(width: 12),

              // Subtask content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtask name with AI indicator
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InlineEditText(
                            text: widget.subtask.name,
                            onSave: _updateSubtaskName,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              decoration: isCompleted
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: isCompleted
                                  ? theme.textTheme.bodyMedium?.color
                                        ?.withOpacity(0.6)
                                  : theme.textTheme.bodyMedium?.color,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                            isLoading: _isUpdatingName,
                            enabled:
                                !isCompleted, // Disable editing for completed subtasks
                            placeholder: 'Enter subtask name...',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Subtask name cannot be empty';
                              }
                              if (value.trim().length > 255) {
                                return 'Subtask name is too long (max 255 characters)';
                              }
                              return null;
                            },
                          ),
                        ),

                        // AI-generated indicator
                        if (widget.subtask.aiGenerated) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.purple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: Colors.purple.withOpacity(0.3),
                                width: 0.5,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.auto_awesome,
                                  size: 10,
                                  color: Colors.purple,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  'AI',
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: Colors.purple,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),

                    // Subtask description (if available)
                    if (widget.subtask.description?.isNotEmpty == true) ...[
                      const SizedBox(height: 2),
                      Text(
                        widget.subtask.description!,
                        style: theme.textTheme.bodySmall?.copyWith(
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: theme.textTheme.bodySmall?.color?.withOpacity(
                            isCompleted ? 0.4 : 0.7,
                          ),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],

                    // Priority, status, and AI indicators
                    if (widget.subtask.priority != Priority.medium ||
                        widget.subtask.dueDate != null ||
                        widget.subtask.aiEstimatedDuration != null) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          // Priority indicator
                          if (widget.subtask.priority != Priority.medium) ...[
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _getPriorityColor(
                                  widget.subtask.priority,
                                ).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                widget.subtask.priority.displayName,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: _getPriorityColor(
                                    widget.subtask.priority,
                                  ),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                          ],

                          // Due date indicator
                          if (widget.subtask.dueDate != null) ...[
                            Icon(
                              Icons.schedule,
                              size: 12,
                              color: widget.subtask.isOverdue
                                  ? AppColors.error
                                  : theme.textTheme.bodySmall?.color
                                        ?.withOpacity(0.6),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              _formatDueDate(widget.subtask.dueDate!),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: widget.subtask.isOverdue
                                    ? AppColors.error
                                    : theme.textTheme.bodySmall?.color
                                          ?.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(width: 6),
                          ],

                          // AI estimated duration indicator
                          if (widget.subtask.aiEstimatedDuration != null) ...[
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 10,
                                    color: Colors.purple,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '${widget.subtask.aiEstimatedDuration}m',
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      color: Colors.purple,
                                      fontSize: 9,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              // Action menu (if enabled)
              if (widget.showActions) ...[
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'edit':
                        _showEditDialog(context);
                        break;
                      case 'delete':
                        _showDeleteDialog(context);
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 16),
                          SizedBox(width: 8),
                          Text('Edit'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 16, color: AppColors.error),
                          SizedBox(width: 8),
                          Text(
                            'Delete',
                            style: TextStyle(color: AppColors.error),
                          ),
                        ],
                      ),
                    ),
                  ],
                  child: Icon(
                    Icons.more_vert,
                    size: 16,
                    color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color _getPriorityColor(Priority priority) {
    switch (priority) {
      case Priority.low:
        return AppColors.info;
      case Priority.medium:
        return AppColors.warning;
      case Priority.high:
        return AppColors.violet;
      case Priority.urgent:
        return AppColors.error;
    }
  }

  String _formatDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final yesterday = today.subtract(const Duration(days: 1));
    final taskDate = DateTime(dueDate.year, dueDate.month, dueDate.day);

    if (taskDate.isAtSameMomentAs(today)) {
      return 'Today';
    } else if (taskDate.isAtSameMomentAs(tomorrow)) {
      return 'Tomorrow';
    } else if (taskDate.isAtSameMomentAs(yesterday)) {
      return 'Yesterday';
    } else {
      return '${dueDate.day}/${dueDate.month}';
    }
  }

  void _showEditDialog(BuildContext context) {
    final nameController = TextEditingController(text: widget.subtask.name);
    final descController = TextEditingController(
      text: widget.subtask.description ?? '',
    );

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Subtask'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Subtask name',
                border: OutlineInputBorder(),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: 'Description (optional)',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.trim().isNotEmpty) {
                context.read<SubtaskBloc>().add(
                  UpdateSubtask(
                    subtaskId: widget.subtask.id,
                    name: nameController.text.trim(),
                    description: descController.text.trim().isNotEmpty
                        ? descController.text.trim()
                        : null,
                  ),
                );
                Navigator.of(dialogContext).pop();
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Row(
          children: [
            Icon(
              Icons.warning_amber_rounded,
              color: AppColors.warning,
              size: 24,
            ),
            const SizedBox(width: 12),
            const Text('Delete Subtask'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Are you sure you want to delete "${widget.subtask.name}"?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.warning.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.warning.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: AppColors.warning, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This action cannot be undone.',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall?.copyWith(color: AppColors.warning),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              _deleteSubtask(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteSubtask(BuildContext context) async {
    try {
      // Show loading indicator
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
              const SizedBox(width: 12),
              const Text('Deleting subtask...'),
            ],
          ),
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: AppColors.info,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );

      // Delete via bloc
      context.read<SubtaskBloc>().add(DeleteSubtask(widget.subtask.id));

      // Success will be handled by the bloc
    } catch (e) {
      // Show error feedback
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text('Failed to delete subtask: ${e.toString()}'),
                ),
              ],
            ),
            duration: const Duration(milliseconds: 3000),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.error,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      }
    }
  }
}

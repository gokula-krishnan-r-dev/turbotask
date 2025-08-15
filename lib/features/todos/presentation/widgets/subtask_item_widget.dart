import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/subtask.dart';
import '../../domain/entities/todo.dart';
import '../bloc/subtask_bloc.dart';

class SubtaskItemWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = subtask.isCompleted;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
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
                    ToggleSubtaskStatus(subtask.id),
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
                    // Subtask name
                    Text(
                      subtask.name,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: isCompleted
                            ? theme.textTheme.bodyMedium?.color?.withOpacity(
                                0.6,
                              )
                            : theme.textTheme.bodyMedium?.color,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    // Subtask description (if available)
                    if (subtask.description?.isNotEmpty == true) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtask.description!,
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

                    // Priority and status indicators
                    if (subtask.priority != Priority.medium ||
                        subtask.dueDate != null) ...[
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          // Priority indicator
                          if (subtask.priority != Priority.medium) ...[
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: _getPriorityColor(
                                  subtask.priority,
                                ).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                subtask.priority.displayName,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: _getPriorityColor(subtask.priority),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                          ],

                          // Due date indicator
                          if (subtask.dueDate != null) ...[
                            Icon(
                              Icons.schedule,
                              size: 12,
                              color: subtask.isOverdue
                                  ? AppColors.error
                                  : theme.textTheme.bodySmall?.color
                                        ?.withOpacity(0.6),
                            ),
                            const SizedBox(width: 2),
                            Text(
                              _formatDueDate(subtask.dueDate!),
                              style: theme.textTheme.labelSmall?.copyWith(
                                color: subtask.isOverdue
                                    ? AppColors.error
                                    : theme.textTheme.bodySmall?.color
                                          ?.withOpacity(0.6),
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
              if (showActions) ...[
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
    final nameController = TextEditingController(text: subtask.name);
    final descController = TextEditingController(
      text: subtask.description ?? '',
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
                    subtaskId: subtask.id,
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
        title: const Text('Delete Subtask'),
        content: Text('Are you sure you want to delete "${subtask.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<SubtaskBloc>().add(DeleteSubtask(subtask.id));
              Navigator.of(dialogContext).pop();
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
}

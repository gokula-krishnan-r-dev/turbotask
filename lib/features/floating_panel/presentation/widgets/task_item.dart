import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../todos/domain/entities/todo.dart';

/// Individual task item widget for the floating panel
class TaskItem extends StatelessWidget {
  final Todo task;
  final Function(Todo) onTaskTap;
  final Function(Todo, bool) onTaskToggle;

  const TaskItem({
    super.key,
    required this.task,
    required this.onTaskTap,
    required this.onTaskToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isCompleted = task.isCompleted;
    final isOverdue =
        task.dueDate != null &&
        task.dueDate!.isBefore(DateTime.now()) &&
        !isCompleted;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isOverdue
              ? theme.colorScheme.error.withOpacity(0.3)
              : theme.colorScheme.outline.withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () => onTaskTap(task),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // Completion checkbox
                GestureDetector(
                  onTap: () => onTaskToggle(task, !isCompleted),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isCompleted
                            ? theme.colorScheme.primary
                            : theme.colorScheme.outline.withOpacity(0.5),
                        width: 2,
                      ),
                      color: isCompleted
                          ? theme.colorScheme.primary
                          : Colors.transparent,
                    ),
                    child: isCompleted
                        ? Icon(
                            Icons.check,
                            size: 12,
                            color: theme.colorScheme.onPrimary,
                          )
                        : null,
                  ),
                ),

                const SizedBox(width: 12),

                // Task content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Task name
                      AutoSizeText(
                        task.taskName,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          decoration: isCompleted
                              ? TextDecoration.lineThrough
                              : null,
                          color: isCompleted
                              ? theme.colorScheme.onSurface.withOpacity(0.6)
                              : theme.colorScheme.onSurface,
                        ),
                        maxLines: 2,
                        minFontSize: 12,
                      ),

                      // Task details
                      if (task.dueDate != null ||
                          task.priority != Priority.medium) ...[
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            // Due date
                            if (task.dueDate != null) ...[
                              Icon(
                                Icons.schedule,
                                size: 12,
                                color: isOverdue
                                    ? theme.colorScheme.error
                                    : theme.colorScheme.onSurface.withOpacity(
                                        0.6,
                                      ),
                              ),
                              const SizedBox(width: 4),
                              AutoSizeText(
                                _formatDueDate(task.dueDate!),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: isOverdue
                                      ? theme.colorScheme.error
                                      : theme.colorScheme.onSurface.withOpacity(
                                          0.6,
                                        ),
                                  fontWeight: isOverdue
                                      ? FontWeight.w600
                                      : null,
                                ),
                                maxLines: 1,
                                minFontSize: 10,
                              ),
                            ],

                            // Priority indicator
                            if (task.priority != Priority.medium) ...[
                              if (task.dueDate != null)
                                const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: _getPriorityColor(
                                    task.priority,
                                  ).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: AutoSizeText(
                                  task.priority.displayName,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: _getPriorityColor(task.priority),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  minFontSize: 8,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],

                      // Progress indicator for subtasks
                      if (task.subtaskCount > 0) ...[
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(
                              Icons.checklist,
                              size: 12,
                              color: theme.colorScheme.onSurface.withOpacity(
                                0.6,
                              ),
                            ),
                            const SizedBox(width: 4),
                            AutoSizeText(
                              '${task.completedSubtasks}/${task.subtaskCount} subtasks',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.6,
                                ),
                              ),
                              maxLines: 1,
                              minFontSize: 10,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Container(
                                height: 4,
                                decoration: BoxDecoration(
                                  color: theme.colorScheme.outline.withOpacity(
                                    0.2,
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: task.subtaskCount > 0
                                      ? task.completedSubtasks /
                                            task.subtaskCount
                                      : 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),

                // Status indicator
                if (task.isPinned) ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.push_pin,
                    size: 14,
                    color: theme.colorScheme.primary,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final taskDate = DateTime(dueDate.year, dueDate.month, dueDate.day);

    final difference = taskDate.difference(today).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference == -1) {
      return 'Yesterday';
    } else if (difference > 0 && difference <= 7) {
      return '${difference}d';
    } else if (difference < 0) {
      return '${difference.abs()}d overdue';
    } else {
      return '${dueDate.day}/${dueDate.month}';
    }
  }

  Color _getPriorityColor(Priority priority) {
    switch (priority) {
      case Priority.low:
        return Colors.green;
      case Priority.medium:
        return Colors.orange;
      case Priority.high:
        return Colors.red;
      case Priority.urgent:
        return Colors.purple;
    }
  }
}

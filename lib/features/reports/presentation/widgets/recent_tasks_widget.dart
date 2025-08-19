import 'package:flutter/material.dart';
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';

class RecentTasksWidget extends StatelessWidget {
  final List<ReportTask> tasks;
  final String title;

  const RecentTasksWidget({
    super.key,
    required this.tasks,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              // Early/Late indicators
              Row(
                children: [
                  _StatusIndicator(color: AppColors.success, label: 'Early'),
                  const SizedBox(width: 8),
                  _StatusIndicator(color: AppColors.error, label: 'Late'),
                ],
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Tasks List
          SizedBox(
            height: 280,
            child: tasks.isEmpty
                ? _buildEmptyState()
                : ListView.separated(
                    itemCount: tasks.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return _TaskItem(task: task);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.task_alt,
            size: 48,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No recent tasks',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  final Color color;
  final String label;

  const _StatusIndicator({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

class _TaskItem extends StatelessWidget {
  final ReportTask task;

  const _TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _getStatusColor().withOpacity(0.3), width: 1),
      ),
      child: Row(
        children: [
          // Task Status Icon
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _getStatusColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(_getStatusIcon(), size: 18, color: _getStatusColor()),
          ),

          const SizedBox(width: 12),

          // Task Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Task Name and Priority
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.taskName,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    _PriorityBadge(priority: task.priority),
                  ],
                ),

                const SizedBox(height: 4),

                // Project and Status
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.projectTitle,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      task.status.displayName,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: _getStatusColor(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Time info and status indicator
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Time badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.textSecondary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${task.actualTime}m',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              const SizedBox(height: 4),

              // Early/Late indicator
              if (task.isOverdue)
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.error,
                    shape: BoxShape.circle,
                  ),
                )
              else if (task.status == TaskStatus.completed ||
                  task.status == TaskStatus.done)
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getStatusColor() {
    if (task.isOverdue) return AppColors.error;

    switch (task.status) {
      case TaskStatus.completed:
      case TaskStatus.done:
        return AppColors.success;
      case TaskStatus.inProgress:
        return AppColors.primary;
      case TaskStatus.pending:
        return AppColors.warning;
      case TaskStatus.cancelled:
        return AppColors.textSecondary;
      default:
        return AppColors.textSecondary;
    }
  }

  IconData _getStatusIcon() {
    if (task.isOverdue) return Icons.schedule;

    switch (task.status) {
      case TaskStatus.completed:
      case TaskStatus.done:
        return Icons.check_circle;
      case TaskStatus.inProgress:
        return Icons.play_circle;
      case TaskStatus.pending:
        return Icons.pause_circle;
      case TaskStatus.cancelled:
        return Icons.cancel;
      default:
        return Icons.radio_button_unchecked;
    }
  }
}

class _PriorityBadge extends StatelessWidget {
  final PriorityLevel priority;

  const _PriorityBadge({required this.priority});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: _getPriorityColor().withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        _getPriorityLabel(),
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: _getPriorityColor(),
        ),
      ),
    );
  }

  Color _getPriorityColor() {
    switch (priority) {
      case PriorityLevel.urgent:
        return AppColors.error;
      case PriorityLevel.high:
        return AppColors.warning;
      case PriorityLevel.medium:
        return AppColors.primary;
      case PriorityLevel.low:
        return AppColors.success;
    }
  }

  String _getPriorityLabel() {
    switch (priority) {
      case PriorityLevel.urgent:
        return 'URG';
      case PriorityLevel.high:
        return 'HIGH';
      case PriorityLevel.medium:
        return 'MED';
      case PriorityLevel.low:
        return 'LOW';
    }
  }
}

// Alternative compact version for smaller spaces
class CompactRecentTasksWidget extends StatelessWidget {
  final List<ReportTask> tasks;
  final String title;
  final int maxItems;

  const CompactRecentTasksWidget({
    super.key,
    required this.tasks,
    required this.title,
    this.maxItems = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              if (tasks.length > maxItems)
                Text(
                  '+${tasks.length - maxItems} more',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
            ],
          ),

          const SizedBox(height: 12),

          // Compact task list
          ...tasks.take(maxItems).map((task) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _getTaskStatusColor(task),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      task.taskName,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${task.actualTime}m',
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Color _getTaskStatusColor(ReportTask task) {
    if (task.isOverdue) return AppColors.error;

    switch (task.status) {
      case TaskStatus.completed:
      case TaskStatus.done:
        return AppColors.success;
      case TaskStatus.inProgress:
        return AppColors.primary;
      default:
        return AppColors.textSecondary;
    }
  }
}

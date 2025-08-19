import 'package:flutter/material.dart';
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';

class MetricsCards extends StatelessWidget {
  final TaskReportMetrics taskMetrics;
  final ProjectReportMetrics? projectMetrics;
  final ProductivityInsights? insights;

  const MetricsCards({
    super.key,
    required this.taskMetrics,
    this.projectMetrics,
    this.insights,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Tasks Done
        Expanded(
          child: _MetricCard(
            title: 'TASKS DONE',
            value: '${taskMetrics.completedTasks}',
            icon: Icons.check_circle_outline,
            color: AppColors.success,
            backgroundColor: AppColors.success.withOpacity(0.1),
          ),
        ),

        const SizedBox(width: 16),

        // Tasks Per Day
        Expanded(
          child: _MetricCard(
            title: 'TASKS PER DAY',
            value: taskMetrics.tasksPerDay.toStringAsFixed(1),
            icon: Icons.today_outlined,
            color: AppColors.primary,
            backgroundColor: AppColors.primary.withOpacity(0.1),
          ),
        ),

        const SizedBox(width: 16),

        // Hours Per Day
        Expanded(
          child: _MetricCard(
            title: 'HOURS PER DAY',
            value: taskMetrics.hoursPerDay.toStringAsFixed(0).padLeft(2, '0'),
            icon: Icons.access_time,
            color: AppColors.warning,
            backgroundColor: AppColors.warning.withOpacity(0.1),
          ),
        ),

        const SizedBox(width: 16),

        // Mins Per Task
        Expanded(
          child: _MetricCard(
            title: 'MINS PER TASK',
            value: '${taskMetrics.minutesPerTask.toStringAsFixed(0)}',
            icon: Icons.timer_outlined,
            color: AppColors.info,
            backgroundColor: AppColors.info.withOpacity(0.1),
          ),
        ),

        const SizedBox(width: 16),

        // Day Streak
        Expanded(
          child: _MetricCard(
            title: 'DAY STREAK',
            value: taskMetrics.currentStreak.toString().padLeft(2, '0'),
            icon: Icons.local_fire_department_outlined,
            color: AppColors.error,
            backgroundColor: AppColors.error.withOpacity(0.1),
          ),
        ),

        const SizedBox(width: 16),

        // Completion Rate (Time by List equivalent)
        Expanded(
          child: _MetricCard(
            title: 'COMPLETION RATE',
            value: '${taskMetrics.completionRate.toStringAsFixed(0)}%',
            icon: Icons.pie_chart_outline,
            color: AppColors.purple,
            backgroundColor: AppColors.purple.withOpacity(0.1),
            isLastCard: true,
          ),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final Color backgroundColor;
  final bool isLastCard;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.backgroundColor,
    this.isLastCard = false,
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
          // Header row with title and icon
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 16, color: color),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Value
          Text(
            value,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
              height: 1.0,
            ),
          ),

          const SizedBox(height: 8),

          // Optional subtitle or trend indicator
          if (isLastCard)
            Text(
              'of total tasks',
              style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
            )
          else
            const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// Extended version with trend indicators
class ExtendedMetricsCards extends StatelessWidget {
  final TaskReportMetrics taskMetrics;
  final TaskReportMetrics? previousMetrics;
  final ProjectReportMetrics? projectMetrics;
  final ProductivityInsights? insights;

  const ExtendedMetricsCards({
    super.key,
    required this.taskMetrics,
    this.previousMetrics,
    this.projectMetrics,
    this.insights,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Primary metrics row
        MetricsCards(
          taskMetrics: taskMetrics,
          projectMetrics: projectMetrics,
          insights: insights,
        ),

        const SizedBox(height: 16),

        // Secondary metrics row
        Row(
          children: [
            // Overdue Tasks
            Expanded(
              child: _SecondaryMetricCard(
                title: 'Overdue Tasks',
                value: '${taskMetrics.overdueTasks}',
                trend: previousMetrics != null
                    ? taskMetrics.overdueTasks - previousMetrics!.overdueTasks
                    : null,
                color: AppColors.error,
              ),
            ),

            const SizedBox(width: 16),

            // In Progress
            Expanded(
              child: _SecondaryMetricCard(
                title: 'In Progress',
                value: '${taskMetrics.inProgressTasks}',
                trend: previousMetrics != null
                    ? taskMetrics.inProgressTasks -
                          previousMetrics!.inProgressTasks
                    : null,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(width: 16),

            // Total Tasks
            Expanded(
              child: _SecondaryMetricCard(
                title: 'Total Tasks',
                value: '${taskMetrics.totalTasks}',
                trend: previousMetrics != null
                    ? taskMetrics.totalTasks - previousMetrics!.totalTasks
                    : null,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(width: 16),

            // Longest Streak
            Expanded(
              child: _SecondaryMetricCard(
                title: 'Best Streak',
                value: '${taskMetrics.longestStreak}',
                subtitle: 'days',
                color: AppColors.warning,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SecondaryMetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final int? trend;
  final Color color;

  const _SecondaryMetricCard({
    required this.title,
    required this.value,
    this.subtitle,
    this.trend,
    required this.color,
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
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 8),

          // Value and trend
          Row(
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(width: 4),
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
              if (trend != null) ...[
                const Spacer(),
                _TrendIndicator(trend: trend!),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _TrendIndicator extends StatelessWidget {
  final int trend;

  const _TrendIndicator({required this.trend});

  @override
  Widget build(BuildContext context) {
    if (trend == 0) {
      return Icon(Icons.remove, size: 16, color: AppColors.textSecondary);
    }

    final isPositive = trend > 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isPositive ? Icons.arrow_upward : Icons.arrow_downward,
          size: 14,
          color: isPositive ? AppColors.success : AppColors.error,
        ),
        const SizedBox(width: 2),
        Text(
          '${trend.abs()}',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: isPositive ? AppColors.success : AppColors.error,
          ),
        ),
      ],
    );
  }
}

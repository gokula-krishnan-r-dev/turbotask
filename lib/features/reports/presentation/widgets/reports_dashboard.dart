import 'package:flutter/material.dart';
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';
import 'package:turbotask/features/reports/presentation/widgets/charts/daily_productivity_chart.dart';
import 'package:turbotask/features/reports/presentation/widgets/charts/time_distribution_chart.dart';
import 'package:turbotask/features/reports/presentation/widgets/metrics_cards.dart';
import 'package:turbotask/features/reports/presentation/widgets/productivity_insights_widget.dart';
import 'package:turbotask/features/reports/presentation/widgets/recent_tasks_widget.dart';

class ReportsDashboard extends StatelessWidget {
  final ReportsOverview overview;
  final ReportFilterRequest filters;
  final ComparisonReport? comparison;
  final bool isRefreshing;
  final bool showAnalysisView;
  final bool showComparisonView;

  const ReportsDashboard({
    super.key,
    required this.overview,
    required this.filters,
    this.comparison,
    this.isRefreshing = false,
    this.showAnalysisView = false,
    this.showComparisonView = false,
  });

  @override
  Widget build(BuildContext context) {
    if (showComparisonView) {
      return _buildComparisonView();
    }

    if (showAnalysisView) {
      return _buildAnalysisView();
    }

    return _buildOverviewDashboard();
  }

  Widget _buildOverviewDashboard() {
    return RefreshIndicator(
      onRefresh: () async {
        // This will be handled by the parent widget
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Metrics Cards
            if (overview.taskMetrics != null)
              MetricsCards(
                taskMetrics: overview.taskMetrics!,
                projectMetrics: overview.projectMetrics,
                insights: overview.productivityInsights,
              ),

            const SizedBox(height: 32),

            // Main Content Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left Column - Charts
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      // Daily Productivity Chart
                      DailyProductivityChart(
                        dailyProductivity: overview.dailyProductivity,
                        title: 'Daily Activity',
                      ),

                      const SizedBox(height: 24),

                      // Time Distribution Chart
                      TimeDistributionChart(
                        timeDistribution: overview.timeDistribution,
                        title: 'Time by Category',
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 24),

                // Right Column - Insights and Tasks
                Expanded(
                  child: Column(
                    children: [
                      // Productivity Insights
                      if (overview.productivityInsights != null)
                        ProductivityInsightsWidget(
                          insights: overview.productivityInsights!,
                        ),

                      const SizedBox(height: 24),

                      // Recent Tasks
                      RecentTasksWidget(
                        tasks: overview.recentTasks,
                        title: 'Recent Tasks',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalysisView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Analysis Header
          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                color: AppColors.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Detailed Analysis',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Analysis Grid
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 24,
            crossAxisSpacing: 24,
            childAspectRatio: 1.2,
            children: [
              // Tasks by Status
              _buildAnalysisCard(
                title: 'Tasks by Status',
                child: _TasksByStatusChart(
                  tasksByStatus: overview.tasksByStatus,
                ),
              ),

              // Tasks by Priority
              _buildAnalysisCard(
                title: 'Tasks by Priority',
                child: _TasksByPriorityChart(
                  tasksByPriority: overview.tasksByPriority,
                ),
              ),

              // Hourly Productivity
              _buildAnalysisCard(
                title: 'Hourly Productivity',
                child: _HourlyProductivityChart(
                  hourlyProductivity: overview.hourlyProductivity,
                ),
              ),

              // Project Metrics
              _buildAnalysisCard(
                title: 'Project Overview',
                child: overview.projectMetrics != null
                    ? _ProjectMetricsWidget(metrics: overview.projectMetrics!)
                    : const Center(child: Text('No project data')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Comparison Header
          Row(
            children: [
              Icon(Icons.compare_arrows, color: AppColors.primary, size: 24),
              const SizedBox(width: 12),
              Text(
                'Period Comparison',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Comparison Content
          if (comparison != null) ...[
            _ComparisonWidget(comparison: comparison!),
          ] else ...[
            _buildEmptyState(
              icon: Icons.compare_arrows,
              title: 'Comparison Not Available',
              description: 'Comparison data is being loaded...',
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAnalysisCard({required String title, required Widget child}) {
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
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 40, color: AppColors.primary),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// Simple placeholder widgets for charts and metrics
class _TasksByStatusChart extends StatelessWidget {
  final List<TasksByStatus> tasksByStatus;

  const _TasksByStatusChart({required this.tasksByStatus});

  @override
  Widget build(BuildContext context) {
    if (tasksByStatus.isEmpty) {
      return const Center(child: Text('No status data'));
    }

    return Column(
      children: tasksByStatus.take(4).map((status) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _getStatusColor(status.status),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  status.status.displayName,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              Text(
                '${status.count}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Color _getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.completed:
      case TaskStatus.done:
        return AppColors.success;
      case TaskStatus.inProgress:
        return AppColors.primary;
      case TaskStatus.pending:
        return AppColors.warning;
      default:
        return AppColors.textSecondary;
    }
  }
}

class _TasksByPriorityChart extends StatelessWidget {
  final List<TasksByPriority> tasksByPriority;

  const _TasksByPriorityChart({required this.tasksByPriority});

  @override
  Widget build(BuildContext context) {
    if (tasksByPriority.isEmpty) {
      return const Center(child: Text('No priority data'));
    }

    return Column(
      children: tasksByPriority.map((priority) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Row(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: _getPriorityColor(priority.priority),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  priority.priority.displayName,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              Text(
                '${priority.count}',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Color _getPriorityColor(PriorityLevel priority) {
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
}

class _HourlyProductivityChart extends StatelessWidget {
  final List<HourlyProductivity> hourlyProductivity;

  const _HourlyProductivityChart({required this.hourlyProductivity});

  @override
  Widget build(BuildContext context) {
    if (hourlyProductivity.isEmpty) {
      return const Center(child: Text('No hourly data'));
    }

    final maxScore = hourlyProductivity
        .map((h) => h.productivityScore)
        .reduce((a, b) => a > b ? a : b);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: hourlyProductivity.take(8).map((hour) {
        final height = maxScore > 0
            ? (hour.productivityScore / maxScore) * 80
            : 0;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 16,
              height: height.toDouble(),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 4),
            Text('${hour.hour}h', style: const TextStyle(fontSize: 10)),
          ],
        );
      }).toList(),
    );
  }
}

class _ProjectMetricsWidget extends StatelessWidget {
  final ProjectReportMetrics metrics;

  const _ProjectMetricsWidget({required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MetricRow('Total', '${metrics.totalProjects}'),
        _MetricRow('Active', '${metrics.activeProjects}'),
        _MetricRow('Completed', '${metrics.completedProjects}'),
        _MetricRow(
          'Progress',
          '${metrics.averageProgress.toStringAsFixed(1)}%',
        ),
      ],
    );
  }

  Widget _MetricRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ComparisonWidget extends StatelessWidget {
  final ComparisonReport comparison;

  const _ComparisonWidget({required this.comparison});

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
          Text(
            'Current vs Previous Period',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          if (comparison.currentPeriod != null &&
              comparison.previousPeriod != null) ...[
            _ComparisonRow(
              'Total Tasks',
              '${comparison.currentPeriod!.totalTasks}',
              '${comparison.previousPeriod!.totalTasks}',
              comparison.percentageChange['total_tasks'] ?? 0,
            ),
            _ComparisonRow(
              'Completed Tasks',
              '${comparison.currentPeriod!.completedTasks}',
              '${comparison.previousPeriod!.completedTasks}',
              comparison.percentageChange['completed_tasks'] ?? 0,
            ),
            _ComparisonRow(
              'Completion Rate',
              '${comparison.currentPeriod!.completionRate.toStringAsFixed(1)}%',
              '${comparison.previousPeriod!.completionRate.toStringAsFixed(1)}%',
              comparison.percentageChange['completion_rate'] ?? 0,
            ),
          ] else ...[
            const Text('Comparison data not available'),
          ],
        ],
      ),
    );
  }

  Widget _ComparisonRow(
    String label,
    String current,
    String previous,
    double change,
  ) {
    final isPositive = change >= 0;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
          ),
          Expanded(
            child: Text(
              current,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              previous,
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: (isPositive ? AppColors.success : AppColors.error)
                  .withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${isPositive ? '+' : ''}${change.toStringAsFixed(1)}%',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isPositive ? AppColors.success : AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

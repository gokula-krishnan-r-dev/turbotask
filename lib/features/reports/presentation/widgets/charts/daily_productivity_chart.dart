import 'package:flutter/material.dart';
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';

class DailyProductivityChart extends StatelessWidget {
  final List<DailyProductivity> dailyProductivity;
  final String title;

  const DailyProductivityChart({
    super.key,
    required this.dailyProductivity,
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
              // Legend
              _buildLegend(),
            ],
          ),

          const SizedBox(height: 24),

          // Chart
          SizedBox(
            height: 250,
            child: dailyProductivity.isEmpty
                ? _buildEmptyState()
                : _buildChart(),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      children: [
        _LegendItem(color: AppColors.primary, label: 'Tasks'),
        const SizedBox(width: 16),
        _LegendItem(color: AppColors.success, label: 'Hours'),
        const SizedBox(width: 16),
        _LegendItem(color: AppColors.info, label: 'Pomodoros'),
        const SizedBox(width: 16),
        _LegendItem(color: AppColors.warning, label: 'Breaks'),
      ],
    );
  }

  Widget _buildChart() {
    // Calculate max values for scaling
    final maxTasks = dailyProductivity
        .map((d) => d.tasksCompleted)
        .reduce((a, b) => a > b ? a : b)
        .toDouble();
    final maxHours = dailyProductivity
        .map((d) => d.hoursWorked)
        .reduce((a, b) => a > b ? a : b);
    final maxBreaks = dailyProductivity
        .map((d) => d.breaksTaken)
        .reduce((a, b) => a > b ? a : b)
        .toDouble();

    // Use the maximum of all metrics for consistent scaling
    final maxValue = [
      maxTasks,
      maxHours,
      maxBreaks,
      10.0,
    ].reduce((a, b) => a > b ? a : b);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Y-axis labels
        Container(
          width: 30,
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${maxValue.toInt()}',
                style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
              ),
              Text(
                '${(maxValue * 0.75).toInt()}',
                style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
              ),
              Text(
                '${(maxValue * 0.5).toInt()}',
                style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
              ),
              Text(
                '${(maxValue * 0.25).toInt()}',
                style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
              ),
              Text(
                '0',
                style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),

        const SizedBox(width: 16),

        // Chart bars
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: dailyProductivity.take(7).map((day) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: _BarGroup(
                    date: day.date,
                    tasksHeight: (day.tasksCompleted / maxValue) * 200,
                    hoursHeight: (day.hoursWorked / maxValue) * 200,
                    breaksHeight: (day.breaksTaken / maxValue) * 200,
                    focusHeight:
                        (day.focusTime / 60 / maxValue) *
                        200, // Convert minutes to comparable scale
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bar_chart,
            size: 48,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No productivity data available',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
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

class _BarGroup extends StatelessWidget {
  final DateTime date;
  final double tasksHeight;
  final double hoursHeight;
  final double breaksHeight;
  final double focusHeight;

  const _BarGroup({
    required this.date,
    required this.tasksHeight,
    required this.hoursHeight,
    required this.breaksHeight,
    required this.focusHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Bars
        SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Tasks bar
              Expanded(
                child: Container(
                  height: tasksHeight,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(2),
                    ),
                  ),
                ),
              ),

              // Hours bar
              Expanded(
                child: Container(
                  height: hoursHeight,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: AppColors.success,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(2),
                    ),
                  ),
                ),
              ),

              // Focus/Pomodoros bar
              Expanded(
                child: Container(
                  height: focusHeight,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: AppColors.info,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(2),
                    ),
                  ),
                ),
              ),

              // Breaks bar
              Expanded(
                child: Container(
                  height: breaksHeight,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: AppColors.warning,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(2),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Date label
        Text(
          '${date.day}/${date.month}',
          style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

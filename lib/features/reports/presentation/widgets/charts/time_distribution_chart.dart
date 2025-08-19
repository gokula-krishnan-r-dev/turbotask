import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';

class TimeDistributionChart extends StatelessWidget {
  final List<TimeDistribution> timeDistribution;
  final String title;

  const TimeDistributionChart({
    super.key,
    required this.timeDistribution,
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
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 24),

          // Chart and Legend
          SizedBox(
            height: 300,
            child: timeDistribution.isEmpty
                ? _buildEmptyState()
                : Row(
                    children: [
                      // Pie Chart
                      Expanded(flex: 3, child: _buildPieChart()),

                      const SizedBox(width: 24),

                      // Legend
                      Expanded(flex: 2, child: _buildLegend()),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildPieChart() {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: CustomPaint(painter: PieChartPainter(timeDistribution)),
      ),
    );
  }

  Widget _buildLegend() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Total time at top
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 4),
              Text(
                '${_getTotalHours()}h ${_getTotalMinutes()}m',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // Category breakdown
        Expanded(
          child: ListView.builder(
            itemCount: timeDistribution.length,
            itemBuilder: (context, index) {
              final item = timeDistribution[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _LegendItem(
                  color: _parseColor(item.color),
                  category: item.category,
                  hours: item.totalHours,
                  percentage: item.percentage,
                  taskCount: item.taskCount,
                ),
              );
            },
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
            Icons.pie_chart_outline,
            size: 48,
            color: AppColors.textSecondary.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'No time distribution data available',
            style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }

  String _getTotalHours() {
    final totalHours = timeDistribution
        .map((d) => d.totalHours)
        .fold(0.0, (a, b) => a + b);
    return totalHours.floor().toString();
  }

  String _getTotalMinutes() {
    final totalHours = timeDistribution
        .map((d) => d.totalHours)
        .fold(0.0, (a, b) => a + b);
    final minutes = ((totalHours - totalHours.floor()) * 60).round();
    return minutes.toString().padLeft(2, '0');
  }

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      // Fallback colors based on category
      switch (colorString) {
        case '#4F46E5':
          return AppColors.primary;
        case '#10B981':
          return AppColors.success;
        case '#F59E0B':
          return AppColors.warning;
        case '#EF4444':
          return AppColors.error;
        case '#8B5CF6':
          return AppColors.purple;
        case '#06B6D4':
          return AppColors.info;
        default:
          return AppColors.textSecondary;
      }
    }
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String category;
  final double hours;
  final double percentage;
  final int taskCount;

  const _LegendItem({
    required this.color,
    required this.category,
    required this.hours,
    required this.percentage,
    required this.taskCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Color indicator
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),

        const SizedBox(width: 12),

        // Category and details
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _capitalizeCategory(category),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    '${percentage.toStringAsFixed(1)}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  Text(
                    '${hours.toStringAsFixed(1)}h',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '• $taskCount tasks',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _capitalizeCategory(String category) {
    if (category.isEmpty) return category;
    return category[0].toUpperCase() + category.substring(1);
  }
}

class PieChartPainter extends CustomPainter {
  final List<TimeDistribution> data;

  PieChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 10;

    double startAngle = -math.pi / 2; // Start from top

    for (int i = 0; i < data.length; i++) {
      final item = data[i];
      final sweepAngle = (item.percentage / 100) * 2 * math.pi;

      final paint = Paint()
        ..color = _parseColor(item.color)
        ..style = PaintingStyle.fill;

      // Draw pie slice
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      // Draw border between slices
      final borderPaint = Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        true,
        borderPaint,
      );

      startAngle += sweepAngle;
    }

    // Draw center circle for donut effect
    final centerPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, radius * 0.4, centerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString.substring(1), radix: 16) + 0xFF000000);
    } catch (e) {
      // Fallback colors
      switch (colorString) {
        case '#4F46E5':
          return AppColors.primary;
        case '#10B981':
          return AppColors.success;
        case '#F59E0B':
          return AppColors.warning;
        case '#EF4444':
          return AppColors.error;
        case '#8B5CF6':
          return AppColors.purple;
        case '#06B6D4':
          return AppColors.info;
        default:
          return AppColors.textSecondary;
      }
    }
  }
}

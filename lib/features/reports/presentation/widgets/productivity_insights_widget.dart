import 'package:flutter/material.dart';
import 'package:turbotask/core/theme/app_colors.dart';
import 'package:turbotask/features/reports/data/models/report_models.dart';

class ProductivityInsightsWidget extends StatelessWidget {
  final ProductivityInsights insights;

  const ProductivityInsightsWidget({super.key, required this.insights});

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
            'Productivity Insights',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 20),

          // Insights Grid
          Column(
            children: [
              // Most Productive Hour
              _InsightCard(
                title: 'MOST PRODUCTIVE HOUR',
                value: _formatHour(insights.mostProductiveHour),
                icon: Icons.access_time,
                color: AppColors.primary,
              ),

              const SizedBox(height: 16),

              // Most Productive Day
              _InsightCard(
                title: 'MOST PRODUCTIVE DAY',
                value: insights.mostProductiveDay,
                icon: Icons.calendar_today,
                color: AppColors.success,
              ),

              const SizedBox(height: 16),

              // Most Productive Month
              _InsightCard(
                title: 'MOST PRODUCTIVE MONTH',
                value: insights.mostProductiveMonth,
                icon: Icons.date_range,
                color: AppColors.warning,
              ),

              const SizedBox(height: 16),

              // Best Performing Category
              _InsightCard(
                title: 'BEST PERFORMING CATEGORY',
                value: _capitalizeCategory(insights.bestPerformingCategory),
                icon: Icons.category,
                color: AppColors.purple,
              ),

              const SizedBox(height: 16),

              // Average Session Length
              _InsightCard(
                title: 'AVERAGE SESSION LENGTH',
                value:
                    '${insights.averageSessionLength.toStringAsFixed(0)} min',
                icon: Icons.timer,
                color: AppColors.info,
              ),

              const SizedBox(height: 16),

              // Optimal Break Frequency
              _InsightCard(
                title: 'OPTIMAL BREAK FREQUENCY',
                value: '${insights.optimalBreakFrequency} min',
                icon: Icons.coffee,
                color: AppColors.error,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatHour(int hour) {
    if (hour == 0) return '12 AM';
    if (hour < 12) return '$hour AM';
    if (hour == 12) return '12 PM';
    return '${hour - 12} PM';
  }

  String _capitalizeCategory(String category) {
    if (category.isEmpty) return category;
    return category[0].toUpperCase() + category.substring(1);
  }
}

class _InsightCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _InsightCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2), width: 1),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: color),
          ),

          const SizedBox(width: 16),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Extended version with more detailed insights
class ExtendedProductivityInsightsWidget extends StatelessWidget {
  final ProductivityInsights insights;
  final List<HourlyProductivity>? hourlyData;

  const ExtendedProductivityInsightsWidget({
    super.key,
    required this.insights,
    this.hourlyData,
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
              Icon(Icons.lightbulb_outline, color: AppColors.primary, size: 24),
              const SizedBox(width: 12),
              Text(
                'Productivity Insights',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Key Insights
          _buildKeyInsights(),

          const SizedBox(height: 24),

          // Recommendations
          _buildRecommendations(),
        ],
      ),
    );
  }

  Widget _buildKeyInsights() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Key Insights',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),

          _InsightRow(
            icon: Icons.star,
            text:
                'You\'re most productive at ${_formatHour(insights.mostProductiveHour)}',
            color: AppColors.warning,
          ),

          const SizedBox(height: 8),

          _InsightRow(
            icon: Icons.trending_up,
            text: '${insights.mostProductiveDay} is your strongest day',
            color: AppColors.success,
          ),

          const SizedBox(height: 8),

          _InsightRow(
            icon: Icons.category,
            text:
                '${_capitalizeCategory(insights.bestPerformingCategory)} tasks perform best',
            color: AppColors.info,
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendations() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.success.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommendations',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),

          _RecommendationRow(
            text:
                'Schedule important tasks around ${_formatHour(insights.mostProductiveHour)}',
          ),

          const SizedBox(height: 8),

          _RecommendationRow(
            text:
                'Take breaks every ${insights.optimalBreakFrequency} minutes for optimal focus',
          ),

          const SizedBox(height: 8),

          _RecommendationRow(
            text:
                'Keep sessions around ${insights.averageSessionLength.toStringAsFixed(0)} minutes',
          ),
        ],
      ),
    );
  }

  String _formatHour(int hour) {
    if (hour == 0) return '12 AM';
    if (hour < 12) return '$hour AM';
    if (hour == 12) return '12 PM';
    return '${hour - 12} PM';
  }

  String _capitalizeCategory(String category) {
    if (category.isEmpty) return category;
    return category[0].toUpperCase() + category.substring(1);
  }
}

class _InsightRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _InsightRow({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}

class _RecommendationRow extends StatelessWidget {
  final String text;

  const _RecommendationRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 4,
          margin: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            color: AppColors.success,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}

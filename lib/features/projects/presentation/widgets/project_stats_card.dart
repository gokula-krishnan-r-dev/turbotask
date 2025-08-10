import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../domain/entities/project_stats.dart';

/// Beautiful project statistics card with animated counters
class ProjectStatsCard extends StatelessWidget {
  const ProjectStatsCard({super.key, required this.stats});

  final ProjectStats stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.dividerColor.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              AppColors.mint.withValues(alpha: 0.05),
              AppColors.teal.withValues(alpha: 0.02),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ResponsiveUtils.isDesktop(context)
            ? _buildDesktopLayout(context, theme)
            : _buildMobileLayout(context, theme),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          children: [
            Icon(Icons.analytics_outlined, color: AppColors.mint, size: 24),
            const SizedBox(width: 12),
            Text(
              'Project Overview',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),

        // Stats grid
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildStatItem(
              context,
              'Total Projects',
              stats.totalProjects.toString(),
              Icons.folder_outlined,
              AppColors.mint,
            ),
            _buildStatItem(
              context,
              'Active Projects',
              stats.activeProjects.toString(),
              Icons.play_circle_outline,
              AppColors.teal,
            ),
            _buildStatItem(
              context,
              'Completed Tasks',
              stats.completedTasks.toString(),
              Icons.task_alt,
              AppColors.success,
            ),
            _buildStatItem(
              context,
              'Completion Rate',
              '${stats.completionRate.toInt()}%',
              Icons.trending_up,
              AppColors.warning,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          children: [
            Icon(Icons.analytics_outlined, color: AppColors.mint, size: 20),
            const SizedBox(width: 8),
            Text(
              'Overview',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Stats row for mobile
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount:
              ResponsiveUtils.isTablet(context) ||
                  ResponsiveUtils.isIPad(context)
              ? 4
              : 2,
          childAspectRatio:
              ResponsiveUtils.isTablet(context) ||
                  ResponsiveUtils.isIPad(context)
              ? 1.3
              : 1.2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _buildStatItem(
              context,
              'Projects',
              stats.totalProjects.toString(),
              Icons.folder_outlined,
              AppColors.mint,
            ),
            _buildStatItem(
              context,
              'Active',
              stats.activeProjects.toString(),
              Icons.play_circle_outline,
              AppColors.teal,
            ),
            _buildStatItem(
              context,
              'Tasks Done',
              stats.completedTasks.toString(),
              Icons.task_alt,
              AppColors.success,
            ),
            _buildStatItem(
              context,
              'Progress',
              '${stats.completionRate.toInt()}%',
              Icons.trending_up,
              AppColors.warning,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return Container(
      padding: EdgeInsets.all(isDesktop ? 16 : 12),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.dividerColor.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, color: color, size: isDesktop ? 16 : 14),
              ),
              if (isDesktop) ...[const Spacer(), _buildTrendingIcon()],
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: isDesktop ? 20 : 18,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
              fontSize: isDesktop ? 12 : 11,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingIcon() {
    // For now, show positive trend
    return Icon(Icons.trending_up, color: AppColors.success, size: 14);
  }
}

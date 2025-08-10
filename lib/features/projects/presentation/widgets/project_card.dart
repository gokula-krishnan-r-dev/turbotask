import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/project.dart';

/// Beautiful project card widget inspired by modern task management UI
class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  final Project project;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = _parseColor(project.colorTheme);

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
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                colorTheme.withValues(alpha: 0.05),
                colorTheme.withValues(alpha: 0.02),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row with category and favorite
              Row(
                children: [
                  // Category chip
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: colorTheme.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      project.category.toUpperCase(),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: colorTheme,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // Favorite button
                  InkWell(
                    onTap: onFavoriteToggle,
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Icon(
                        project.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: project.isFavorite
                            ? AppColors.error
                            : theme.iconTheme.color?.withValues(alpha: 0.5),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Project title
              Text(
                project.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 8),

              // Project description
              Text(
                project.description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodyMedium?.color?.withValues(
                    alpha: 0.7,
                  ),
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const Spacer(),

              // Progress section
              if (project.taskCount > 0) ...[
                const SizedBox(height: 16),
                _buildProgressSection(context, theme, colorTheme),
              ] else ...[
                const SizedBox(height: 16),
                _buildEmptyProgressSection(context, theme),
              ],

              const SizedBox(height: 12),

              // Task count info
              Row(
                children: [
                  Icon(
                    Icons.task_alt,
                    size: 16,
                    color: theme.iconTheme.color?.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    project.taskCount == 0
                        ? 'No tasks yet'
                        : '${project.completedTaskCount}/${project.taskCount} tasks',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withValues(
                        alpha: 0.6,
                      ),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  // Created date
                  Text(
                    _formatDate(project.createdAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withValues(
                        alpha: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressSection(
    BuildContext context,
    ThemeData theme,
    Color colorTheme,
  ) {
    final progress = project.completionPercentage / 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Progress',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Text(
              '${project.completionPercentage.toInt()}%',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorTheme,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: theme.dividerColor.withValues(alpha: 0.1),
          valueColor: AlwaysStoppedAnimation<Color>(colorTheme),
          minHeight: 6,
          borderRadius: BorderRadius.circular(3),
        ),
      ],
    );
  }

  Widget _buildEmptyProgressSection(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.dividerColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.add_task,
            size: 16,
            color: theme.iconTheme.color?.withValues(alpha: 0.5),
          ),
          const SizedBox(width: 8),
          Text(
            'Add your first task',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Color _parseColor(String colorString) {
    try {
      // Remove # if present
      String hexColor = colorString.replaceAll('#', '');

      // Add FF for full opacity if not present
      if (hexColor.length == 6) {
        hexColor = 'FF$hexColor';
      }

      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      // Fallback to default color if parsing fails
      return AppColors.mint;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return weeks == 1 ? '1 week ago' : '$weeks weeks ago';
    } else {
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${months[date.month - 1]} ${date.day}';
    }
  }
}

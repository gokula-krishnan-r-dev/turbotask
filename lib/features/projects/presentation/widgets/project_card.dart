import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../todos/presentation/widgets/ai_task_creation_widget.dart';
import '../../domain/entities/project.dart';

/// Enhanced project card widget with modern UI and animations
class ProjectCard extends StatefulWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.onTap,
    required this.onFavoriteToggle,
    this.onTaskCreated,
  });

  final Project project;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;
  final VoidCallback? onTaskCreated;

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  void _showAITaskCreation() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: AITaskCreationWidget(
              projectId: widget.project.id,
              onTaskCreated: (response) {
                Navigator.of(context).pop();
                widget.onTaskCreated?.call();
              },
              onClose: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorTheme = _parseColor(widget.project.colorTheme);
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isTablet =
        ResponsiveUtils.isTablet(context) || ResponsiveUtils.isIPad(context);

    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _scaleController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _scaleController.reverse();
      },
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isDesktop ? 20 : 16),
                gradient: LinearGradient(
                  colors: [
                    theme.brightness == Brightness.dark
                        ? AppColors.gray800.withOpacity(0.9)
                        : Colors.white.withOpacity(0.95),
                    theme.brightness == Brightness.dark
                        ? AppColors.gray900.withOpacity(0.7)
                        : colorTheme.withOpacity(0.02),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),

                border: Border.all(
                  color: _isHovered
                      ? colorTheme.withOpacity(0.1)
                      : colorTheme.withOpacity(0.1),
                  width: 1.5,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(isDesktop ? 20 : 16),
                child: InkWell(
                  onTap: widget.onTap,
                  borderRadius: BorderRadius.circular(isDesktop ? 20 : 16),
                  splashColor: colorTheme.withOpacity(0.1),
                  highlightColor: colorTheme.withOpacity(0.05),
                  child: Container(
                    padding: EdgeInsets.all(
                      isDesktop
                          ? 24
                          : isTablet
                          ? 20
                          : 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Enhanced header with category and favorite
                        _buildHeader(context, theme, colorTheme, isDesktop),

                        SizedBox(height: isDesktop ? 20 : 16),

                        // Enhanced project title
                        _buildProjectTitle(context, theme, isDesktop),

                        SizedBox(height: isDesktop ? 12 : 8),

                        // Enhanced project description
                        _buildProjectDescription(context, theme, isDesktop),

                        const Spacer(),

                        // Enhanced progress section
                        if (widget.project.taskCount > 0) ...[
                          SizedBox(height: isDesktop ? 20 : 16),
                          _buildProgressSection(
                            context,
                            theme,
                            colorTheme,
                            isDesktop,
                          ),
                        ] else ...[
                          SizedBox(height: isDesktop ? 20 : 16),
                          _buildEmptyProgressSection(context, theme, isDesktop),
                        ],

                        SizedBox(height: isDesktop ? 16 : 12),

                        // Enhanced footer with task info and date
                        _buildFooter(context, theme, isDesktop),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    ThemeData theme,
    Color colorTheme,
    bool isDesktop,
  ) {
    return Row(
      children: [
        // Enhanced category chip
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 16 : 12,
            vertical: isDesktop ? 8 : 6,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colorTheme.withOpacity(0.15),
                colorTheme.withOpacity(0.08),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: colorTheme.withOpacity(0.2), width: 1),
          ),
          child: Text(
            widget.project.category.toUpperCase(),
            style: theme.textTheme.labelSmall?.copyWith(
              color: colorTheme,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.8,
              fontSize: isDesktop ? 11 : 10,
            ),
          ),
        ),

        const Spacer(),

        // AI Task Creation Button
        GestureDetector(
          onTap: _showAITaskCreation,
          child: Container(
            padding: EdgeInsets.all(isDesktop ? 8 : 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.mint.withOpacity(0.15),
                  AppColors.teal.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.mint.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.auto_awesome,
                  size: isDesktop ? 16 : 14,
                  color: AppColors.mint,
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.add,
                  size: isDesktop ? 16 : 14,
                  color: AppColors.mint,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProjectTitle(
    BuildContext context,
    ThemeData theme,
    bool isDesktop,
  ) {
    return Text(
      widget.project.title,
      style: theme.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.2,
        fontSize: isDesktop ? 20 : 18,
        letterSpacing: -0.3,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProjectDescription(
    BuildContext context,
    ThemeData theme,
    bool isDesktop,
  ) {
    return Text(
      widget.project.description,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: theme.colorScheme.onSurface.withOpacity(0.7),
        height: 1.5,
        fontSize: isDesktop ? 14 : 13,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildProgressSection(
    BuildContext context,
    ThemeData theme,
    Color colorTheme,
    bool isDesktop,
  ) {
    final progress = widget.project.completionPercentage / 100;

    return Container(
      padding: EdgeInsets.all(isDesktop ? 16 : 12),
      decoration: BoxDecoration(
        color: theme.cardColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorTheme.withOpacity(0.1), width: 1),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: colorTheme.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.trending_up_rounded,
                  color: colorTheme,
                  size: isDesktop ? 16 : 14,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Progress',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: isDesktop ? 12 : 11,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorTheme.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${widget.project.completionPercentage.toInt()}%',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorTheme,
                    fontWeight: FontWeight.w700,
                    fontSize: isDesktop ? 12 : 11,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1000),
              tween: Tween(begin: 0.0, end: progress),
              curve: Curves.easeOutCubic,
              builder: (context, animatedProgress, child) {
                return LinearProgressIndicator(
                  value: animatedProgress,
                  backgroundColor: theme.dividerColor.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(colorTheme),
                  minHeight: isDesktop ? 8 : 6,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyProgressSection(
    BuildContext context,
    ThemeData theme,
    bool isDesktop,
  ) {
    return Container(
      padding: EdgeInsets.all(isDesktop ? 16 : 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.mint.withOpacity(0.05),
            AppColors.teal.withOpacity(0.02),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.mint.withOpacity(0.1), width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.mint.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.add_task_rounded,
              size: isDesktop ? 18 : 16,
              color: AppColors.mint,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ready to start',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: isDesktop ? 13 : 12,
                  ),
                ),
                Text(
                  'Add your first task to begin',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.6),
                    fontSize: isDesktop ? 11 : 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, ThemeData theme, bool isDesktop) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: theme.cardColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            Icons.task_alt_rounded,
            size: isDesktop ? 16 : 14,
            color: theme.iconTheme.color?.withOpacity(0.6),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          widget.project.taskCount == 0
              ? 'No tasks yet'
              : '${widget.project.completedTaskCount}/${widget.project.taskCount} tasks',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.7),
            fontWeight: FontWeight.w500,
            fontSize: isDesktop ? 12 : 11,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: theme.dividerColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            _formatDate(widget.project.createdAt),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.5),
              fontSize: isDesktop ? 11 : 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
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
      return '${difference.inDays}d ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks}w ago';
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

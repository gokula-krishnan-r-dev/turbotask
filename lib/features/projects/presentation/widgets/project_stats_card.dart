import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../domain/entities/project_stats.dart';

/// Beautiful project statistics card with animated counters and responsive design
class ProjectStatsCard extends StatefulWidget {
  const ProjectStatsCard({super.key, required this.stats});

  final ProjectStats stats;

  @override
  State<ProjectStatsCard> createState() => _ProjectStatsCardState();
}

class _ProjectStatsCardState extends State<ProjectStatsCard>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOutCubic),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    // Start animations
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _scaleController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final isTablet =
        ResponsiveUtils.isTablet(context) || ResponsiveUtils.isIPad(context);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(isDesktop ? 24 : 20),
            boxShadow: [
              BoxShadow(
                color: theme.brightness == Brightness.dark
                    ? Colors.black.withOpacity(0.3)
                    : AppColors.mint.withOpacity(0.1),
                blurRadius: isDesktop ? 20 : 15,
                offset: const Offset(0, 8),
                spreadRadius: 0,
              ),
              BoxShadow(
                color: theme.brightness == Brightness.dark
                    ? AppColors.mint.withOpacity(0.05)
                    : Colors.white.withOpacity(0.8),
                blurRadius: isDesktop ? 10 : 8,
                offset: const Offset(0, -2),
                spreadRadius: 0,
              ),
            ],
            border: Border.all(
              color: theme.brightness == Brightness.dark
                  ? AppColors.mint.withOpacity(0.1)
                  : AppColors.mint.withOpacity(0.08),
              width: 1.5,
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(
              isDesktop
                  ? 24
                  : isTablet
                  ? 24
                  : 20,
            ),
            child: isDesktop
                ? _buildDesktopLayout(context, theme)
                : isTablet
                ? _buildTabletLayout(context, theme)
                : _buildMobileLayout(context, theme),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Enhanced header
        _buildHeader(context, theme, isDesktop: true),
        const SizedBox(height: 24),

        // Stats grid with enhanced design - more compact for desktop
        _buildStatsGrid(context, theme, crossAxisCount: 4, isDesktop: true),
      ],
    );
  }

  Widget _buildTabletLayout(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Enhanced header
        _buildHeader(context, theme, isDesktop: false),
        const SizedBox(height: 24),

        // Stats grid optimized for tablet
        _buildStatsGrid(context, theme, crossAxisCount: 4, isDesktop: false),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Enhanced header
        _buildHeader(context, theme, isDesktop: false),
        const SizedBox(height: 20),

        // Stats grid optimized for mobile
        _buildStatsGrid(context, theme, crossAxisCount: 2, isDesktop: false),
      ],
    );
  }

  Widget _buildHeader(
    BuildContext context,
    ThemeData theme, {
    required bool isDesktop,
  }) {
    return Row(
      children: [
        // Enhanced icon with gradient background - smaller for desktop
        Container(
          padding: EdgeInsets.all(isDesktop ? 10 : 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.mint, AppColors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(isDesktop ? 12 : 12),
            boxShadow: [
              BoxShadow(
                color: AppColors.mint.withOpacity(0.2),
                blurRadius: isDesktop ? 6 : 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            Icons.analytics_rounded,
            color: Colors.white,
            size: isDesktop ? 20 : 24,
          ),
        ),

        SizedBox(width: isDesktop ? 16 : 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isDesktop ? 'Project Analytics' : 'Analytics',
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: isDesktop ? 20 : 20,
                  letterSpacing: -0.3,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Real-time insights',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                  fontSize: isDesktop ? 13 : 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),

        // Trending indicator
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.success.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.trending_up_rounded,
                color: AppColors.success,
                size: isDesktop ? 14 : 14,
              ),
              const SizedBox(width: 4),
              Text(
                '+12%',
                style: TextStyle(
                  color: AppColors.success,
                  fontWeight: FontWeight.w600,
                  fontSize: isDesktop ? 11 : 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(
    BuildContext context,
    ThemeData theme, {
    required int crossAxisCount,
    required bool isDesktop,
  }) {
    final stats = [
      _StatData(
        label: isDesktop ? 'Total Projects' : 'Projects',
        value: widget.stats.totalProjects,
        icon: Icons.folder_rounded,
        color: AppColors.mint,
        trend: '+3',
      ),
      _StatData(
        label: isDesktop ? 'Active Projects' : 'Active',
        value: widget.stats.activeProjects,
        icon: Icons.play_circle_fill_rounded,
        color: AppColors.teal,
        trend: '+2',
      ),
      _StatData(
        label: isDesktop ? 'Completed Tasks' : 'Completed',
        value: widget.stats.completedTasks,
        icon: Icons.task_alt_rounded,
        color: AppColors.success,
        trend: '+8',
      ),
      _StatData(
        label: 'Completion',
        value: widget.stats.completionRate.toInt(),
        icon: Icons.trending_up_rounded,
        color: AppColors.warning,
        trend: '+5%',
        isPercentage: true,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: isDesktop
            ? 2.2
            : crossAxisCount == 4
            ? 1.2
            : 1.3,
        crossAxisSpacing: isDesktop ? 16 : 16,
        mainAxisSpacing: isDesktop ? 16 : 16,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        return _buildEnhancedStatItem(
          context,
          theme,
          stats[index],
          index,
          isDesktop: isDesktop,
        );
      },
    );
  }

  Widget _buildEnhancedStatItem(
    BuildContext context,
    ThemeData theme,
    _StatData statData,
    int index, {
    required bool isDesktop,
  }) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 600 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.brightness == Brightness.dark
                      ? AppColors.gray700.withOpacity(0.4)
                      : Colors.white.withOpacity(0.9),
                  theme.brightness == Brightness.dark
                      ? AppColors.gray800.withOpacity(0.2)
                      : statData.color.withOpacity(0.02),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(isDesktop ? 16 : 16),
              border: Border.all(
                color: statData.color.withOpacity(0.12),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: statData.color.withOpacity(0.06),
                  blurRadius: isDesktop ? 8 : 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: EdgeInsets.all(isDesktop ? 16 : 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon and trend
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(isDesktop ? 8 : 8),
                      decoration: BoxDecoration(
                        color: statData.color.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(
                          isDesktop ? 10 : 10,
                        ),
                      ),
                      child: Icon(
                        statData.icon,
                        color: statData.color,
                        size: isDesktop ? 16 : 18,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        statData.trend,
                        style: TextStyle(
                          color: AppColors.success,
                          fontSize: isDesktop ? 9 : 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isDesktop ? 0 : 8),

                // Value with animation - more compact for desktop
                TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 1000 + (index * 200)),
                  tween: Tween(begin: 0.0, end: statData.value.toDouble()),
                  curve: Curves.easeOutCubic,
                  builder: (context, animatedValue, child) {
                    return RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: animatedValue.toInt().toString(),
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              fontSize: isDesktop ? 22 : 24,
                              color: theme.colorScheme.onSurface,
                              height: 1.0,
                            ),
                          ),
                          if (statData.isPercentage)
                            TextSpan(
                              text: '%',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: statData.color,
                                fontSize: isDesktop ? 14 : 16,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: isDesktop ? 6 : 4),

                // Label - more compact for desktop
                Text(
                  statData.label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                    fontSize: isDesktop ? 11 : 11,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StatData {
  final String label;
  final int value;
  final IconData icon;
  final Color color;
  final String trend;
  final bool isPercentage;

  const _StatData({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
    required this.trend,
    this.isPercentage = false,
  });
}

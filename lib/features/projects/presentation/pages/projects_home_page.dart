import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbotask/features/reports/presentation/pages/reports_page.dart';

import '../../../../core/auth/auth_bloc.dart';
import '../../../../core/auth/auth_state.dart';
import '../../../../core/auth/auth_state_event.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_manager.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../domain/entities/project.dart';
import '../bloc/projects_bloc.dart';
import '../bloc/projects_event.dart';
import '../bloc/projects_state.dart';
import '../widgets/create_project_modal.dart';
import '../widgets/project_card.dart';
import '../widgets/project_stats_card.dart';
import 'project_detail_page.dart';

/// Projects home page with beautiful responsive UI
/// Inspired by modern task management interfaces
class ProjectsHomePage extends StatelessWidget {
  const ProjectsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the globally provided ProjectsBloc from the app root
    return const _ProjectsHomeView();
  }
}

class _ProjectsHomeView extends StatefulWidget {
  const _ProjectsHomeView();

  @override
  State<_ProjectsHomeView> createState() => _ProjectsHomeViewState();
}

class _ProjectsHomeViewState extends State<_ProjectsHomeView> {
  bool _loadedOnce = false;

  @override
  void initState() {
    super.initState();
    // Defer dispatching the first load until after first frame to ensure context is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = context.read<ProjectsBloc>();
      if (!_loadedOnce && bloc.state.status == ProjectsStatus.initial) {
        _loadedOnce = true;
        bloc.add(const ProjectsEvent.loadProjects());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = context.read<AuthBloc>().state.user;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocListener<ProjectsBloc, ProjectsState>(
          listener: (context, state) {
            if (state.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: AppColors.error,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            } else if (state.status == ProjectsStatus.created) {
              // Show success toast message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white, size: 20),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          '🎉 Project created successfully!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: AppColors.mint,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(16),
                  duration: const Duration(seconds: 3),
                  elevation: 8,
                ),
              );
            }

            // Show subtle refresh indicator when refreshing after project creation
            if (state.isRefreshing) {
              // Show a subtle loading toast when refreshing
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Row(
                    children: [
                      SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Updating project list...',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.blueGrey.shade600,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.all(16),
                  duration: const Duration(milliseconds: 1500),
                ),
              );
            }
          },
          child: ResponsiveUtils.isDesktop(context)
              ? _buildDesktopLayout(context, theme, user?.fullName ?? 'User')
              : _buildMobileLayout(context, theme, user?.fullName ?? 'User'),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(
    BuildContext context,
    ThemeData theme,
    String userName,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Sidebar
        Container(width: 280, child: _buildSidebar(context, theme)),
        // Main content
        Expanded(child: _buildMainContent(context, theme, userName)),
      ],
    );
  }

  Widget _buildMobileLayout(
    BuildContext context,
    ThemeData theme,
    String userName,
  ) {
    return _buildMainContent(context, theme, userName);
  }

  Widget _buildSidebar(BuildContext context, ThemeData theme) {
    return Column(
      children: [
        // Header
        Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.mint, AppColors.teal],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.task_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'TurboTask',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.mint,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        child: Text(
                          'BETA',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'v0.1.0',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color?.withValues(
                            alpha: 0.7,
                          ),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 12),
                ],
              ),
              const SizedBox(height: 12),
              //ad a text for plan free
              Text(
                'Plan: Free',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              //add a subtext about this applictaion
              Text(
                'A simple and beautiful task management application for your daily tasks and projects. Actively developing and improving the application.',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  color: theme.textTheme.bodySmall?.color?.withValues(
                    alpha: 0.7,
                  ),
                ),
              ),
            ],
          ),
        ),

        //here add a card with inside add a buton for create project and a text for create project
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Column(
            children: [
              //show a button for create project
              FilledButton.icon(
                onPressed: () {
                  _showCreateProjectModal(context);
                },
                icon: const Icon(Icons.add),
                label: Text('Create Project'),
              ),
            ],
          ),
        ),

        const Spacer(),

        //add a button for report navigation
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: FilledButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ReportsPage()),
              );
            },
            icon: const Icon(Icons.bar_chart),
            label: const Text('Reports'),
          ),
        ),

        // User profile and settings
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.mint,
                  child: Text(
                    context
                            .read<AuthBloc>()
                            .state
                            .user
                            ?.fullName
                            .substring(0, 1)
                            .toUpperCase() ??
                        'U',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  context.read<AuthBloc>().state.user?.fullName ?? 'User',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  'Free Plan',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.textTheme.bodySmall?.color?.withValues(
                      alpha: 0.6,
                    ),
                  ),
                ),
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        getIt<ThemeManager>().toggleTheme();
                      },
                      icon: Icon(
                        theme.brightness == Brightness.dark
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        size: 16,
                      ),
                      label: const Text('Theme'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {
                      getIt<AuthBloc>().add(const AuthStateEvent.logout());
                    },
                    icon: const Icon(Icons.logout),
                    tooltip: 'Logout',
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    IconData icon,
    String title,
    bool isActive,
    VoidCallback onTap,
  ) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: ListTile(
        leading: Icon(
          icon,
          color: isActive
              ? AppColors.mint
              : theme.iconTheme.color?.withValues(alpha: 0.7),
        ),
        title: Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: isActive
                ? AppColors.mint
                : theme.textTheme.bodyMedium?.color,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        tileColor: isActive ? AppColors.mint.withValues(alpha: 0.1) : null,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    ThemeData theme,
    String userName,
  ) {
    return CustomScrollView(
      slivers: [
        // Header
        SliverAppBar(
          floating: true,
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: !ResponsiveUtils.isDesktop(context),
          elevation: 0,
          expandedHeight: ResponsiveUtils.isDesktop(context) ? 100 : 100,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveUtils.getResponsivePadding(
                  context,
                ).horizontal,
                vertical: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _getGreeting(userName),
                              style: theme.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: ResponsiveUtils.isDesktop(context)
                                    ? 28
                                    : 24,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Ready to manage your projects?',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: theme.textTheme.bodyLarge?.color
                                    ?.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!ResponsiveUtils.isDesktop(context)) ...[
                        IconButton(
                          onPressed: () {
                            getIt<ThemeManager>().toggleTheme();
                          },
                          icon: Icon(
                            theme.brightness == Brightness.dark
                                ? Icons.light_mode
                                : Icons.dark_mode,
                          ),
                          tooltip: 'Toggle theme',
                        ),
                        IconButton(
                          onPressed: () {
                            getIt<AuthBloc>().add(
                              const AuthStateEvent.logout(),
                            );
                          },
                          icon: const Icon(Icons.logout),
                          tooltip: 'Logout',
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),

        // Content
        SliverPadding(
          padding: ResponsiveUtils.getResponsivePadding(context),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // Stats card
              BlocBuilder<ProjectsBloc, ProjectsState>(
                buildWhen: (previous, current) =>
                    previous.stats != current.stats,
                builder: (context, state) {
                  if (state.stats != null) {
                    return ProjectStatsCard(stats: state.stats!);
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 24),

              // Projects header with create button
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Your Projects',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  BlocBuilder<ProjectsBloc, ProjectsState>(
                    buildWhen: (previous, current) =>
                        previous.isCreating != current.isCreating,
                    builder: (context, state) {
                      return FilledButton.icon(
                        onPressed: state.isCreating
                            ? null
                            : () {
                                _showCreateProjectModal(context);
                              },
                        icon: state.isCreating
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(Icons.add),
                        label: Text(
                          state.isCreating ? 'Creating...' : 'Create Project',
                        ),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.mint,
                          foregroundColor: Colors.black,
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Projects grid
              BlocBuilder<ProjectsBloc, ProjectsState>(
                builder: (context, state) {
                  if (state.hasError) {
                    return _buildEmptyState(context, theme);
                  }
                  if (state.isLoading) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(32),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (state.isEmpty) {
                    return _buildEmptyState(context, theme);
                  }

                  return _buildProjectsGrid(context, state.displayProjects);
                },
              ),

              const SizedBox(height: 100), // Bottom padding
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(BuildContext context, ThemeData theme) {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.brightness == Brightness.dark
            ? const Color(0xFF1A1A1A)
            : const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: CustomPaint(
        painter: _GridPatternPainter(
          theme.brightness == Brightness.dark
              ? Colors.white.withValues(alpha: 0.03)
              : Colors.black.withValues(alpha: 0.03),
        ),
        child: Container(
          padding: const EdgeInsets.all(48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Rocket emoji with subtle animation
              TweenAnimationBuilder<double>(
                duration: const Duration(seconds: 2),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, -10 * (1 - value)),
                    child: Opacity(
                      opacity: value,
                      child: const Text('🚀', style: TextStyle(fontSize: 48)),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),

              // Main text
              Text(
                'Create your first list to get started 🚀',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.brightness == Brightness.dark
                      ? Colors.white.withValues(alpha: 0.9)
                      : Colors.black.withValues(alpha: 0.8),
                  letterSpacing: -0.5,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Create button with modern design
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mint.withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showCreateProjectModal(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mint,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  icon: const Icon(Icons.add, size: 20),
                  label: const Text('CREATE LIST'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context, List<Project> projects) {
    final crossAxisCount = ResponsiveUtils.isDesktop(context)
        ? 3.2
        : ResponsiveUtils.isTablet(context) || ResponsiveUtils.isIPad(context)
        ? 2
        : 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount.toInt(),
        childAspectRatio: ResponsiveUtils.isDesktop(context) ? 1.2 : 1.3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectCard(
          project: projects[index],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ProjectDetailPage(project: projects[index]),
              ),
            );
          },
          onFavoriteToggle: () {
            context.read<ProjectsBloc>().add(
              ProjectsEvent.toggleFavorite(projects[index].id),
            );
          },
        );
      },
    );
  }

  void _showCreateProjectModal(BuildContext context) {
    final bloc = context.read<ProjectsBloc>();

    showDialog(
      context: context,
      builder: (dialogContext) =>
          BlocProvider.value(value: bloc, child: const CreateProjectModal()),
    );
  }

  String _getGreeting(String userName) {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Hey, Welcome back $userName';
    } else if (hour < 17) {
      return 'Good Afternoon $userName';
    } else {
      return 'Good Evening $userName  ';
    }
  }
}

/// Custom painter to create a subtle grid pattern background
class _GridPatternPainter extends CustomPainter {
  final Color gridColor;

  _GridPatternPainter(this.gridColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    const double gridSize = 20.0;

    // Draw vertical lines
    for (double x = 0; x <= size.width; x += gridSize) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (double y = 0; y <= size.height; y += gridSize) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

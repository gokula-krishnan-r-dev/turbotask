import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      children: [
        // Sidebar
        Container(
          width: 280,
          decoration: BoxDecoration(
            color: theme.cardColor,
            border: Border(
              right: BorderSide(
                color: theme.dividerColor.withValues(alpha: 0.1),
                width: 1,
              ),
            ),
          ),
          child: _buildSidebar(context, theme),
        ),
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
          padding: const EdgeInsets.all(24),
          child: Row(
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
            ],
          ),
        ),

        // Navigation items
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildNavItem(
                  context,
                  Icons.home_outlined,
                  'Home',
                  true,
                  () {},
                ),
                _buildNavItem(
                  context,
                  Icons.folder_outlined,
                  'All Projects',
                  false,
                  () {
                    context.read<ProjectsBloc>().add(
                      const ProjectsEvent.clearFilter(),
                    );
                  },
                ),
                _buildNavItem(
                  context,
                  Icons.favorite_outline,
                  'Favorites',
                  false,
                  () {
                    // Filter favorites
                  },
                ),
                _buildNavItem(
                  context,
                  Icons.archive_outlined,
                  'Archived',
                  false,
                  () {
                    // Show archived
                  },
                ),
              ],
            ),
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
          flexibleSpace: Container(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.getResponsivePadding(
                context,
              ).horizontal,
              vertical: 16,
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
                            _getGreeting(),
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
                          getIt<AuthBloc>().add(const AuthStateEvent.logout());
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
                          foregroundColor: Colors.white,
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
      padding: const EdgeInsets.all(48),
      child: Column(
        children: [
          Icon(
            Icons.folder_open_outlined,
            size: 64,
            color: theme.iconTheme.color?.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No projects yet',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.textTheme.titleLarge?.color?.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Create your first project to get started',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.5),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              _showCreateProjectModal(context);
            },
            icon: const Icon(Icons.add),
            label: const Text('Create Your First Project'),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.mint,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsGrid(BuildContext context, List<Project> projects) {
    final crossAxisCount = ResponsiveUtils.isDesktop(context)
        ? 3
        : ResponsiveUtils.isTablet(context) || ResponsiveUtils.isIPad(context)
        ? 2
        : 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
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

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}

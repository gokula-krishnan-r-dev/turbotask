import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/auth/auth_bloc.dart';
import '../../../../core/auth/auth_state.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_manager.dart';
import '../../../projects/domain/entities/project.dart';
import '../bloc/todos_bloc.dart';
import '../bloc/todos_event.dart';
import '../bloc/todos_state.dart';
import '../widgets/advanced_kanban_board.dart';

/// Project detail page with kanban-style todo management
class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TodosBloc>()..add(TodosEvent.loadProjectTodos(project.id)),
      child: _ProjectDetailView(project: project),
    );
  }
}

class _ProjectDetailView extends StatefulWidget {
  const _ProjectDetailView({required this.project});

  final Project project;

  @override
  State<_ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<_ProjectDetailView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final user = context.read<AuthBloc>().state.user;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: BlocListener<TodosBloc, TodosState>(
          listener: (context, state) {
            if (state.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(state.errorMessage!)),
                    ],
                  ),
                  backgroundColor: AppColors.error,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(16),
                  duration: const Duration(seconds: 4),
                ),
              );
            } else if (state.status == TodosStatus.created) {
              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white, size: 20),
                      SizedBox(width: 12),
                      Text('Task created successfully!'),
                    ],
                  ),
                  backgroundColor: AppColors.mint,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(16),
                  duration: const Duration(seconds: 2),
                ),
              );
            } else if (state.status == TodosStatus.updating &&
                state.errorMessage == 'Task moved successfully!') {
              // Show success message for drag-and-drop updates
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Row(
                    children: [
                      Icon(Icons.swap_horiz, color: Colors.white, size: 20),
                      SizedBox(width: 12),
                      Text('Task moved successfully!'),
                    ],
                  ),
                  backgroundColor: AppColors.blue,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(16),
                  duration: const Duration(milliseconds: 1500),
                ),
              );
            } else if (state.status == TodosStatus.updating &&
                state.errorMessage == 'Subtask created successfully!') {
              // Show success message for subtask creation
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Row(
                    children: [
                      Icon(Icons.add_task, color: Colors.white, size: 20),
                      SizedBox(width: 12),
                      Text('Subtask created successfully!'),
                    ],
                  ),
                  backgroundColor: AppColors.mint,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.all(16),
                  duration: const Duration(milliseconds: 1500),
                ),
              );
            }
          },
          child: Column(
            children: [
              // Header
              _buildHeader(context, theme),

              // Kanban Board
              Expanded(
                child: BlocBuilder<TodosBloc, TodosState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return AdvancedKanbanBoard(
                      projectId: widget.project.id,
                      userId: user?.id,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border(
          bottom: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Navigation and actions
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                style: IconButton.styleFrom(
                  backgroundColor: theme.dividerColor.withValues(alpha: 0.1),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (widget.project.description.isNotEmpty)
                      Text(
                        widget.project.description,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyMedium?.color?.withValues(
                            alpha: 0.7,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              // Theme toggle
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
            ],
          ),

          const SizedBox(height: 16),

          // Project stats
          BlocBuilder<TodosBloc, TodosState>(
            builder: (context, state) {
              return Row(
                children: [
                  _buildStatChip(
                    'Total Tasks',
                    state.totalTodos.toString(),
                    Icons.task_alt,
                    AppColors.blue,
                  ),
                  const SizedBox(width: 12),
                  _buildStatChip(
                    'Completed',
                    state.completedTodos.toString(),
                    Icons.check_circle,
                    AppColors.mint,
                  ),
                  const SizedBox(width: 12),
                  _buildStatChip(
                    'In Progress',
                    state.inProgressTodos.toString(),
                    Icons.schedule,
                    AppColors.orange,
                  ),
                  if (state.overdueTodos.isNotEmpty) ...[
                    const SizedBox(width: 12),
                    _buildStatChip(
                      'Overdue',
                      state.overdueTodos.length.toString(),
                      Icons.warning,
                      AppColors.error,
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  color: theme.textTheme.bodySmall?.color?.withValues(
                    alpha: 0.7,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

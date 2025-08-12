import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

import '../../../../core/network/api_service.dart';
import '../../../../core/di/injection.dart';
import '../../../todos/domain/entities/todo.dart';
import '../pages/floating_panel_page.dart';
import 'task_item.dart';

/// Widget that displays filtered tasks for the selected project
class TodayTasksList extends StatefulWidget {
  final String projectId;
  final TaskFilter filter;

  const TodayTasksList({
    super.key,
    required this.projectId,
    required this.filter,
  });

  @override
  State<TodayTasksList> createState() => _TodayTasksListState();
}

class _TodayTasksListState extends State<TodayTasksList> {
  final ApiService _apiService = getIt<ApiService>();
  List<Todo> _tasks = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  @override
  void didUpdateWidget(TodayTasksList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.projectId != widget.projectId ||
        oldWidget.filter != widget.filter) {
      _loadTasks();
    }
  }

  Future<void> _loadTasks() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      // Get project todos from API
      final response = await _apiService.get(
        '/api/v1/todo/projects/${widget.projectId}/todos',
      );

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data as Map<String, dynamic>;
        final todosData = data['data'] as List<dynamic>? ?? [];

        final allTasks = todosData
            .map((todoJson) => Todo.fromJson(todoJson as Map<String, dynamic>))
            .toList();

        // Filter tasks based on selected filter
        final filteredTasks = _filterTasks(allTasks, widget.filter);

        if (mounted) {
          setState(() {
            _tasks = filteredTasks;
            _isLoading = false;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            _error = 'Failed to load tasks';
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = 'Error loading tasks: ${e.toString()}';
          _isLoading = false;
        });
      }
    }
  }

  List<Todo> _filterTasks(List<Todo> tasks, TaskFilter filter) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    switch (filter) {
      case TaskFilter.today:
        return tasks.where((task) {
          if (task.dueDate == null) return false;
          final dueDate = DateTime(
            task.dueDate!.year,
            task.dueDate!.month,
            task.dueDate!.day,
          );
          return dueDate.isAtSameMomentAs(today) && !task.isCompleted;
        }).toList();

      case TaskFilter.upcoming:
        return tasks.where((task) {
          if (task.dueDate == null) return false;
          final dueDate = DateTime(
            task.dueDate!.year,
            task.dueDate!.month,
            task.dueDate!.day,
          );
          return dueDate.isAfter(today) && !task.isCompleted;
        }).toList();

      case TaskFilter.overdue:
        return tasks.where((task) {
          if (task.dueDate == null) return false;
          final dueDate = DateTime(
            task.dueDate!.year,
            task.dueDate!.month,
            task.dueDate!.day,
          );
          return dueDate.isBefore(today) && !task.isCompleted;
        }).toList();

      case TaskFilter.all:
        return tasks.where((task) => !task.isCompleted).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_isLoading) {
      return _buildLoadingState(theme);
    }

    if (_error != null) {
      return _buildErrorState(theme);
    }

    if (_tasks.isEmpty) {
      return _buildEmptyState(theme);
    }

    return RefreshIndicator(
      onRefresh: _loadTasks,
      color: theme.colorScheme.primary,
      backgroundColor: theme.colorScheme.surface,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: _tasks.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final task = _tasks[index];
          return TaskItem(
            task: task,
            onTaskTap: (task) => _handleTaskTap(task),
            onTaskToggle: (task, completed) =>
                _handleTaskToggle(task, completed),
          );
        },
      ),
    );
  }

  Widget _buildLoadingState(ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: theme.colorScheme.primary),
          const SizedBox(height: 16),
          AutoSizeText(
            'Loading tasks...',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.error.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.error.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.error_outline,
              size: 32,
              color: theme.colorScheme.error,
            ),
          ),
          const SizedBox(height: 16),
          AutoSizeText(
            'Oops! Something went wrong',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.error,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          const SizedBox(height: 8),
          AutoSizeText(
            _error!,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _loadTasks,
            icon: const Icon(Icons.refresh, size: 18),
            label: const Text('Try Again'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.error,
              foregroundColor: theme.colorScheme.onError,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: widget.filter == TaskFilter.today
              ? [
                  theme.colorScheme.primaryContainer.withOpacity(0.1),
                  theme.colorScheme.primaryContainer.withOpacity(0.05),
                ]
              : [
                  theme.colorScheme.surfaceVariant.withOpacity(0.3),
                  theme.colorScheme.surfaceVariant.withOpacity(0.1),
                ],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: widget.filter == TaskFilter.today
              ? theme.colorScheme.primary.withOpacity(0.2)
              : theme.colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.filter == TaskFilter.today
                    ? [
                        theme.colorScheme.primary.withOpacity(0.2),
                        theme.colorScheme.primary.withOpacity(0.1),
                      ]
                    : [
                        theme.colorScheme.surfaceVariant.withOpacity(0.3),
                        theme.colorScheme.surfaceVariant.withOpacity(0.1),
                      ],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getEmptyStateIcon(),
              size: 48,
              color: widget.filter == TaskFilter.today
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 24),
          AutoSizeText(
            _getEmptyStateTitle(),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          const SizedBox(height: 8),
          AutoSizeText(
            _getEmptyStateMessage(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
              height: 1.4,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          if (widget.filter == TaskFilter.today) ...[
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: theme.colorScheme.primary.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    size: 16,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  AutoSizeText(
                    'Use the "Add new task" button above to get started',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  IconData _getEmptyStateIcon() {
    switch (widget.filter) {
      case TaskFilter.today:
        return Icons.today;
      case TaskFilter.upcoming:
        return Icons.schedule;
      case TaskFilter.overdue:
        return Icons.warning_amber_rounded;
      case TaskFilter.all:
        return Icons.task_alt;
    }
  }

  String _getEmptyStateTitle() {
    switch (widget.filter) {
      case TaskFilter.today:
        return 'Your Day is Clear!';
      case TaskFilter.upcoming:
        return 'Nothing Coming Up';
      case TaskFilter.overdue:
        return 'All Caught Up!';
      case TaskFilter.all:
        return 'Ready to Start?';
    }
  }

  String _getEmptyStateMessage() {
    switch (widget.filter) {
      case TaskFilter.today:
        return 'No tasks scheduled for today. Perfect time to plan something new or enjoy a well-deserved break!';
      case TaskFilter.upcoming:
        return 'No upcoming tasks in your schedule. Why not plan ahead and add some goals for the future?';
      case TaskFilter.overdue:
        return 'Great job! You\'re all caught up with no overdue tasks. Keep up the excellent work!';
      case TaskFilter.all:
        return 'This project is empty. Create your first task to get started on something amazing!';
    }
  }

  void _handleTaskTap(Todo task) {
    // Handle task tap - could open task details or edit
    debugPrint('Task tapped: ${task.taskName}');
  }

  Future<void> _handleTaskToggle(Todo task, bool completed) async {
    try {
      // Update task completion status via API
      await _apiService.post(
        '/api/v1/todo/todos/${task.id}/${completed ? 'complete' : 'incomplete'}',
      );

      // Reload tasks to reflect changes
      _loadTasks();
    } catch (e) {
      debugPrint('Error toggling task: $e');
      // Show error message
      if (mounted) {
        final theme = Theme.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update task: ${e.toString()}'),
            backgroundColor: theme.colorScheme.error,
          ),
        );
      }
    }
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:turbotask/core/utils/responsive_utils.dart';

import '../../../../core/services/floating_panel_settings.dart';
import '../../../../core/services/floating_panel_manager.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../focus_mode/presentation/pages/focus_mode_page.dart';
import '../../../projects/presentation/bloc/projects_bloc.dart';
import '../../../projects/presentation/bloc/projects_event.dart';
import '../widgets/floating_panel_header.dart';
import '../../../todos/domain/entities/kanban_board.dart';
import '../../../todos/domain/entities/todo.dart';
import '../../../todos/presentation/bloc/kanban_board_bloc.dart';
import '../../../projects/presentation/widgets/today_task_card_widget.dart';
import '../../../projects/presentation/widgets/add_task_widget.dart';

/// Main floating panel page that stays on top of all applications
class FloatingPanelPage extends StatefulWidget {
  const FloatingPanelPage({super.key});

  @override
  State<FloatingPanelPage> createState() => _FloatingPanelPageState();
}

class _FloatingPanelPageState extends State<FloatingPanelPage> {
  String? _selectedProjectId;

  @override
  void initState() {
    super.initState();
    _loadDefaultProject();
    _loadProjects();
  }

  Future<void> _loadDefaultProject() async {
    final defaultProjectId = await FloatingPanelSettings.getDefaultProjectId();
    if (defaultProjectId != null && mounted) {
      setState(() {
        _selectedProjectId = defaultProjectId;
      });
    }
  }

  void _loadProjects() {
    context.read<ProjectsBloc>().add(const ProjectsEvent.loadProjects());
  }

  Future<void> _onProjectSelected(String projectId) async {
    print('FloatingPanel: Selected project: $projectId');
    print('FloatingPanel: Triggering API refetch for project: $projectId');

    setState(() {
      _selectedProjectId = projectId;
    });
    await FloatingPanelSettings.setDefaultProjectId(projectId);

    // Force immediate refresh of kanban data for the new project
    // This ensures fresh API data is fetched for the selected project
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) {
        print(
          'FloatingPanel: Rebuilding TodayColumnView with project: $projectId',
        );
        setState(() {
          // This will trigger a rebuild of _TodayColumnView with new projectId
          // which will automatically trigger a new API call via didUpdateWidget
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            children: [
              // Enhanced Header with gradient
              Container(
                child: FloatingPanelHeader(
                  onSettingsPressed: _openSettings,
                  onClosePressed: () => FloatingPanelManager.hidePanel(context),
                  selectedProjectId: _selectedProjectId,
                  onProjectSelected: (projectId) =>
                      _onProjectSelected(projectId!),
                ),
              ),

              const SizedBox(height: 12),

              // Enhanced Today Column
              Expanded(
                child: _selectedProjectId != null
                    ? BlocProvider(
                        key: ValueKey('kanban_bloc_$_selectedProjectId'),
                        create: (context) {
                          return getIt<KanbanBoardBloc>()
                            ..add(LoadKanbanBoard(_selectedProjectId!));
                        },
                        child: _TodayColumnView(
                          projectId: _selectedProjectId!,
                          key: ValueKey('today_view_$_selectedProjectId'),
                        ),
                      )
                    : _buildEmptyProjectState(theme),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyProjectState(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.1)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.folder_open_outlined,
                size: 48,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 20),
            AutoSizeText(
              'Choose Your Project',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            AutoSizeText(
              'Select a project above to view and manage your tasks',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  void _openSettings() {
    // Navigate to settings page
    Navigator.of(context).pushNamed('/floating-panel-settings');
  }
}

/// Task filter options
enum TaskFilter { today, upcoming, overdue, all }

extension TaskFilterExtension on TaskFilter {
  String get displayName {
    switch (this) {
      case TaskFilter.today:
        return 'Today';
      case TaskFilter.upcoming:
        return 'Upcoming';
      case TaskFilter.overdue:
        return 'Overdue';
      case TaskFilter.all:
        return 'All Tasks';
    }
  }

  IconData get icon {
    switch (this) {
      case TaskFilter.today:
        return Icons.today;
      case TaskFilter.upcoming:
        return Icons.schedule;
      case TaskFilter.overdue:
        return Icons.warning_amber_rounded;
      case TaskFilter.all:
        return Icons.list;
    }
  }
}

/// Today Column View for the floating panel
class _TodayColumnView extends StatefulWidget {
  const _TodayColumnView({super.key, required this.projectId});

  final String projectId;

  @override
  State<_TodayColumnView> createState() => _TodayColumnViewState();
}

class _TodayColumnViewState extends State<_TodayColumnView> {
  @override
  void initState() {
    super.initState();
    print('TodayColumnView: Initializing for project: ${widget.projectId}');

    // Force immediate data load for the current project
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(
        'TodayColumnView: Post-frame callback - loading data for project: ${widget.projectId}',
      );
      context.read<KanbanBoardBloc>().add(LoadKanbanBoard(widget.projectId));
    });
  }

  @override
  void didUpdateWidget(_TodayColumnView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.projectId != widget.projectId) {
      print(
        'TodayColumnView: ✓ Project changed detected! From ${oldWidget.projectId} to ${widget.projectId}',
      );
      print(
        'TodayColumnView: ✓ Triggering immediate API refetch for new project: ${widget.projectId}',
      );

      // Force reload data when project changes - this refetches from API
      context.read<KanbanBoardBloc>().add(LoadKanbanBoard(widget.projectId));
    } else {
      print(
        'TodayColumnView: No project change detected, keeping current data',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<KanbanBoardBloc, KanbanBoardState>(
      builder: (context, state) {
        print('TodayColumnView: === BUILD METHOD CALLED ===');
        print('TodayColumnView: Current project: ${widget.projectId}');
        print('TodayColumnView: Current state: ${state.runtimeType}');

        if (state is KanbanBoardLoading) {
          print(
            'TodayColumnView: Showing loading state for project: ${widget.projectId}',
          );
          return _buildLoadingState(theme, previousBoard: state.previousBoard);
        } else if (state is KanbanBoardLoaded) {
          print(
            'TodayColumnView: ✓ Board loaded successfully for project: ${widget.projectId}',
          );
          print(
            'TodayColumnView: ✓ API returned ${state.kanbanBoard.columns.length} columns',
          );
          return _buildTodayColumn(context, theme, state.kanbanBoard);
        } else if (state is KanbanBoardError) {
          print(
            'TodayColumnView: ✗ Error loading board for project ${widget.projectId}: ${state.message}',
          );
          return _buildErrorState(context, theme, state.message);
        } else {
          print(
            'TodayColumnView: Initial state - triggering data load for project: ${widget.projectId}',
          );
          return _buildInitialState(theme);
        }
      },
    );
  }

  Widget _buildLoadingState(ThemeData theme, {KanbanBoard? previousBoard}) {
    if (previousBoard != null) {
      // Show previous data with loading overlay
      return Stack(
        children: [
          _buildTodayColumn(context, theme, previousBoard),
          Container(
            color: theme.scaffoldBackgroundColor.withOpacity(0.8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(color: theme.colorScheme.primary),
                  const SizedBox(height: 16),
                  AutoSizeText(
                    'Updating tasks...',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: theme.colorScheme.primary),
          const SizedBox(height: 16),
          AutoSizeText(
            'Loading your tasks...',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context, ThemeData theme, String error) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.error.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 40, color: theme.colorScheme.error),
          const SizedBox(height: 12),
          AutoSizeText(
            'Failed to load tasks',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.error,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          const SizedBox(height: 6),
          AutoSizeText(
            error,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () => _retryLoad(),
            icon: const Icon(Icons.refresh, size: 16),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.colorScheme.error,
              foregroundColor: theme.colorScheme.onError,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              textStyle: theme.textTheme.bodySmall,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialState(ThemeData theme) {
    return const Center(child: CircularProgressIndicator());
  }

  /// Filter tasks that should appear in the Today column based on API response
  List<Todo> _filterTodayTasks(KanbanBoard kanbanBoard) {
    print(
      'TodayColumnView: Filtering tasks from API response for project: ${widget.projectId}',
    );
    print(
      'TodayColumnView: API returned ${kanbanBoard.columns.length} columns',
    );

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    List<Todo> todayTasks = [];

    // Collect tasks from all columns based on API response
    for (final column in kanbanBoard.columns) {
      print(
        'TodayColumnView: Processing column "${column.title}" (${column.status}) with ${column.todos.length} tasks',
      );

      for (final task in column.todos) {
        // Skip completed tasks
        if (task.isCompleted) {
          print('TodayColumnView: Skipping completed task "${task.taskName}"');
          continue;
        }

        final shouldInclude = _shouldIncludeInToday(task, today, column);

        if (shouldInclude) {
          todayTasks.add(task);
          print(
            'TodayColumnView: ✓ Including task "${task.taskName}" - Status: ${task.status} - Column: ${column.title} - Reason: ${_getInclusionReason(task, today, column)}',
          );
        } else {
          print(
            'TodayColumnView: ✗ Excluding task "${task.taskName}" - Status: ${task.status} - Column: ${column.title}',
          );
        }
      }
    }

    print(
      'TodayColumnView: Total tasks filtered for Today view: ${todayTasks.length}',
    );

    // Sort tasks by priority and due date
    todayTasks.sort((a, b) {
      // First, sort by priority (urgent first)
      final priorityCompare = _getPriorityValue(
        b.priority,
      ).compareTo(_getPriorityValue(a.priority));
      if (priorityCompare != 0) return priorityCompare;

      // Then by due date (overdue first, then today)
      if (a.dueDate != null && b.dueDate != null) {
        return a.dueDate!.compareTo(b.dueDate!);
      } else if (a.dueDate != null) {
        return -1;
      } else if (b.dueDate != null) {
        return 1;
      }

      return 0;
    });

    return todayTasks;
  }

  bool _shouldIncludeInToday(Todo task, DateTime today, KanbanColumn column) {
    // Primary: Include tasks specifically in Today/In Progress column from API
    if (task.status == TaskStatus.inProgress ||
        column.status == TaskStatus.inProgress ||
        column.title.toLowerCase().contains('today')) {
      print(
        'TodayColumnView: Task "${task.taskName}" included - In Today/Progress column',
      );
      return true;
    }

    // Secondary: Include tasks due today from any column
    if (task.dueDate != null) {
      final taskDate = DateTime(
        task.dueDate!.year,
        task.dueDate!.month,
        task.dueDate!.day,
      );

      // Due today
      if (taskDate.isAtSameMomentAs(today)) {
        print('TodayColumnView: Task "${task.taskName}" included - Due today');
        return true;
      }

      // Overdue (past due and not completed)
      if (taskDate.isBefore(today)) {
        print('TodayColumnView: Task "${task.taskName}" included - Overdue');
        return true;
      }
    }

    // Tertiary: Include high priority tasks from Todo column
    if (task.status == TaskStatus.todo &&
        (task.priority == Priority.high || task.priority == Priority.urgent)) {
      print(
        'TodayColumnView: Task "${task.taskName}" included - High/Urgent priority',
      );
      return true;
    }

    return false;
  }

  String _getInclusionReason(Todo task, DateTime today, KanbanColumn column) {
    if (task.status == TaskStatus.inProgress ||
        column.status == TaskStatus.inProgress ||
        column.title.toLowerCase().contains('today')) {
      return 'In Today/Progress column (API response)';
    }

    if (task.dueDate != null) {
      final taskDate = DateTime(
        task.dueDate!.year,
        task.dueDate!.month,
        task.dueDate!.day,
      );

      if (taskDate.isAtSameMomentAs(today)) {
        return 'Due today';
      }

      if (taskDate.isBefore(today)) {
        return 'Overdue';
      }
    }

    if (task.status == TaskStatus.todo &&
        (task.priority == Priority.high || task.priority == Priority.urgent)) {
      return 'High/Urgent priority';
    }

    return 'Unknown';
  }

  int _getPriorityValue(Priority priority) {
    switch (priority) {
      case Priority.urgent:
        return 4;
      case Priority.high:
        return 3;
      case Priority.medium:
        return 2;
      case Priority.low:
        return 1;
    }
  }

  Widget _buildTodayColumn(
    BuildContext context,
    ThemeData theme,
    KanbanBoard kanbanBoard,
  ) {
    // Create Today column with filtered tasks from API response
    final todayTasks = _filterTodayTasks(kanbanBoard);

    final todayColumn = KanbanColumn(
      status: TaskStatus.todo,
      title: 'Today',
      color: '#ffc107',
      todos: todayTasks,
    );

    return RefreshIndicator(
      onRefresh: _refreshTasks,
      color: theme.colorScheme.primary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Tasks list
          Expanded(child: _buildColumn(context, theme, todayColumn)),
        ],
      ),
    );
  }

  Widget _buildColumn(
    BuildContext context,
    ThemeData theme,
    KanbanColumn column,
  ) {
    print(
      'TodayColumnView: Building column with ${column.todos.length} tasks for project: ${widget.projectId}',
    );

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Tasks list
          Expanded(
            child: DragTarget<TaskDragData>(
              onAccept: (data) {
                _onMoveTask(
                  data.fromColumnId,
                  data.taskIndex,
                  column.status,
                  column.todos.length,
                );
              },
              builder: (context, candidateData, rejectedData) {
                // Show empty state if no tasks
                if (column.todos.isEmpty) {
                  return _buildEmptyState(theme);
                }

                return Container(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    itemCount: column.todos.length,
                    itemBuilder: (context, index) {
                      final todo = column.todos[index];

                      return Draggable<TaskDragData>(
                        data: TaskDragData(
                          todo: todo,
                          fromColumnId: column.status,
                          taskIndex: index,
                        ),
                        feedback: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: ResponsiveUtils.getColumnWidth(context) - 32,
                            child: TodayTaskCardWidget(
                              task: todo,
                              isFirstTask: index == 0,
                              onTap: () => _onTaskTap(todo),
                              onEdit: () => _onTaskEdit(todo),
                              onDelete: () => _onTaskDelete(todo),
                              onRefresh: () => _refreshTasks(),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(
                          height: 120,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: theme.cardColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: theme.dividerColor.withOpacity(0.3),
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        child: TodayTaskCardWidget(
                          task: todo,
                          isFirstTask: index == 0,
                          onTap: () => _onTaskTap(todo),
                          onEdit: () => _onTaskEdit(todo),
                          onDelete: () => _onTaskDelete(todo),
                          onRefresh: () => _refreshTasks(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // Add task button
          Padding(
            padding: const EdgeInsets.all(16),
            child: AddTaskWidget(
              columnId: column.status.value,
              onAddTask: (taskName) => _onAddTask(column.status, taskName),
            ),
          ),

          // Focus Mode button
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.mint, AppColors.mint.withOpacity(0.8)],
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mint.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: () => _enterFocusMode(),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.center_focus_strong,
                          color: theme.colorScheme.onPrimary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        AutoSizeText(
                          'Enter Focus Mode',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    // Get project info for context
    final projects = context.read<ProjectsBloc>().state.projects;
    final projectInfo = projects.isNotEmpty
        ? projects.firstWhere(
            (p) => p.id == widget.projectId,
            orElse: () => projects.first,
          )
        : null;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primaryContainer.withOpacity(0.1),
            theme.colorScheme.primaryContainer.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.primary.withOpacity(0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary.withOpacity(0.2),
                  theme.colorScheme.primary.withOpacity(0.1),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.today,
              size: 32,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 16),
          AutoSizeText(
            'Ready for Today!',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          const SizedBox(height: 6),
          AutoSizeText(
            projectInfo != null
                ? 'No tasks for today in "${projectInfo.title}".\nAdd tasks to focus on what matters most!'
                : 'No tasks scheduled for today.\nUse the form below to add one!',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.6),
              height: 1.3,
            ),
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                  'Tip: Tasks due today will appear here',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _retryLoad() {
    context.read<KanbanBoardBloc>().add(LoadKanbanBoard(widget.projectId));
  }

  Future<void> _refreshTasks() async {
    print(
      'TodayColumnView: Manually refreshing tasks for project: ${widget.projectId}',
    );
    print('TodayColumnView: Triggering fresh API call...');
    context.read<KanbanBoardBloc>().add(LoadKanbanBoard(widget.projectId));
    // Wait a bit for the refresh to complete
    await Future.delayed(const Duration(milliseconds: 500));
  }

  void _onMoveTask(
    TaskStatus fromStatus,
    int fromIndex,
    TaskStatus toStatus,
    int toIndex,
  ) {
    final currentState = context.read<KanbanBoardBloc>().state;
    if (currentState is KanbanBoardLoaded) {
      // Find the task being moved
      final fromColumn = currentState.kanbanBoard.columns.firstWhere(
        (col) => col.status == fromStatus,
      );

      if (fromIndex < fromColumn.todos.length) {
        final todo = fromColumn.todos[fromIndex];

        // Move the task
        context.read<KanbanBoardBloc>().add(
          MoveTodoToColumn(
            projectId: widget.projectId,
            todoId: todo.id,
            newStatus: toStatus,
            position: toIndex,
          ),
        );
      }
    }
  }

  void _onTaskTap(Todo task) {
    // Show task details in a compact modal
    _showTaskDetailsModal(task);
  }

  void _onTaskEdit(Todo task) {
    // TODO: Implement task edit
    print('Edit task: ${task.taskName}');
  }

  void _onTaskDelete(Todo task) {
    // TODO: Implement task deletion
    print('Delete task: ${task.taskName}');
  }

  void _onAddTask(TaskStatus status, String taskName) {
    context.read<KanbanBoardBloc>().add(
      CreateTodoInColumn(
        projectId: widget.projectId,
        taskName: taskName,
        status: TaskStatus.inProgress,
      ),
    );
  }

  void _enterFocusMode() async {
    final currentState = context.read<KanbanBoardBloc>().state;
    if (Platform.isMacOS) {
      await FloatingPanelManager.initializeFloatingPanel(
        context,
        isFocusMode: true,
      );

      //resize the panel window for focus mode
      await FloatingPanelManager.resizePanelForFocusMode(true);
    }

    if (currentState is KanbanBoardLoaded) {
      // Get all today tasks from the filtered data
      final todayTasks = _filterTodayTasks(currentState.kanbanBoard);

      if (todayTasks.isEmpty) {
        // Show message if no tasks available
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('No tasks available for focus mode'),
            backgroundColor: AppColors.warning,
            duration: const Duration(seconds: 2),
          ),
        );
        return;
      }

      print('FocusMode: Entering focus mode with ${todayTasks.length} tasks');

      // Navigate to focus mode page
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FocusModePage(
            availableTasks: todayTasks,
            projectId: widget.projectId,
          ),
        ),
      );
    } else {
      // Show error if no data loaded
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please wait for tasks to load'),
          backgroundColor: AppColors.error,
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  void _showTaskDetailsModal(Todo task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.4,
        maxChildSize: 0.9,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Handle
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.task_alt, color: AppColors.mint),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        task.taskName,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),

              const Divider(),

              // Task details
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  child: TodayTaskCardWidget(
                    task: task,
                    onRefresh: () => _refreshTasks(),
                    isFirstTask: true, // Always show timer in task detail view
                    onTap: () {},
                    onEdit: () => _onTaskEdit(task),
                    onDelete: () => _onTaskDelete(task),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Data class for task drag operations
class TaskDragData {
  const TaskDragData({
    required this.todo,
    required this.fromColumnId,
    required this.taskIndex,
  });

  final Todo todo;
  final TaskStatus fromColumnId;
  final int taskIndex;
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbotask/core/services/floating_panel_manager.dart';
import 'package:turbotask/features/floating_panel/presentation/pages/floating_panel_page.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/services/realtime_kanban_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../../todos/domain/entities/kanban_board.dart';
import '../../../todos/domain/entities/todo.dart';
import '../../../todos/presentation/bloc/kanban_board_bloc.dart';
import '../../domain/entities/project.dart';
import '../../domain/repositories/project_repository.dart';
import '../../data/models/export_import_models.dart';
import '../widgets/add_task_widget.dart';
import '../widgets/task_card_widget.dart';
import '../widgets/task_detail_sidebar.dart';

/// Project detail page with kanban board layout
class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key, required this.project});

  final Project project;

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<KanbanBoardBloc>()..add(LoadKanbanBoard(widget.project.id)),
      child: _ProjectDetailView(project: widget.project),
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
  Todo? _selectedTask;
  bool _isSidebarVisible = false;
  bool _isExporting = false;
  bool _isImporting = false;

  late final RealtimeKanbanService _realtimeService;

  @override
  void initState() {
    super.initState();
    _realtimeService = getIt<RealtimeKanbanService>();

    // Initialize WebSocket connection and real-time listening
    _initializeRealtimeServices();
  }

  @override
  void dispose() {
    // Stop listening for real-time updates
    _realtimeService.stopListening(widget.project.id);
    super.dispose();
  }

  Future<void> _initializeRealtimeServices() async {
    // Ensure WebSocket is connected
    await _realtimeService.ensureConnected();

    // Start listening for real-time updates for this project
    final kanbanBloc = context.read<KanbanBoardBloc>();
    _realtimeService.startListening(widget.project.id, kanbanBloc);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Row(
        children: [
          // Main content
          Expanded(
            child: Column(
              children: [
                // Header
                _buildHeader(context, theme),

                // Kanban Board
                Expanded(
                  child: BlocBuilder<KanbanBoardBloc, KanbanBoardState>(
                    builder: (context, state) {
                      if (state is KanbanBoardLoading) {
                        return _buildLoadingState(
                          theme,
                          previousBoard: state.previousBoard,
                        );
                      } else if (state is KanbanBoardLoaded) {
                        return _buildKanbanBoard(
                          context,
                          theme,
                          state.kanbanBoard,
                        );
                      } else if (state is KanbanBoardError) {
                        return _buildErrorState(context, theme, state.message);
                      } else {
                        return _buildInitialState(theme);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),

          // Task detail sidebar
          if (_isSidebarVisible && _selectedTask != null)
            TaskDetailSidebar(
              task: _selectedTask!,
              onClose: () {
                setState(() {
                  _isSidebarVisible = false;
                  _selectedTask = null;
                });
              },
              onRefresh: () => _refreshKanbanBoard(),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Back button
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: theme.iconTheme.color,
              size: 20,
            ),
            tooltip: 'Back to projects',
          ),

          const SizedBox(width: 12),

          // Project info
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
                if (widget.project.description.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    widget.project.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodyMedium?.color?.withValues(
                        alpha: 0.7,
                      ),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),

          //add a button for turbo Now
          GestureDetector(
            onTap: () async {
              if (Platform.isMacOS) {
                await FloatingPanelManager.initializeFloatingPanel(
                  context,
                  isFocusMode: false,
                );
              }
              //navigate to floating panel
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const FloatingPanelPage(),
                ),
                (route) => false,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.mint.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.mint.withValues(alpha: 0.1),
                  style: BorderStyle.solid,
                ),
              ),
              child: const Text(
                "Turbo Now",
                style: TextStyle(
                  color: AppColors.mint,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Real-time connection status
          StreamBuilder<bool>(
            stream: _realtimeService.connectionStatus,
            builder: (context, snapshot) {
              final isConnected = snapshot.data ?? false;
              return Tooltip(
                message: isConnected
                    ? 'Real-time updates connected'
                    : 'Real-time updates disconnected',
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isConnected
                        ? AppColors.mint.withOpacity(0.1)
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isConnected
                          ? AppColors.mint.withOpacity(0.3)
                          : Colors.red.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isConnected ? AppColors.mint : Colors.red,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'Live',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isConnected ? AppColors.mint : Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          const SizedBox(width: 16),

          // Action buttons
          Row(
            children: [
              // Export button
              IconButton(
                onPressed: _isExporting ? null : () => _onExportProject(),
                icon: _isExporting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.download),
                tooltip: 'Export project data',
              ),
              // Import button
              IconButton(
                onPressed: _isImporting ? null : () => _onImportProject(),
                icon: _isImporting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.upload),
                tooltip: 'Import project data',
              ),
              IconButton(
                onPressed: () {
                  context.read<KanbanBoardBloc>().add(
                    RefreshKanbanBoard(widget.project.id),
                  );
                },
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh board',
              ),
              IconButton(
                onPressed: () {
                  // TODO: Implement project settings
                },
                icon: const Icon(Icons.settings),
                tooltip: 'Project settings',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(ThemeData theme, {KanbanBoard? previousBoard}) {
    if (previousBoard != null) {
      // Show previous board with loading overlay
      return Stack(
        children: [
          _buildKanbanBoard(context, theme, previousBoard),
          Container(
            color: theme.scaffoldBackgroundColor.withValues(alpha: 0.7),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ],
      );
    }

    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorState(BuildContext context, ThemeData theme, String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: theme.colorScheme.error),
          const SizedBox(height: 16),
          Text(
            'Failed to load Kanban board',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            error,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<KanbanBoardBloc>().add(
                LoadKanbanBoard(widget.project.id),
              );
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialState(ThemeData theme) {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildKanbanBoard(
    BuildContext context,
    ThemeData theme,
    KanbanBoard kanbanBoard,
  ) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: kanbanBoard.columns.map((column) {
          return Container(
            width: ResponsiveUtils.getColumnWidth(context),
            margin: const EdgeInsets.only(right: 16),
            child: _buildColumn(context, theme, column),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildColumn(
    BuildContext context,
    ThemeData theme,
    KanbanColumn column,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Column header
          _buildColumnHeader(
            context,
            theme,
            column.title,
            column.todoCount,
            column.color,
          ),

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
                return Container(
                  decoration: BoxDecoration(
                    color: candidateData.isNotEmpty
                        ? AppColors.mint.withValues(alpha: 0.1)
                        : null,
                  ),
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
                            child: TaskCardWidget(
                              task: todo,
                              onTap: () => _onTaskTap(todo),
                              onEdit: () => _onTaskEdit(todo),
                              onDelete: () => _onTaskDelete(todo),
                              projectId: widget.project.id,
                              onRefresh: () => _refreshKanbanBoard(),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(
                          height: 120,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: theme.cardColor.withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: theme.dividerColor.withValues(alpha: 0.3),
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        child: TaskCardWidget(
                          task: todo,
                          onTap: () => _onTaskTap(todo),
                          onEdit: () => _onTaskEdit(todo),
                          onDelete: () => _onTaskDelete(todo),
                          projectId: widget.project.id,
                          onRefresh: () => _refreshKanbanBoard(),
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
              projectId: widget.project.id,
              columnId: column.status.value,
              onAddTask: (taskName) => _onAddTask(column.status, taskName),
              onAddAITask: (aiTaskData) =>
                  _onAddAITask(column.status, aiTaskData),
              onAddScheduledTask: (scheduledTaskData) =>
                  _onAddScheduledTask(column.status, scheduledTaskData),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnHeader(
    BuildContext context,
    ThemeData theme,
    String title,
    int count,
    String? colorHex,
  ) {
    Color headerColor = AppColors.mint;
    if (colorHex != null) {
      try {
        headerColor = Color(int.parse(colorHex.replaceFirst('#', '0xFF')));
      } catch (e) {
        headerColor = AppColors.mint;
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.2)),
      ),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: headerColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          //add a button for open FloatingPanel

          //only if coloun today show this icon
          if (title == "Today") ...[
            GestureDetector(
              onTap: () async {
                if (Platform.isMacOS) {
                  await FloatingPanelManager.initializeFloatingPanel(
                    context,
                    isFocusMode: false,
                  );
                }
                //navigate to floating panel
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FloatingPanelPage(),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.mint.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(55),
                  border: Border.all(
                    color: AppColors.mint.withValues(alpha: 0.1),
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text(
                  "Turbo Note",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.mint,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: headerColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count.toString(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: headerColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
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
            projectId: widget.project.id,
            todoId: todo.id,
            newStatus: toStatus,
            position: toIndex,
          ),
        );
      }
    }
  }

  void _onTaskTap(Todo task) {
    setState(() {
      _selectedTask = task;
      _isSidebarVisible = true;
    });
  }

  void _onTaskEdit(Todo task) {
    // TODO: Open task edit dialog
    print('Edit task: ${task.taskName}');
  }

  void _onTaskDelete(Todo task) {
    // TODO: Implement task deletion
    print('Delete task: ${task.taskName}');
  }

  void _onAddTask(TaskStatus status, String taskName) {
    context.read<KanbanBoardBloc>().add(
      CreateTodoInColumn(
        projectId: widget.project.id,
        taskName: taskName,
        status: status,
      ),
    );
  }

  void _onAddAITask(TaskStatus status, Map<String, dynamic> aiTaskData) {
    // Create the main task first
    final taskName = aiTaskData['task_name'] as String? ?? 'AI-generated task';
    // Note: Additional AI-generated data like description, emoji, priority, etc.
    // will be available when the AI enhancement completes via WebSocket

    // For now, we'll use the existing CreateTodoInColumn event
    // TODO: Create a new event specifically for AI-enhanced tasks that includes all metadata
    context.read<KanbanBoardBloc>().add(
      CreateTodoInColumn(
        projectId: widget.project.id,
        taskName: taskName,
        status: status,
      ),
    );

    // Show success feedback with AI enhancement details
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.auto_awesome, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'AI-enhanced task "$taskName" created! AI enhancements will be applied shortly.',
                ),
              ),
            ],
          ),
          backgroundColor: Colors.purple.shade600,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _onAddScheduledTask(
    TaskStatus status,
    Map<String, dynamic> scheduledTaskData,
  ) {
    // Create the main task first
    final taskName =
        scheduledTaskData['task_name'] as String? ?? 'Scheduled task';
    // Note: Scheduling data like datetime, recurrence pattern will be handled
    // by the ScheduledTask API integration in the future

    // For now, we'll use the existing CreateTodoInColumn event
    // TODO: Integrate with actual ScheduledTask API to create both todo and schedule
    context.read<KanbanBoardBloc>().add(
      CreateTodoInColumn(
        projectId: widget.project.id,
        taskName: taskName,
        status: status,
      ),
    );

    // Show success feedback with scheduling details
    if (mounted) {
      final scheduleText = 'scheduled';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.schedule, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Expanded(
                child: Text('Task "$taskName" created and $scheduleText'),
              ),
            ],
          ),
          backgroundColor: Colors.blue.shade600,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _refreshKanbanBoard() {
    context.read<KanbanBoardBloc>().add(RefreshKanbanBoard(widget.project.id));
  }

  Future<void> _onExportProject() async {
    setState(() {
      _isExporting = true;
    });

    try {
      final projectRepository = getIt<ProjectRepository>();
      final filePath = await projectRepository.exportProject(widget.project.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Project exported successfully!\nSaved to: ${filePath.split('/').last}',
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.green.shade600,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
            action: SnackBarAction(
              label: 'Open Folder',
              textColor: Colors.white,
              onPressed: () {
                // TODO: Open file location if needed
              },
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Expanded(child: Text('Export failed: ${e.toString()}')),
              ],
            ),
            backgroundColor: Colors.red.shade600,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isExporting = false;
        });
      }
    }
  }

  Future<void> _onImportProject() async {
    setState(() {
      _isImporting = true;
    });

    try {
      final projectRepository = getIt<ProjectRepository>();
      final result = await projectRepository.importProject(widget.project.id);

      if (mounted) {
        final statistics = result.statistics;
        final successMessage = statistics != null
            ? 'Import completed!\n${statistics.successfulImports} tasks imported successfully'
            : 'Import completed successfully!';

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Expanded(child: Text(successMessage)),
              ],
            ),
            backgroundColor: Colors.green.shade600,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
          ),
        );

        // Refresh the kanban board to show new tasks
        _refreshKanbanBoard();

        // Show detailed statistics if available
        if (statistics != null &&
            (result.errors?.isNotEmpty == true ||
                result.warnings?.isNotEmpty == true)) {
          _showImportDetailsDialog(result);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Expanded(child: Text('Import failed: ${e.toString()}')),
              ],
            ),
            backgroundColor: Colors.red.shade600,
            behavior: SnackBarBehavior.floating,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isImporting = false;
        });
      }
    }
  }

  void _showImportDetailsDialog(ImportProjectResponse result) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Import Details'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (result.statistics != null) ...[
                Text('Total Records: ${result.statistics!.totalRecords}'),
                Text('Successful: ${result.statistics!.successfulImports}'),
                Text('Failed: ${result.statistics!.failedImports}'),
                Text('Skipped: ${result.statistics!.skippedRecords}'),
                if (result.statistics!.duplicatesFound > 0)
                  Text('Duplicates: ${result.statistics!.duplicatesFound}'),
                const SizedBox(height: 16),
              ],
              if (result.warnings?.isNotEmpty == true) ...[
                const Text(
                  'Warnings:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...result.warnings!.map((warning) => Text('• $warning')),
                const SizedBox(height: 8),
              ],
              if (result.errors?.isNotEmpty == true) ...[
                const Text(
                  'Errors:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ...result.errors!.map((error) => Text('• $error')),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

/// Data class for task drag operations
class TaskDragData {
  final Todo todo;
  final TaskStatus fromColumnId;
  final int taskIndex;

  TaskDragData({
    required this.todo,
    required this.fromColumnId,
    required this.taskIndex,
  });
}

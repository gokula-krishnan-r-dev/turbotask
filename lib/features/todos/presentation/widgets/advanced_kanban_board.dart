import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../domain/entities/todo.dart';
import '../../domain/entities/create_todo_request.dart';

import '../bloc/todos_bloc.dart';
import '../bloc/todos_event.dart';
import '../bloc/todos_state.dart';
import 'create_todo_card.dart';
import 'loading_todo_overlay.dart';

/// Advanced Kanban board with native Flutter drag-and-drop for reliable cross-column movement
class AdvancedKanbanBoard extends StatefulWidget {
  const AdvancedKanbanBoard({
    super.key,
    required this.projectId,
    required this.userId,
  });

  final String projectId;
  final String? userId;

  @override
  State<AdvancedKanbanBoard> createState() => _AdvancedKanbanBoardState();
}

class _AdvancedKanbanBoardState extends State<AdvancedKanbanBoard>
    with TickerProviderStateMixin {
  final Map<TodoStatus, bool> _showCreateForm = {
    TodoStatus.backlog: false,
    TodoStatus.todo: false,
    TodoStatus.inProgress: false,
    TodoStatus.completed: false,
  };

  late AnimationController _dragAnimationController;
  Todo? _currentlyDraggedTodo;
  TodoStatus? _dragTargetStatus;

  // Column configuration with enhanced visual design
  final List<_KanbanColumnConfig> _columnConfigs = [
    _KanbanColumnConfig(
      status: TodoStatus.backlog,
      title: 'Backlog',
      icon: Icons.inventory_2_outlined,
      color: AppColors.gray500,
    ),
    _KanbanColumnConfig(
      status: TodoStatus.todo,
      title: 'This Week',
      icon: Icons.calendar_today,
      color: AppColors.blue,
    ),
    _KanbanColumnConfig(
      status: TodoStatus.inProgress,
      title: 'Today',
      icon: Icons.schedule,
      color: AppColors.orange,
    ),
    _KanbanColumnConfig(
      status: TodoStatus.completed,
      title: 'Done',
      icon: Icons.check_circle,
      color: AppColors.mint,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _dragAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
  }

  void _handleIntraColumnMove(
    TodoStatus status,
    List<Todo> todos,
    int oldIndex,
    int newIndex,
  ) {
    if (oldIndex == newIndex) return;

    // Adjust newIndex for moving down
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final movedTodo = todos[oldIndex];
    debugPrint('Moving ${movedTodo.taskName} from $oldIndex to $newIndex');

    // Calculate new sort order based on the target position
    int newSortOrder;

    if (todos.length == 1) {
      // Only one item, keep its current sort order
      newSortOrder = movedTodo.sortOrder;
    } else if (newIndex == 0) {
      // Moving to first position
      newSortOrder = todos.first.sortOrder - 1000;
    } else if (newIndex >= todos.length - 1) {
      // Moving to last position
      newSortOrder = todos.last.sortOrder + 1000;
    } else {
      // Moving between items
      final prevTodo = todos[newIndex];
      final nextTodo = todos[newIndex + 1];
      newSortOrder = ((prevTodo.sortOrder + nextTodo.sortOrder) / 2).round();
    }

    // Only update if the sort order actually changes
    if (newSortOrder != movedTodo.sortOrder) {
      context.read<TodosBloc>().add(
        TodosEvent.updateTodoSortOrder(movedTodo.id, newSortOrder),
      );
    }
  }

  void _handleCrossColumnMove(Todo todo, TodoStatus newStatus, int position) {
    final todosBloc = context.read<TodosBloc>();
    final state = todosBloc.state;
    final targetTodos = state.getTodosForStatus(newStatus);

    int newSortOrder;
    if (targetTodos.isEmpty) {
      newSortOrder = 1000;
    } else if (position == 0) {
      newSortOrder = targetTodos.first.sortOrder - 1000;
    } else if (position >= targetTodos.length) {
      newSortOrder = targetTodos.last.sortOrder + 1000;
    } else {
      final prevTodo = targetTodos[position - 1];
      final nextTodo = targetTodos[position];
      newSortOrder = ((prevTodo.sortOrder + nextTodo.sortOrder) / 2).round();
    }

    setState(() {
      _currentlyDraggedTodo = null;
      _dragTargetStatus = null;
    });

    context.read<TodosBloc>().add(
      TodosEvent.updateTodoStatusAndSortOrder(todo.id, newStatus, newSortOrder),
    );
  }

  void _onDragStarted(Todo todo) {
    setState(() {
      _currentlyDraggedTodo = todo;
    });
    _dragAnimationController.forward();
  }

  void _onDragEnd() {
    setState(() {
      _currentlyDraggedTodo = null;
      _dragTargetStatus = null;
    });
    _dragAnimationController.reverse();
  }

  void _onDragUpdate(TodoStatus? targetStatus) {
    if (_dragTargetStatus != targetStatus) {
      setState(() {
        _dragTargetStatus = targetStatus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodosBloc, TodosState>(
      listener: (context, state) {
        if (state.hasError) {
          _showErrorSnackBar(state.errorMessage!);
        } else if (state.status == TodosStatus.created) {
          setState(() {
            _showCreateForm.updateAll((key, value) => false);
          });
          _showSuccessSnackBar('Task created successfully!');
        } else if (state.status == TodosStatus.updating &&
            state.errorMessage == 'Task moved successfully!') {
          _showSuccessSnackBar('Task moved successfully!');
        }
      },
      builder: (context, state) {
        if (state.isLoading && state.allTodos.isEmpty) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('Loading tasks...'),
              ],
            ),
          );
        }

        if (state.allTodos.isEmpty && state.isLoaded) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.task_alt, size: 64, color: Colors.grey),
                SizedBox(height: 16),
                Text(
                  'No tasks yet',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  'Add your first task to get started',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }

        return _buildBoard(context, state);
      },
    );
  }

  Widget _buildBoard(BuildContext context, TodosState state) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    if (isDesktop) {
      return _buildDesktopBoard(context, state);
    } else {
      return _buildMobileBoard(context, state);
    }
  }

  Widget _buildDesktopBoard(BuildContext context, TodosState state) {
    return AnimatedBuilder(
      animation: _dragAnimationController,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _columnConfigs.map((config) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildColumn(context, config, state),
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildMobileBoard(BuildContext context, TodosState state) {
    return DefaultTabController(
      length: _columnConfigs.length,
      child: Column(
        children: [
          _buildTabBar(context, state),
          Expanded(
            child: TabBarView(
              children: _columnConfigs.map((config) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildColumn(context, config, state, isMobile: true),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context, TodosState state) {
    final theme = Theme.of(context);

    return Container(
      color: theme.cardColor,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        tabs: _columnConfigs.map((config) {
          final count = state.getTodosForStatus(config.status).length;
          return Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(config.icon, size: 16),
                const SizedBox(width: 8),
                Text(config.title),
                if (count > 0) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: config.color,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      count.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildColumn(
    BuildContext context,
    _KanbanColumnConfig config,
    TodosState state, {
    bool isMobile = false,
  }) {
    final theme = Theme.of(context);
    final todos = state.getTodosForStatus(config.status);
    todos.sort((a, b) => a.sortOrder.compareTo(b.sortOrder));
    final showCreate = _showCreateForm[config.status] ?? false;
    final isDragOver =
        _dragTargetStatus == config.status && _currentlyDraggedTodo != null;

    return DragTarget<Todo>(
      onWillAccept: (todo) => todo?.status != config.status,
      onAcceptWithDetails: (details) {
        _handleCrossColumnMove(details.data, config.status, todos.length);
      },
      onMove: (details) => _onDragUpdate(config.status),
      onLeave: (data) => _onDragUpdate(null),
      builder: (context, candidateData, rejectedData) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDragOver
                  ? config.color.withValues(alpha: 0.6)
                  : theme.dividerColor.withValues(alpha: 0.1),
              width: isDragOver ? 2 : 1,
            ),
            boxShadow: isDragOver
                ? [
                    BoxShadow(
                      color: config.color.withValues(alpha: 0.2),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildColumnHeader(context, config, todos.length, isDragOver),
              if (todos.length > 1 && ResponsiveUtils.isDesktop(context))
                _buildReorderHint(context, config),
              Expanded(
                child: _buildColumnContent(
                  context,
                  config,
                  todos,
                  state,
                  isDragOver,
                ),
              ),
              if (!showCreate) _buildAddButton(context, config),
              if (showCreate) _buildCreateForm(context, config),
            ],
          ),
        );
      },
    );
  }

  Widget _buildReorderHint(BuildContext context, _KanbanColumnConfig config) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: config.color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: config.color.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: config.color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: config.color.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(height: 1),
                Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: config.color.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
                const SizedBox(height: 1),
                Container(
                  width: 2,
                  height: 2,
                  decoration: BoxDecoration(
                    color: config.color.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'Drag handle to reorder tasks',
              style: theme.textTheme.bodySmall?.copyWith(
                color: config.color.withValues(alpha: 0.7),
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnHeader(
    BuildContext context,
    _KanbanColumnConfig config,
    int todoCount,
    bool isDragOver,
  ) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDragOver
            ? config.color.withValues(alpha: 0.2)
            : config.color.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        border: Border(
          bottom: BorderSide(
            color: isDragOver
                ? config.color.withValues(alpha: 0.4)
                : config.color.withValues(alpha: 0.1),
            width: isDragOver ? 2 : 1,
          ),
        ),
      ),
      child: Row(
        children: [
          AnimatedScale(
            scale: isDragOver ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: config.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(config.icon, size: 16, color: config.color),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              config.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: config.color.withValues(alpha: 0.8),
              ),
            ),
          ),
          if (todoCount > 0)
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: config.color.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                todoCount.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildColumnContent(
    BuildContext context,
    _KanbanColumnConfig config,
    List<Todo> todos,
    TodosState state,
    bool isDragOver,
  ) {
    if (todos.isEmpty && !isDragOver) {
      return _buildEmptyState(context, config);
    }

    return ReorderableListView.builder(
      padding: const EdgeInsets.all(16),
      buildDefaultDragHandles: false,
      proxyDecorator: (child, index, animation) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Transform.scale(
              scale: 1.05,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                shadowColor: config.color.withValues(alpha: 0.3),
                child: child,
              ),
            );
          },
          child: child,
        );
      },
      itemCount: todos.length,
      onReorder: (oldIndex, newIndex) {
        _handleIntraColumnMove(config.status, todos, oldIndex, newIndex);
      },
      itemBuilder: (context, index) {
        final todo = todos[index];
        return _buildReorderableTodoCard(context, todo, state, config, index);
      },
    );
  }

  Widget _buildReorderableTodoCard(
    BuildContext context,
    Todo todo,
    TodosState state,
    _KanbanColumnConfig config,
    int index,
  ) {
    return ReorderableDragStartListener(
      key: ValueKey(todo.id),
      index: index,
      child: Draggable<Todo>(
        data: todo,
        onDragStarted: () => _onDragStarted(todo),
        onDragEnd: (details) => _onDragEnd(),
        feedback: Material(
          elevation: 12,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 280,
            child: _buildTodoCardContent(
              context,
              todo,
              config,
              isDragging: true,
              showDragHandle: false,
            ),
          ),
        ),
        childWhenDragging: Opacity(
          opacity: 0.5,
          child: _buildTodoCardContent(
            context,
            todo,
            config,
            showDragHandle: false,
          ),
        ),
        child: LoadingTodoOverlay(
          isLoading: state.updatingTodoIds.contains(todo.id),
          loadingText: 'Moving...',
          child: _buildTodoCardContent(
            context,
            todo,
            config,
            showDragHandle: true,
          ),
        ),
      ),
    );
  }

  Widget _buildTodoCardContent(
    BuildContext context,
    Todo todo,
    _KanbanColumnConfig config, {
    bool isDragging = false,
    bool showDragHandle = false,
  }) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.dividerColor.withValues(alpha: 0.1)),
        boxShadow: isDragging
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: InkWell(
        onTap: () => _handleTodoTap(todo),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              // Drag handle for reordering
              if (showDragHandle)
                Container(
                  padding: const EdgeInsets.only(right: 12),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.grab,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: config.color.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: config.color.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 3,
                            height: 3,
                            decoration: BoxDecoration(
                              color: config.color.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(1.5),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: BoxDecoration(
                              color: config.color.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(1.5),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Container(
                            width: 3,
                            height: 3,
                            decoration: BoxDecoration(
                              color: config.color.withValues(alpha: 0.8),
                              borderRadius: BorderRadius.circular(1.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              // Main card content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Completion checkbox
                        GestureDetector(
                          onTap: () => _handleToggleCompletion(todo.id),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: _getPriorityColor(todo.priority),
                                width: 2,
                              ),
                              color: todo.isCompleted
                                  ? _getPriorityColor(todo.priority)
                                  : null,
                            ),
                            child: todo.isCompleted
                                ? const Icon(
                                    Icons.check,
                                    size: 14,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(width: 8),

                        // Task content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                todo.taskName,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  decoration: todo.isCompleted
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                              if (todo.taskDescription.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                Text(
                                  todo.taskDescription,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.textTheme.bodySmall?.color
                                        ?.withValues(alpha: 0.7),
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ],
                          ),
                        ),

                        // Pin icon
                        if (todo.isPinned)
                          GestureDetector(
                            onTap: () => _handleTogglePin(todo.id),
                            child: Icon(
                              Icons.push_pin,
                              size: 16,
                              color: AppColors.orange,
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // Footer with priority and metadata
                    Row(
                      children: [
                        // Priority badge
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: _getPriorityColor(
                              todo.priority,
                            ).withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _getPriorityColor(
                                todo.priority,
                              ).withValues(alpha: 0.3),
                            ),
                          ),
                          child: Text(
                            todo.priority.displayName,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: _getPriorityColor(todo.priority),
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ),

                        const Spacer(),

                        // Due date
                        if (todo.dueDate != null)
                          Text(
                            _formatDueDate(todo.dueDate!),
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: todo.isOverdue
                                  ? AppColors.error
                                  : theme.textTheme.bodySmall?.color
                                        ?.withValues(alpha: 0.6),
                              fontSize: 10,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, _KanbanColumnConfig config) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            config.icon,
            size: 48,
            color: theme.iconTheme.color?.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            _getEmptyMessage(config.status),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context, _KanbanColumnConfig config) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: () {
            setState(() {
              _showCreateForm.updateAll((key, value) => false);
              _showCreateForm[config.status] = true;
            });
          },
          icon: Icon(Icons.add, size: 16, color: config.color),
          label: Text('Add Task', style: TextStyle(color: config.color)),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: config.color.withValues(alpha: 0.3)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildCreateForm(BuildContext context, _KanbanColumnConfig config) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: CreateTodoCard(
        onCancel: () {
          setState(() {
            _showCreateForm[config.status] = false;
          });
        },
        onSubmit: (request) => _handleCreateTodo(request, config.status),
        color: config.color,
      ),
    );
  }

  // Helper methods
  Color _getPriorityColor(TodoPriority priority) {
    switch (priority) {
      case TodoPriority.low:
        return AppColors.mint;
      case TodoPriority.medium:
        return AppColors.blue;
      case TodoPriority.high:
        return AppColors.orange;
      case TodoPriority.urgent:
        return AppColors.error;
    }
  }

  String _formatDueDate(DateTime dueDate) {
    final now = DateTime.now();
    final difference = dueDate.difference(now).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference == -1) {
      return 'Yesterday';
    } else if (difference > 1) {
      return '${difference}d';
    } else {
      return '${difference.abs()}d ago';
    }
  }

  String _getEmptyMessage(TodoStatus status) {
    switch (status) {
      case TodoStatus.backlog:
        return 'No tasks in backlog.\nAdd ideas and future tasks here.';
      case TodoStatus.todo:
        return 'No tasks planned for this week.\nAdd tasks you want to work on.';
      case TodoStatus.inProgress:
        return 'No tasks for today.\nMove tasks here when you start working.';
      case TodoStatus.completed:
        return 'No completed tasks yet.\nCompleted tasks will appear here.';
      default:
        return 'No tasks yet.\nAdd your first task to get started.';
    }
  }

  // Event handlers
  void _handleTodoTap(Todo todo) {
    // TODO: Show todo detail modal or navigate to detail page
    debugPrint('Todo tapped: ${todo.taskName}');
  }

  void _handleToggleCompletion(String todoId) {
    context.read<TodosBloc>().add(TodosEvent.toggleTodoCompletion(todoId));
  }

  void _handleTogglePin(String todoId) {
    context.read<TodosBloc>().add(TodosEvent.toggleTodoPin(todoId));
  }

  void _handleCreateTodo(CreateTodoRequest request, TodoStatus status) {
    final todoRequest = CreateTodoRequest(
      projectId: widget.projectId,
      taskName: request.taskName,
      taskDescription: request.taskDescription,
      priority: request.priority,
      estimatedTime: request.estimatedTime,
      timeUnit: request.timeUnit,
      dueDate: request.dueDate,
      tags: request.tags,
      difficultyRating: request.difficultyRating,
      energyLevelRequired: request.energyLevelRequired,
      context: request.context,
      assignedUserId: widget.userId,
      status: status,
    );

    context.read<TodosBloc>().add(TodosEvent.createTodo(todoRequest));
  }

  // Utility methods for showing snackbars
  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error_outline, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Text(message),
          ],
        ),
        backgroundColor: AppColors.mint,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _dragAnimationController.dispose();
    super.dispose();
  }
}

class _KanbanColumnConfig {
  const _KanbanColumnConfig({
    required this.status,
    required this.title,
    required this.icon,
    required this.color,
  });

  final TodoStatus status;
  final String title;
  final IconData icon;
  final Color color;
}

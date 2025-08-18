import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../projects/presentation/widgets/hover_button_widget.dart';
import '../../domain/entities/todo.dart';
import '../bloc/todo_actions_bloc.dart';
import '../bloc/todo_actions_event.dart';

/// Example widget showing how to use the enhanced HoverButtonWidget
/// with todo actions integration
class TodoItemWithActions extends StatelessWidget {
  final Todo todo;
  final VoidCallback onSubtasksToggle;
  final VoidCallback onNotesOpen;
  final Function(Todo)? onTodoUpdated;

  const TodoItemWithActions({
    super.key,
    required this.todo,
    required this.onSubtasksToggle,
    required this.onNotesOpen,
    this.onTodoUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<TodoActionsBloc>()..add(CheckBreakStatusEvent(todo.id)),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Todo header with title and status
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todo.taskName,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                decoration: todo.isCompleted
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                        ),
                        if (todo.taskDescription?.isNotEmpty == true)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              todo.taskDescription!,
                              style: Theme.of(context).textTheme.bodySmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Status indicator
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(todo.status).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      todo.status.displayName,
                      style: TextStyle(
                        color: _getStatusColor(todo.status),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Todo metadata
              Row(
                children: [
                  if (todo.priority != Priority.medium) ...[
                    Icon(
                      Icons.flag,
                      size: 16,
                      color: _getPriorityColor(todo.priority),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      todo.priority.displayName,
                      style: TextStyle(
                        color: _getPriorityColor(todo.priority),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],

                  if (todo.dueDate != null) ...[
                    Icon(
                      Icons.schedule,
                      size: 16,
                      color: todo.isOverdue ? Colors.red : Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatDate(todo.dueDate!),
                      style: TextStyle(
                        color: todo.isOverdue ? Colors.red : Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],

                  if (todo.subtaskCount > 0) ...[
                    Icon(Icons.list, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(
                      '${todo.completedSubtasks}/${todo.subtaskCount}',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],

                  const Spacer(),

                  // Action buttons
                  HoverButtonWidget(
                    isSubtasksExpanded: false,
                    isSubtasksVisible: todo.subtaskCount > 0,
                    onSubtasksExpandToggle: onSubtasksToggle,
                    onNotesOpen: onNotesOpen,
                    todo: todo,
                    onTodoUpdated: onTodoUpdated,
                    onRefresh: () {
                      // Callback for refresh after successful action
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.completed:
      case TaskStatus.done:
        return Colors.green;
      case TaskStatus.inProgress:
        return Colors.blue;
      case TaskStatus.onHold:
        return Colors.orange;
      case TaskStatus.cancelled:
        return Colors.red;
      case TaskStatus.pending:
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }

  Color _getPriorityColor(Priority priority) {
    switch (priority) {
      case Priority.urgent:
        return Colors.red;
      case Priority.high:
        return Colors.orange;
      case Priority.medium:
        return Colors.blue;
      case Priority.low:
        return Colors.green;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = date.difference(now).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference == -1) {
      return 'Yesterday';
    } else if (difference > 0) {
      return 'In $difference days';
    } else {
      return '${difference.abs()} days ago';
    }
  }
}

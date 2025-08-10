import 'package:flutter/material.dart';

import '../../domain/entities/todo.dart';
import '../../domain/entities/create_todo_request.dart';
import 'create_todo_card.dart';
import 'draggable_todo_card.dart';
import 'drop_target_column.dart';

/// Enhanced Kanban column widget with drag-and-drop functionality
class KanbanColumn extends StatelessWidget {
  const KanbanColumn({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.todos,
    required this.targetStatus,
    required this.showCreateForm,
    required this.onAddTask,
    required this.onCancelCreate,
    required this.onCreateTask,
    required this.onTodoTap,
    required this.onStatusChanged,
    required this.onToggleCompletion,
    required this.onTogglePin,
    this.isMobile = false,
    this.onCreateSubtask,
    this.onToggleSubtask,
  });

  final String title;
  final IconData icon;
  final Color color;
  final List<Todo> todos;
  final TodoStatus targetStatus;
  final bool showCreateForm;
  final VoidCallback onAddTask;
  final VoidCallback onCancelCreate;
  final Function(CreateTodoRequest) onCreateTask;
  final Function(Todo) onTodoTap;
  final Function(String, TodoStatus) onStatusChanged;
  final Function(String) onToggleCompletion;
  final Function(String) onTogglePin;
  final bool isMobile;
  final Function(String todoId, String title)? onCreateSubtask;
  final Function(String subtaskId)? onToggleSubtask;

  @override
  Widget build(BuildContext context) {
    // Build todo widgets with drag functionality and loading states
    final todoWidgets = todos.map((todo) {
      // Check if this todo is being updated (you would get this from BLoC state)
      // For now, we'll use a simple check - in a real app, this would come from the BLoC
      final isUpdating = false; // This should be derived from the BLoC state

      return DraggableTodoCard(
        key: ValueKey(todo.id),
        todo: todo,
        onTap: () => onTodoTap(todo),
        onToggleCompletion: () => onToggleCompletion(todo.id),
        onTogglePin: () => onTogglePin(todo.id),
        onStatusChanged: (newStatus) => onStatusChanged(todo.id, newStatus),
        isUpdating: isUpdating,
        subtasks: const [], // TODO: Implement subtasks list from API
        onCreateSubtask: onCreateSubtask != null
            ? (title) => onCreateSubtask!(todo.id, title)
            : null,
        onToggleSubtask: onToggleSubtask,
        isLoadingSubtasks: false, // This should come from BLoC state
      );
    }).toList();

    // Mix of todo widgets and create form
    final List<Widget> mixedChildren = [...todoWidgets];
    if (showCreateForm) {
      mixedChildren.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          child: CreateTodoCard(
            onCancel: onCancelCreate,
            onSubmit: onCreateTask,
            color: color,
          ),
        ),
      );
    }

    return DropTargetColumn(
      title: title,
      icon: icon,
      color: color,
      targetStatus: targetStatus,
      children: mixedChildren,
      onAcceptTodo: (todo, newStatus) {
        if (todo.status != newStatus) {
          onStatusChanged(todo.id, newStatus);
        }
      },
      onAddTask: onAddTask,
      showAddButton: !showCreateForm,
    );
  }
}

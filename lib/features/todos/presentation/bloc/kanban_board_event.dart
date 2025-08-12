part of 'kanban_board_bloc.dart';

abstract class KanbanBoardEvent extends Equatable {
  const KanbanBoardEvent();

  @override
  List<Object?> get props => [];
}

class LoadKanbanBoard extends KanbanBoardEvent {
  final String projectId;

  const LoadKanbanBoard(this.projectId);

  @override
  List<Object?> get props => [projectId];
}

class RefreshKanbanBoard extends KanbanBoardEvent {
  final String projectId;

  const RefreshKanbanBoard(this.projectId);

  @override
  List<Object?> get props => [projectId];
}

class CreateTodoInColumn extends KanbanBoardEvent {
  final String projectId;
  final String taskName;
  final String? taskDescription;
  final TaskStatus status;
  final String? priority;
  final List<String>? tags;

  const CreateTodoInColumn({
    required this.projectId,
    required this.taskName,
    this.taskDescription,
    required this.status,
    this.priority,
    this.tags,
  });

  @override
  List<Object?> get props => [
    projectId,
    taskName,
    taskDescription,
    status,
    priority,
    tags,
  ];
}

class MoveTodoToColumn extends KanbanBoardEvent {
  final String projectId;
  final String todoId;
  final TaskStatus newStatus;
  final int? position;

  const MoveTodoToColumn({
    required this.projectId,
    required this.todoId,
    required this.newStatus,
    this.position,
  });

  @override
  List<Object?> get props => [projectId, todoId, newStatus, position];
}

class ReorderTodosInColumn extends KanbanBoardEvent {
  final String projectId;
  final List<String> todoIds;
  final TaskStatus status;

  const ReorderTodosInColumn({
    required this.projectId,
    required this.todoIds,
    required this.status,
  });

  @override
  List<Object?> get props => [projectId, todoIds, status];
}

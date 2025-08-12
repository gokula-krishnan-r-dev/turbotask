part of 'subtask_bloc.dart';

abstract class SubtaskEvent extends Equatable {
  const SubtaskEvent();

  @override
  List<Object?> get props => [];
}

/// Load subtasks for a todo
class LoadSubtasks extends SubtaskEvent {
  final String todoId;

  const LoadSubtasks(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

/// Create a new subtask
class CreateSubtask extends SubtaskEvent {
  final String todoId;
  final String name;
  final String? description;
  final TaskStatus? status;
  final Priority? priority;

  const CreateSubtask({
    required this.todoId,
    required this.name,
    this.description,
    this.status,
    this.priority,
  });

  @override
  List<Object?> get props => [todoId, name, description, status, priority];
}

/// Update an existing subtask
class UpdateSubtask extends SubtaskEvent {
  final String subtaskId;
  final String? name;
  final String? description;
  final TaskStatus? status;
  final Priority? priority;

  const UpdateSubtask({
    required this.subtaskId,
    this.name,
    this.description,
    this.status,
    this.priority,
  });

  @override
  List<Object?> get props => [subtaskId, name, description, status, priority];
}

/// Toggle subtask completion status
class ToggleSubtaskStatus extends SubtaskEvent {
  final String subtaskId;

  const ToggleSubtaskStatus(this.subtaskId);

  @override
  List<Object?> get props => [subtaskId];
}

/// Delete a subtask
class DeleteSubtask extends SubtaskEvent {
  final String subtaskId;

  const DeleteSubtask(this.subtaskId);

  @override
  List<Object?> get props => [subtaskId];
}

/// Refresh subtasks
class RefreshSubtasks extends SubtaskEvent {
  final String todoId;

  const RefreshSubtasks(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

part of 'subtask_bloc.dart';

abstract class SubtaskState extends Equatable {
  const SubtaskState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class SubtaskInitial extends SubtaskState {
  const SubtaskInitial();
}

/// Loading state
class SubtaskLoading extends SubtaskState {
  final List<Subtask>? previousSubtasks;
  final String? todoId;

  const SubtaskLoading({this.previousSubtasks, this.todoId});

  @override
  List<Object?> get props => [previousSubtasks, todoId];
}

/// Loaded state with subtasks
class SubtaskLoaded extends SubtaskState {
  final List<Subtask> subtasks;
  final String todoId;

  const SubtaskLoaded({required this.subtasks, required this.todoId});

  /// Get completed subtasks count
  int get completedCount =>
      subtasks.where((subtask) => subtask.isCompleted).length;

  /// Get total subtasks count
  int get totalCount => subtasks.length;

  /// Get completion percentage
  double get completionPercentage {
    if (totalCount == 0) return 0.0;
    return (completedCount / totalCount) * 100;
  }

  @override
  List<Object?> get props => [subtasks, todoId];
}

/// Error state
class SubtaskError extends SubtaskState {
  final String message;

  const SubtaskError(this.message);

  @override
  List<Object?> get props => [message];
}

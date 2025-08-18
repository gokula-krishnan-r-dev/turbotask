import 'package:equatable/equatable.dart';

import '../../data/models/todo_action_request_models.dart';

abstract class TodoActionsEvent extends Equatable {
  const TodoActionsEvent();

  @override
  List<Object?> get props => [];
}

class CompleteTodoEvent extends TodoActionsEvent {
  final String todoId;

  const CompleteTodoEvent(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

class IncompleteTodoEvent extends TodoActionsEvent {
  final String todoId;

  const IncompleteTodoEvent(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

class PinTodoEvent extends TodoActionsEvent {
  final String todoId;

  const PinTodoEvent(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

class StartBreakEvent extends TodoActionsEvent {
  final String todoId;
  final String? projectId;
  final BreakType breakType;
  final String? reason;
  final int? estimatedDuration;

  const StartBreakEvent({
    required this.todoId,
    this.projectId,
    required this.breakType,
    this.reason,
    this.estimatedDuration,
  });

  @override
  List<Object?> get props => [
    todoId,
    projectId,
    breakType,
    reason,
    estimatedDuration,
  ];
}

class StopBreakEvent extends TodoActionsEvent {
  final String todoId;

  const StopBreakEvent(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

class PauseTodoEvent extends TodoActionsEvent {
  final String todoId;

  const PauseTodoEvent(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

class SkipTodoEvent extends TodoActionsEvent {
  final String todoId;

  const SkipTodoEvent(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

class CheckBreakStatusEvent extends TodoActionsEvent {
  final String todoId;

  const CheckBreakStatusEvent(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

class ResetActionsEvent extends TodoActionsEvent {
  const ResetActionsEvent();
}

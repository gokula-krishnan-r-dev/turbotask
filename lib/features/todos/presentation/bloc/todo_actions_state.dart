import 'package:equatable/equatable.dart';

import '../../domain/entities/todo.dart';
import '../../data/models/todo_action_request_models.dart';

class TodoActionsState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isOnBreak;
  final String? error;
  final Todo? updatedTodo;
  final TodoActionType? actionType;

  const TodoActionsState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isOnBreak = false,
    this.error,
    this.updatedTodo,
    this.actionType,
  });

  TodoActionsState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isOnBreak,
    String? error,
    Todo? updatedTodo,
    TodoActionType? actionType,
  }) {
    return TodoActionsState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isOnBreak: isOnBreak ?? this.isOnBreak,
      error: error ?? this.error,
      updatedTodo: updatedTodo ?? this.updatedTodo,
      actionType: actionType ?? this.actionType,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    isSuccess,
    isOnBreak,
    error,
    updatedTodo,
    actionType,
  ];
}

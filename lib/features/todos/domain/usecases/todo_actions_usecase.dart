import 'package:injectable/injectable.dart';

import '../entities/todo.dart';
import '../repositories/todo_actions_repository.dart';
import '../../data/models/todo_action_request_models.dart';

@injectable
class TodoActionsUseCase {
  final TodoActionsRepository _repository;

  const TodoActionsUseCase(this._repository);

  Future<Todo> markTodoComplete(String todoId) async {
    return await _repository.markTodoComplete(todoId);
  }

  Future<Todo> markTodoIncomplete(String todoId) async {
    return await _repository.markTodoIncomplete(todoId);
  }

  Future<Todo> pinTodo(String todoId) async {
    return await _repository.pinTodo(todoId);
  }

  Future<void> startBreak({
    required String todoId,
    String? projectId,
    required BreakType breakType,
    String? reason,
    int? estimatedDuration,
  }) async {
    final request = StartBreakRequest(
      todoId: todoId,
      projectId: projectId,
      breakType: breakType.value,
      reason: reason,
      estimatedDuration: estimatedDuration ?? breakType.defaultDuration,
    );
    return await _repository.startBreak(request);
  }

  Future<void> stopBreak(String todoId) async {
    return await _repository.stopBreak(todoId);
  }

  Future<void> pauseTodo(String todoId) async {
    return await _repository.pauseTodo(todoId);
  }

  Future<Todo> skipTodo(String todoId) async {
    return await _repository.skipTodo(todoId);
  }

  Future<bool> getActiveBreakStatus(String todoId) async {
    return await _repository.getActiveBreakStatus(todoId);
  }
}

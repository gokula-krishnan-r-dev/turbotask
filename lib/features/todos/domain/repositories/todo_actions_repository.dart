import '../entities/todo.dart';
import '../../data/models/todo_action_request_models.dart';

abstract class TodoActionsRepository {
  Future<Todo> markTodoComplete(String todoId);
  Future<Todo> markTodoIncomplete(String todoId);
  Future<Todo> pinTodo(String todoId);
  Future<void> startBreak(StartBreakRequest request);
  Future<void> stopBreak(String todoId);
  Future<void> pauseTodo(String todoId);
  Future<Todo> skipTodo(String todoId);
  Future<bool> getActiveBreakStatus(String todoId);
  Future<void> deleteTodo(String todoId);
}

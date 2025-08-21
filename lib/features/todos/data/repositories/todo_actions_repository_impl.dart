import 'package:injectable/injectable.dart';

import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_actions_repository.dart';
import '../datasources/todo_actions_remote_datasource.dart';
import '../models/todo_action_request_models.dart';

@Injectable(as: TodoActionsRepository)
class TodoActionsRepositoryImpl implements TodoActionsRepository {
  final TodoActionsRemoteDataSource _remoteDataSource;

  const TodoActionsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Todo> markTodoComplete(String todoId) async {
    return await _remoteDataSource.markTodoComplete(todoId);
  }

  @override
  Future<Todo> markTodoIncomplete(String todoId) async {
    return await _remoteDataSource.markTodoIncomplete(todoId);
  }

  @override
  Future<Todo> pinTodo(String todoId) async {
    return await _remoteDataSource.pinTodo(todoId);
  }

  @override
  Future<void> startBreak(StartBreakRequest request) async {
    return await _remoteDataSource.startBreak(request);
  }

  @override
  Future<void> stopBreak(String todoId) async {
    return await _remoteDataSource.stopBreak(todoId);
  }

  @override
  Future<void> pauseTodo(String todoId) async {
    return await _remoteDataSource.pauseTodo(todoId);
  }

  @override
  Future<Todo> skipTodo(String todoId) async {
    return await _remoteDataSource.skipTodo(todoId);
  }

  @override
  Future<bool> getActiveBreakStatus(String todoId) async {
    return await _remoteDataSource.getActiveBreakStatus(todoId);
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    return await _remoteDataSource.deleteTodo(todoId);
  }
}

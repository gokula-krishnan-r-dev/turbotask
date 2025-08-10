import 'package:injectable/injectable.dart';

import '../../domain/entities/todo.dart';
import '../../domain/entities/subtask.dart';
import '../../domain/entities/create_todo_request.dart';
import '../../domain/entities/create_subtask_request.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_remote_datasource.dart';
import '../models/create_todo_request_model.dart';
import '../models/create_subtask_request_model.dart';

/// Implementation of TodoRepository using remote data source.
@Singleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  const TodoRepositoryImpl(this._remoteDataSource);

  final TodoRemoteDataSource _remoteDataSource;

  @override
  Future<Todo> createTodo(CreateTodoRequest request) async {
    final requestModel = CreateTodoRequestModel.fromDomain(request);
    final response = await _remoteDataSource.createTodo(requestModel);

    if (response.data == null) {
      throw Exception('Failed to create todo: No data returned');
    }

    return response.data!.toDomain();
  }

  @override
  Future<List<Todo>> getUserTodos({
    int limit = 20,
    int offset = 0,
    bool includeRelated = true,
    String sortBy = 'created_at',
    String sortOrder = 'desc',
  }) async {
    final response = await _remoteDataSource.getUserTodos(
      limit: limit,
      offset: offset,
      includeRelated: includeRelated,
      sortBy: sortBy,
      sortOrder: sortOrder,
    );

    return response.data.map((model) => model.toDomain()).toList();
  }

  @override
  Future<List<Todo>> getProjectTodos(
    String projectId, {
    bool includeCompleted = false,
  }) async {
    final response = await _remoteDataSource.getProjectTodos(
      projectId,
      includeCompleted: includeCompleted,
    );

    return response.data.map((model) => model.toDomain()).toList();
  }

  @override
  Future<Todo> getTodoById(String todoId, {bool includeRelated = true}) async {
    final response = await _remoteDataSource.getTodoById(
      todoId,
      includeRelated: includeRelated,
    );

    if (response.data == null) {
      throw Exception('Todo not found');
    }

    return response.data!.toDomain();
  }

  @override
  Future<Todo> updateTodo(String todoId, Map<String, dynamic> updates) async {
    final response = await _remoteDataSource.updateTodo(todoId, updates);

    if (response.data == null) {
      throw Exception('Failed to update todo: No data returned');
    }

    return response.data!.toDomain();
  }

  @override
  Future<List<Todo>> searchTodos({
    required String query,
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await _remoteDataSource.searchTodos(
      query: query,
      limit: limit,
      offset: offset,
    );

    return response.data.map((model) => model.toDomain()).toList();
  }

  @override
  Future<Todo> markTodoComplete(String todoId) async {
    final response = await _remoteDataSource.markTodoComplete(todoId);

    if (response.data == null) {
      throw Exception('Failed to mark todo complete: No data returned');
    }

    return response.data!.toDomain();
  }

  @override
  Future<Todo> markTodoIncomplete(String todoId) async {
    final response = await _remoteDataSource.markTodoIncomplete(todoId);

    if (response.data == null) {
      throw Exception('Failed to mark todo incomplete: No data returned');
    }

    return response.data!.toDomain();
  }

  @override
  Future<Todo> pinTodo(String todoId, bool pinned) async {
    final response = await _remoteDataSource.pinTodo(todoId, pinned);

    if (response.data == null) {
      throw Exception('Failed to pin todo: No data returned');
    }

    return response.data!.toDomain();
  }

  @override
  Future<List<Todo>> getOverdueTodos() async {
    final response = await _remoteDataSource.getOverdueTodos();
    return response.data.map((model) => model.toDomain()).toList();
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await _remoteDataSource.deleteTodo(todoId);
  }

  // Subtask operations
  @override
  Future<Subtask> createSubtask(
    String todoId,
    CreateSubtaskRequest request,
  ) async {
    final requestModel = CreateSubtaskRequestModel.fromDomain(request);
    final response = await _remoteDataSource.createSubtask(
      todoId,
      requestModel,
    );

    if (response.data == null) {
      throw Exception('Failed to create subtask: No data returned');
    }

    return response.data!.toDomain();
  }

  @override
  Future<List<Subtask>> getSubtasks(
    String todoId, {
    bool includeArchived = false,
  }) async {
    final response = await _remoteDataSource.getSubtasks(
      todoId,
      includeArchived: includeArchived,
    );

    return response.data.map((model) => model.toDomain()).toList();
  }

  @override
  Future<Subtask> updateSubtask(
    String subtaskId,
    Map<String, dynamic> updates,
  ) async {
    final response = await _remoteDataSource.updateSubtask(subtaskId, updates);

    if (response.data == null) {
      throw Exception('Failed to update subtask: No data returned');
    }

    return response.data!.toDomain();
  }

  @override
  Future<void> reorderSubtasks(String todoId, List<String> subtaskIds) async {
    await _remoteDataSource.reorderSubtasks(todoId, subtaskIds);
  }

  @override
  Future<void> deleteSubtask(String subtaskId) async {
    await _remoteDataSource.deleteSubtask(subtaskId);
  }
}

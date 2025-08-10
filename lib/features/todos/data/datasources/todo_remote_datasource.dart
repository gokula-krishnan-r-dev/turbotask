import 'package:injectable/injectable.dart';

import '../../../../core/network/api_service.dart';
import '../models/todo_model.dart';
import '../models/subtask_model.dart';
import '../models/create_todo_request_model.dart';
import '../models/create_subtask_request_model.dart';
import '../models/todo_response_model.dart';

/// Abstract interface for todo remote data source.
abstract class TodoRemoteDataSource {
  Future<TodoResponseModel> createTodo(CreateTodoRequestModel request);
  Future<TodoListResponseModel> getUserTodos({
    int limit = 20,
    int offset = 0,
    bool includeRelated = true,
    String sortBy = 'created_at',
    String sortOrder = 'desc',
  });
  Future<TodoListResponseModel> getProjectTodos(
    String projectId, {
    bool includeCompleted = false,
  });
  Future<TodoResponseModel> getTodoById(
    String todoId, {
    bool includeRelated = true,
  });
  Future<TodoResponseModel> updateTodo(
    String todoId,
    Map<String, dynamic> updates,
  );
  Future<TodoListResponseModel> searchTodos({
    required String query,
    int limit = 10,
    int offset = 0,
  });
  Future<TodoResponseModel> markTodoComplete(String todoId);
  Future<TodoResponseModel> markTodoIncomplete(String todoId);
  Future<TodoResponseModel> pinTodo(String todoId, bool pinned);
  Future<TodoListResponseModel> getOverdueTodos();
  Future<void> deleteTodo(String todoId);

  // Subtask operations
  Future<SubtaskResponseModel> createSubtask(
    String todoId,
    CreateSubtaskRequestModel request,
  );
  Future<SubtaskListResponseModel> getSubtasks(
    String todoId, {
    bool includeArchived = false,
  });
  Future<SubtaskResponseModel> updateSubtask(
    String subtaskId,
    Map<String, dynamic> updates,
  );
  Future<void> reorderSubtasks(String todoId, List<String> subtaskIds);
  Future<void> deleteSubtask(String subtaskId);
}

/// Implementation of todo remote data source using ApiService.
@Singleton(as: TodoRemoteDataSource)
class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  const TodoRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<TodoResponseModel> createTodo(CreateTodoRequestModel request) async {
    final response = await _apiService.post(
      '/api/v1/todo/todos',
      data: request.toJson(),
    );

    return TodoResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<TodoListResponseModel> getUserTodos({
    int limit = 20,
    int offset = 0,
    bool includeRelated = true,
    String sortBy = 'created_at',
    String sortOrder = 'desc',
  }) async {
    final response = await _apiService.get(
      '/api/v1/todo/todos',
      queryParameters: {
        'limit': limit.toString(),
        'offset': offset.toString(),
        'include_related': includeRelated.toString(),
        'sort_by': sortBy,
        'sort_order': sortOrder,
      },
    );

    return TodoListResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<TodoListResponseModel> getProjectTodos(
    String projectId, {
    bool includeCompleted = false,
  }) async {
    final response = await _apiService.get(
      '/api/v1/todo/projects/$projectId/todos',
      queryParameters: {'include_completed': includeCompleted.toString()},
    );

    return TodoListResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<TodoResponseModel> getTodoById(
    String todoId, {
    bool includeRelated = true,
  }) async {
    final response = await _apiService.get(
      '/api/v1/todo/todos/$todoId',
      queryParameters: {'include_related': includeRelated.toString()},
    );

    return TodoResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<TodoResponseModel> updateTodo(
    String todoId,
    Map<String, dynamic> updates,
  ) async {
    final response = await _apiService.put(
      '/api/v1/todo/todos/$todoId',
      data: updates,
    );

    return TodoResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<TodoListResponseModel> searchTodos({
    required String query,
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await _apiService.get(
      '/api/v1/todo/todos/search',
      queryParameters: {
        'q': query,
        'limit': limit.toString(),
        'offset': offset.toString(),
      },
    );

    return TodoListResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<TodoResponseModel> markTodoComplete(String todoId) async {
    final response = await _apiService.post(
      '/api/v1/todo/todos/$todoId/complete',
    );

    return TodoResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<TodoResponseModel> markTodoIncomplete(String todoId) async {
    final response = await _apiService.post(
      '/api/v1/todo/todos/$todoId/incomplete',
    );

    return TodoResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<TodoResponseModel> pinTodo(String todoId, bool pinned) async {
    final response = await _apiService.post(
      '/api/v1/todo/todos/$todoId/pin',
      data: {'pinned': pinned},
    );

    return TodoResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<TodoListResponseModel> getOverdueTodos() async {
    final response = await _apiService.get('/api/v1/todo/todos/overdue');

    return TodoListResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await _apiService.delete('/api/v1/todo/todos/$todoId');
  }

  // Subtask operations
  @override
  Future<SubtaskResponseModel> createSubtask(
    String todoId,
    CreateSubtaskRequestModel request,
  ) async {
    final response = await _apiService.post(
      '/api/v1/todo/todos/$todoId/subtasks',
      data: request.toJson(),
    );

    return SubtaskResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<SubtaskListResponseModel> getSubtasks(
    String todoId, {
    bool includeArchived = false,
  }) async {
    final response = await _apiService.get(
      '/api/v1/todo/todos/$todoId/subtasks',
      queryParameters: {'include_archived': includeArchived.toString()},
    );

    return SubtaskListResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<SubtaskResponseModel> updateSubtask(
    String subtaskId,
    Map<String, dynamic> updates,
  ) async {
    final response = await _apiService.put(
      '/api/v1/todo/subtasks/$subtaskId',
      data: updates,
    );

    return SubtaskResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> reorderSubtasks(String todoId, List<String> subtaskIds) async {
    await _apiService.post(
      '/api/v1/todo/todos/$todoId/subtasks/reorder',
      data: {'subtask_ids': subtaskIds},
    );
  }

  @override
  Future<void> deleteSubtask(String subtaskId) async {
    await _apiService.delete('/api/v1/todo/subtasks/$subtaskId');
  }
}

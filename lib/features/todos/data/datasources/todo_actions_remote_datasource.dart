import 'package:injectable/injectable.dart';

import '../../../../core/network/api_service.dart';
import '../../domain/entities/todo.dart';
import '../models/todo_action_request_models.dart';

abstract class TodoActionsRemoteDataSource {
  Future<Todo> markTodoComplete(String todoId);
  Future<Todo> markTodoIncomplete(String todoId);
  Future<Todo> pinTodo(String todoId);
  Future<void> startBreak(StartBreakRequest request);
  Future<void> stopBreak(String todoId);
  Future<void> pauseTodo(String todoId);
  Future<Todo> skipTodo(String todoId);
  Future<bool> getActiveBreakStatus(String todoId);
}

@Injectable(as: TodoActionsRemoteDataSource)
class TodoActionsRemoteDataSourceImpl implements TodoActionsRemoteDataSource {
  final ApiService _apiService;

  const TodoActionsRemoteDataSourceImpl(this._apiService);

  @override
  Future<Todo> markTodoComplete(String todoId) async {
    try {
      final response = await _apiService.post(
        '/api/v1/todo/todos/$todoId/complete',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return Todo.fromJson(data['todo'] ?? data);
      } else {
        throw Exception(
          'Failed to mark todo as complete: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Network error while completing todo: $e');
    }
  }

  @override
  Future<Todo> markTodoIncomplete(String todoId) async {
    try {
      final response = await _apiService.post(
        '/api/v1/todo/todos/$todoId/incomplete',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return Todo.fromJson(data['todo'] ?? data);
      } else {
        throw Exception(
          'Failed to mark todo as incomplete: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Network error while marking todo incomplete: $e');
    }
  }

  @override
  Future<Todo> pinTodo(String todoId) async {
    try {
      final response = await _apiService.post('/api/v1/todo/todos/$todoId/pin');

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return Todo.fromJson(data['todo'] ?? data);
      } else {
        throw Exception('Failed to pin todo: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error while pinning todo: $e');
    }
  }

  @override
  Future<void> startBreak(StartBreakRequest request) async {
    try {
      final response = await _apiService.post(
        '/api/v1/todo/breaks/start',
        data: request.toJson(),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to start break: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error while starting break: $e');
    }
  }

  @override
  Future<void> stopBreak(String todoId) async {
    try {
      final response = await _apiService.post(
        '/api/v1/todo/breaks/stop',
        data: {'todo_id': todoId},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to stop break: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error while stopping break: $e');
    }
  }

  @override
  Future<void> pauseTodo(String todoId) async {
    try {
      final response = await _apiService.put(
        '/api/v1/todo/todos/$todoId',
        data: {'status': 'on_hold'},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to pause todo: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error while pausing todo: $e');
    }
  }

  @override
  Future<Todo> skipTodo(String todoId) async {
    try {
      final response = await _apiService.put(
        '/api/v1/todo/todos/$todoId',
        data: {'status': 'backlog'},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return Todo.fromJson(data['todo'] ?? data);
      } else {
        throw Exception('Failed to skip todo: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error while skipping todo: $e');
    }
  }

  @override
  Future<bool> getActiveBreakStatus(String todoId) async {
    try {
      final response = await _apiService.get(
        '/api/v1/todo/breaks/active',
        queryParameters: {'todo_id': todoId},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return data['has_active_break'] ?? false;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

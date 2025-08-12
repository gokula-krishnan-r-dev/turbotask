import 'package:injectable/injectable.dart';

import '../../../../core/network/api_service.dart';
import '../../domain/entities/kanban_board.dart';
import '../../domain/entities/todo.dart';
import '../models/kanban_request_models.dart';

abstract class KanbanRemoteDataSource {
  Future<KanbanBoard> getProjectKanbanBoard(String projectId);
  Future<Todo> createTodo(CreateTodoRequest request);
  Future<void> moveTodo(MoveTodoRequest request);
  Future<void> reorderTodos(ReorderTodosRequest request);
  Future<void> bulkMoveTodos(BulkMoveTodosRequest request);
}

@Injectable(as: KanbanRemoteDataSource)
class KanbanRemoteDataSourceImpl implements KanbanRemoteDataSource {
  final ApiService _apiService;

  const KanbanRemoteDataSourceImpl(this._apiService);

  @override
  Future<KanbanBoard> getProjectKanbanBoard(String projectId) async {
    try {
      final response = await _apiService.get(
        '/api/v1/todo/projects/$projectId/kanban',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return KanbanBoard.fromJson(data['board'] ?? data);
      } else {
        throw Exception('Failed to load kanban board: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('404') ||
          e.toString().contains('Project not found')) {
        throw Exception('Project not found');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<Todo> createTodo(CreateTodoRequest request) async {
    try {
      final response = await _apiService.post(
        '/api/v1/todo/todos',
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return Todo.fromJson(data['todo'] ?? data);
      } else {
        throw Exception('Failed to create todo: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid todo data');
      } else if (e.toString().contains('403') ||
          e.toString().contains('Permission')) {
        throw Exception('Permission denied');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> moveTodo(MoveTodoRequest request) async {
    try {
      final response = await _apiService.post(
        '/api/v1/todo/todos/move',
        data: request.toJson(),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to move todo: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('404') || e.toString().contains('not found')) {
        throw Exception('Todo not found');
      } else if (e.toString().contains('400') ||
          e.toString().contains('Invalid')) {
        throw Exception('Invalid move request');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> reorderTodos(ReorderTodosRequest request) async {
    try {
      final response = await _apiService.post(
        '/api/v1/todo/todos/reorder',
        data: request.toJson(),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to reorder todos: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid reorder request');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> bulkMoveTodos(BulkMoveTodosRequest request) async {
    try {
      final response = await _apiService.post(
        '/api/v1/todo/todos/bulk-move',
        data: request.toJson(),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to bulk move todos: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid bulk move request');
      }
      throw Exception('Network error: $e');
    }
  }
}

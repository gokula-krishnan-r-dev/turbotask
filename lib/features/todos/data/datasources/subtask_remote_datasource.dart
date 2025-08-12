import 'package:injectable/injectable.dart';

import '../../../../core/network/api_service.dart';
import '../../domain/entities/subtask.dart';
import '../models/subtask_request_models.dart';

abstract class SubtaskRemoteDataSource {
  Future<List<Subtask>> getSubtasks(String todoId);
  Future<Subtask> createSubtask(CreateSubtaskRequest request);
  Future<Subtask> updateSubtask(String subtaskId, UpdateSubtaskRequest request);
  Future<void> deleteSubtask(String subtaskId);
  Future<void> reorderSubtasks(ReorderSubtasksRequest request);
}

@Injectable(as: SubtaskRemoteDataSource)
class SubtaskRemoteDataSourceImpl implements SubtaskRemoteDataSource {
  final ApiService _apiService;

  const SubtaskRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<Subtask>> getSubtasks(String todoId) async {
    try {
      final response = await _apiService.get(
        '/api/v1/todo/todos/$todoId/subtasks',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? [];
        return (data as List)
            .map((json) => Subtask.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to get subtasks: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('404') ||
          e.toString().contains('Todo not found')) {
        throw Exception('Todo not found');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<Subtask> createSubtask(CreateSubtaskRequest request) async {
    try {
      final response = await _apiService.post(
        '/api/v1/todo/todos/${request.todoId}/subtasks',
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return Subtask.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to create subtask: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid subtask data');
      } else if (e.toString().contains('404') ||
          e.toString().contains('Todo not found')) {
        throw Exception('Todo not found');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<Subtask> updateSubtask(
    String subtaskId,
    UpdateSubtaskRequest request,
  ) async {
    try {
      final response = await _apiService.put(
        '/api/v1/todo/subtasks/$subtaskId',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return Subtask.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to update subtask: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid subtask data');
      } else if (e.toString().contains('404') ||
          e.toString().contains('not found')) {
        throw Exception('Subtask not found');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> deleteSubtask(String subtaskId) async {
    try {
      final response = await _apiService.delete(
        '/api/v1/todo/subtasks/$subtaskId',
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to delete subtask: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('404') || e.toString().contains('not found')) {
        throw Exception('Subtask not found');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> reorderSubtasks(ReorderSubtasksRequest request) async {
    try {
      final response = await _apiService.post(
        '/api/v1/todo/todos/${request.todoId}/subtasks/reorder',
        data: request.toJson(),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to reorder subtasks: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid reorder request');
      } else if (e.toString().contains('404') ||
          e.toString().contains('Todo not found')) {
        throw Exception('Todo not found');
      }
      throw Exception('Network error: $e');
    }
  }
}

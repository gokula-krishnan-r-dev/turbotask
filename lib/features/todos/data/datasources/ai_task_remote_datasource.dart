import 'package:injectable/injectable.dart';

import '../../../../core/network/api_service.dart';
import '../../domain/entities/todo.dart';
import '../models/ai_task_models.dart';

abstract class AITaskRemoteDataSource {
  Future<OptimizedAITaskResponse> createOptimizedAITask(
    CreateOptimizedAITaskRequest request,
  );
  Future<Todo> regenerateAIEnhancements(String taskId);
  Future<Map<String, dynamic>> improveDescription(
    ImproveDescriptionRequest request,
  );
  Future<List<Map<String, dynamic>>> refineSubtasks(
    RefineSubtasksRequest request,
  );
}

@Injectable(as: AITaskRemoteDataSource)
class AITaskRemoteDataSourceImpl implements AITaskRemoteDataSource {
  final ApiService _apiService;

  const AITaskRemoteDataSourceImpl(this._apiService);

  @override
  Future<OptimizedAITaskResponse> createOptimizedAITask(
    CreateOptimizedAITaskRequest request,
  ) async {
    try {
      final response = await _apiService.post(
        '/api/v1/ai/tasks/optimized',
        data: request.toJson(),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return OptimizedAITaskResponse.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception(
          'Failed to create optimized AI task: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid task data. Please check your input.');
      } else if (e.toString().contains('403') ||
          e.toString().contains('Permission')) {
        throw Exception('Permission denied. Please check your access rights.');
      } else if (e.toString().contains('429') ||
          e.toString().contains('rate limit')) {
        throw Exception(
          'Too many requests. Please wait a moment and try again.',
        );
      }
      throw Exception('Network error while creating AI task: $e');
    }
  }

  @override
  Future<Todo> regenerateAIEnhancements(String taskId) async {
    try {
      final response = await _apiService.post(
        '/api/v1/ai/tasks/$taskId/regenerate',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return Todo.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception(
          'Failed to regenerate AI enhancements: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (e.toString().contains('404') || e.toString().contains('not found')) {
        throw Exception('Task not found');
      } else if (e.toString().contains('429') ||
          e.toString().contains('rate limit')) {
        throw Exception(
          'Too many requests. Please wait a moment and try again.',
        );
      }
      throw Exception('Network error while regenerating AI enhancements: $e');
    }
  }

  @override
  Future<Map<String, dynamic>> improveDescription(
    ImproveDescriptionRequest request,
  ) async {
    try {
      final response = await _apiService.post(
        '/api/v1/ai/description/improve',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return data as Map<String, dynamic>;
      } else {
        throw Exception(
          'Failed to improve description: ${response.statusCode}',
        );
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid description data');
      } else if (e.toString().contains('429') ||
          e.toString().contains('rate limit')) {
        throw Exception(
          'Too many requests. Please wait a moment and try again.',
        );
      }
      throw Exception('Network error while improving description: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> refineSubtasks(
    RefineSubtasksRequest request,
  ) async {
    try {
      final response = await _apiService.post(
        '/api/v1/ai/subtasks/refine',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return List<Map<String, dynamic>>.from(data as List);
      } else {
        throw Exception('Failed to refine subtasks: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid subtask data');
      } else if (e.toString().contains('404') ||
          e.toString().contains('not found')) {
        throw Exception('Task not found');
      } else if (e.toString().contains('429') ||
          e.toString().contains('rate limit')) {
        throw Exception(
          'Too many requests. Please wait a moment and try again.',
        );
      }
      throw Exception('Network error while refining subtasks: $e');
    }
  }
}

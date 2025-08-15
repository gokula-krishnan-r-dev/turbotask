import 'package:dio/dio.dart';
import '../../../../core/network/api_service.dart';
import '../../domain/entities/break_session.dart';
import '../../domain/entities/break_stats.dart';
import '../models/break_request_models.dart';

abstract class BreakRemoteDataSource {
  Future<BreakSession> startBreak(StartBreakRequest request);
  Future<BreakSession> stopBreak(StopBreakRequest request);
  Future<BreakSession?> getActiveBreak();
  Future<List<BreakSession>> getBreakHistory({int limit = 20, int offset = 0});
  Future<List<BreakSession>> getBreaksByTodo(
    String todoId, {
    int limit = 20,
    int offset = 0,
  });
  Future<List<BreakSession>> getBreaksByProject(
    String projectId, {
    int limit = 20,
    int offset = 0,
  });
  Future<BreakStats> getBreakStats();
}

class BreakRemoteDataSourceImpl implements BreakRemoteDataSource {
  final ApiService _apiService;

  const BreakRemoteDataSourceImpl(this._apiService);

  @override
  Future<BreakSession> startBreak(StartBreakRequest request) async {
    try {
      print(
        'BreakRemoteDataSource: Starting break for todoId: ${request.todoId}',
      );
      print('BreakRemoteDataSource: Request data: ${request.toJson()}');

      final response = await _apiService.post(
        '/api/v1/todo/breaks/start',
        data: request.toJson(),
      );

      print(
        'BreakRemoteDataSource: Start break response status: ${response.statusCode}',
      );
      print(
        'BreakRemoteDataSource: Start break response data: ${response.data}',
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return BreakSession.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to start break: ${response.statusCode}');
      }
    } catch (e) {
      print('BreakRemoteDataSource: Error starting break: $e');
      if (e.toString().contains('409') ||
          e.toString().contains('ACTIVE_BREAK_EXISTS')) {
        throw Exception('You already have an active break session');
      } else if (e.toString().contains('404') ||
          e.toString().contains('NOT_FOUND')) {
        throw Exception('Todo or project not found');
      } else if (e.toString().contains('403') ||
          e.toString().contains('ACCESS_DENIED')) {
        throw Exception('Access denied');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<BreakSession> stopBreak(StopBreakRequest request) async {
    try {
      print('BreakRemoteDataSource: Stopping break');
      print('BreakRemoteDataSource: Request data: ${request.toJson()}');

      final response = await _apiService.post(
        '/api/v1/todo/breaks/stop',
        data: request.toJson(),
      );

      print(
        'BreakRemoteDataSource: Stop break response status: ${response.statusCode}',
      );
      print(
        'BreakRemoteDataSource: Stop break response data: ${response.data}',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return BreakSession.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to stop break: ${response.statusCode}');
      }
    } catch (e) {
      print('BreakRemoteDataSource: Error stopping break: $e');
      if (e.toString().contains('404') ||
          e.toString().contains('NO_ACTIVE_BREAK')) {
        throw Exception('No active break session found');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<BreakSession?> getActiveBreak() async {
    try {
      print('BreakRemoteDataSource: Getting active break');

      final response = await _apiService.get('/api/v1/todo/breaks/active');

      print(
        'BreakRemoteDataSource: Get active break response status: ${response.statusCode}',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return BreakSession.fromJson(data as Map<String, dynamic>);
      } else if (response.statusCode == 204) {
        // No active break
        return null;
      } else {
        throw Exception('Failed to get active break: ${response.statusCode}');
      }
    } catch (e) {
      print('BreakRemoteDataSource: Error getting active break: $e');
      if (e is DioException && e.response?.statusCode == 204) {
        return null;
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<List<BreakSession>> getBreakHistory({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      print(
        'BreakRemoteDataSource: Getting break history (limit: $limit, offset: $offset)',
      );

      final response = await _apiService.get(
        '/api/v1/todo/breaks/history',
        queryParameters: {'limit': limit, 'offset': offset},
      );

      print(
        'BreakRemoteDataSource: Get break history response status: ${response.statusCode}',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        return data
            .map((json) => BreakSession.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to get break history: ${response.statusCode}');
      }
    } catch (e) {
      print('BreakRemoteDataSource: Error getting break history: $e');
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<List<BreakSession>> getBreaksByTodo(
    String todoId, {
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      print('BreakRemoteDataSource: Getting breaks by todo ID: $todoId');

      final response = await _apiService.get(
        '/api/v1/todo/breaks/todo/$todoId',
        queryParameters: {'limit': limit, 'offset': offset},
      );

      print(
        'BreakRemoteDataSource: Get breaks by todo response status: ${response.statusCode}',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        return data
            .map((json) => BreakSession.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to get breaks by todo: ${response.statusCode}');
      }
    } catch (e) {
      print('BreakRemoteDataSource: Error getting breaks by todo: $e');
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<List<BreakSession>> getBreaksByProject(
    String projectId, {
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      print('BreakRemoteDataSource: Getting breaks by project ID: $projectId');

      final response = await _apiService.get(
        '/api/v1/todo/breaks/project/$projectId',
        queryParameters: {'limit': limit, 'offset': offset},
      );

      print(
        'BreakRemoteDataSource: Get breaks by project response status: ${response.statusCode}',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] as List<dynamic>;
        return data
            .map((json) => BreakSession.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
          'Failed to get breaks by project: ${response.statusCode}',
        );
      }
    } catch (e) {
      print('BreakRemoteDataSource: Error getting breaks by project: $e');
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<BreakStats> getBreakStats() async {
    try {
      print('BreakRemoteDataSource: Getting break stats');

      final response = await _apiService.get('/api/v1/todo/breaks/stats');

      print(
        'BreakRemoteDataSource: Get break stats response status: ${response.statusCode}',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return BreakStats.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to get break stats: ${response.statusCode}');
      }
    } catch (e) {
      print('BreakRemoteDataSource: Error getting break stats: $e');
      throw Exception('Network error: $e');
    }
  }
}

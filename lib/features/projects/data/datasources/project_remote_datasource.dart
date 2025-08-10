import 'package:injectable/injectable.dart';

import '../../../../core/network/api_service.dart';
import '../models/create_project_request_model.dart';
import '../models/project_response_model.dart';

/// Abstract interface for project remote data source.
abstract class ProjectRemoteDataSource {
  Future<ProjectResponseModel> createProject(CreateProjectRequestModel request);
  Future<ProjectListResponseModel> getUserProjects({
    bool includeCounts = true,
    bool includeArchived = false,
  });
  Future<ProjectResponseModel> getProjectById(
    String projectId, {
    bool includeCounts = true,
  });
  Future<ProjectResponseModel> updateProject(
    String projectId,
    Map<String, dynamic> updates,
  );
  Future<ProjectListResponseModel> searchProjects({
    required String query,
    int limit = 10,
    int offset = 0,
  });
  Future<ProjectStatsResponseModel> getProjectStats({
    bool includeArchived = false,
  });
  Future<ProjectListResponseModel> getFavoriteProjects();
  Future<ProjectListResponseModel> getProjectsByCategory(String category);
  Future<void> archiveProject(String projectId);
  Future<void> restoreProject(String projectId);
}

/// Implementation of project remote data source using ApiService.
@Singleton(as: ProjectRemoteDataSource)
class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  const ProjectRemoteDataSourceImpl(this._apiService);

  final ApiService _apiService;

  @override
  Future<ProjectResponseModel> createProject(
    CreateProjectRequestModel request,
  ) async {
    final response = await _apiService.post(
      '/api/v1/todo/projects',
      data: request.toJson(),
    );

    return ProjectResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ProjectListResponseModel> getUserProjects({
    bool includeCounts = true,
    bool includeArchived = false,
  }) async {
    final response = await _apiService.get(
      '/api/v1/todo/projects',
      queryParameters: {
        'include_counts': includeCounts.toString(),
        'include_archived': includeArchived.toString(),
      },
    );

    return ProjectListResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<ProjectResponseModel> getProjectById(
    String projectId, {
    bool includeCounts = true,
  }) async {
    final response = await _apiService.get(
      '/api/v1/projects/$projectId',
      queryParameters: {'include_counts': includeCounts.toString()},
    );

    return ProjectResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ProjectResponseModel> updateProject(
    String projectId,
    Map<String, dynamic> updates,
  ) async {
    final response = await _apiService.put(
      '/api/v1/projects/$projectId',
      data: updates,
    );

    return ProjectResponseModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<ProjectListResponseModel> searchProjects({
    required String query,
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await _apiService.get(
      '/api/v1/projects/search',
      queryParameters: {
        'q': query,
        'limit': limit.toString(),
        'offset': offset.toString(),
      },
    );

    return ProjectListResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<ProjectStatsResponseModel> getProjectStats({
    bool includeArchived = false,
  }) async {
    final response = await _apiService.get(
      '/api/v1/todo/projects/stats',
      queryParameters: {'include_archived': includeArchived.toString()},
    );

    // The API returns individual project stats, not global stats
    // We need to calculate global stats from the project data
    final responseData = response.data as Map<String, dynamic>;
    final projectStatsList = (responseData['data'] as List<dynamic>)
        .map((json) => json as Map<String, dynamic>)
        .toList();

    // Calculate global statistics from individual project stats
    int totalProjects = projectStatsList.length;
    int activeProjects =
        totalProjects; // Assuming all returned projects are active
    int totalTasks = 0;
    int completedTasks = 0;
    Map<String, int> categoryBreakdown = {};

    for (final projectData in projectStatsList) {
      totalTasks += (projectData['total_todos'] as int? ?? 0);
      completedTasks += (projectData['completed_todos'] as int? ?? 0);

      final category = projectData['category'] as String? ?? 'uncategorized';
      categoryBreakdown[category] = (categoryBreakdown[category] ?? 0) + 1;
    }

    int pendingTasks = totalTasks - completedTasks;
    double completionRate = totalTasks > 0
        ? (completedTasks / totalTasks) * 100
        : 0.0;

    // Create a global stats response
    final globalStatsData = {
      'total_projects': totalProjects,
      'active_projects': activeProjects,
      'archived_projects': 0,
      'favorite_projects': 0,
      'total_tasks': totalTasks,
      'completed_tasks': completedTasks,
      'pending_tasks': pendingTasks,
      'completion_rate': completionRate,
      'category_breakdown': categoryBreakdown,
    };

    final globalStatsResponse = {
      'success': true,
      'message': 'Global statistics calculated successfully',
      'data': globalStatsData,
    };

    return ProjectStatsResponseModel.fromJson(globalStatsResponse);
  }

  @override
  Future<ProjectListResponseModel> getFavoriteProjects() async {
    final response = await _apiService.get('/api/v1/projects/favorites');

    return ProjectListResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<ProjectListResponseModel> getProjectsByCategory(
    String category,
  ) async {
    final response = await _apiService.get(
      '/api/v1/projects/category/$category',
    );

    return ProjectListResponseModel.fromJson(
      response.data as Map<String, dynamic>,
    );
  }

  @override
  Future<void> archiveProject(String projectId) async {
    await _apiService.post('/api/v1/projects/$projectId/archive');
  }

  @override
  Future<void> restoreProject(String projectId) async {
    await _apiService.post('/api/v1/projects/$projectId/restore');
  }
}

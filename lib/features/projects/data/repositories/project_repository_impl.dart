import 'package:injectable/injectable.dart';

import '../../domain/entities/create_project_request.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/project_stats.dart';
import '../../domain/repositories/project_repository.dart';
import '../datasources/project_remote_datasource.dart';
import '../models/create_project_request_model.dart';

/// Implementation of ProjectRepository using remote data source.
@Singleton(as: ProjectRepository)
class ProjectRepositoryImpl implements ProjectRepository {
  const ProjectRepositoryImpl(this._remoteDataSource);

  final ProjectRemoteDataSource _remoteDataSource;

  @override
  Future<Project> createProject(CreateProjectRequest request) async {
    final requestModel = CreateProjectRequestModel.fromDomain(request);
    final response = await _remoteDataSource.createProject(requestModel);

    if (response.data == null) {
      throw Exception('Failed to create project: No data returned');
    }

    return response.data!.toDomain();
  }

  @override
  Future<List<Project>> getUserProjects({
    bool includeCounts = true,
    bool includeArchived = false,
  }) async {
    final response = await _remoteDataSource.getUserProjects(
      includeCounts: includeCounts,
      includeArchived: includeArchived,
    );

    return response.data.map((model) => model.toDomain()).toList();
  }

  @override
  Future<Project> getProjectById(
    String projectId, {
    bool includeCounts = true,
  }) async {
    final response = await _remoteDataSource.getProjectById(
      projectId,
      includeCounts: includeCounts,
    );

    if (response.data == null) {
      throw Exception('Project not found');
    }

    return response.data!.toDomain();
  }

  @override
  Future<Project> updateProject(
    String projectId,
    Map<String, dynamic> updates,
  ) async {
    final response = await _remoteDataSource.updateProject(projectId, updates);

    if (response.data == null) {
      throw Exception('Failed to update project: No data returned');
    }

    return response.data!.toDomain();
  }

  @override
  Future<List<Project>> searchProjects({
    required String query,
    int limit = 10,
    int offset = 0,
  }) async {
    final response = await _remoteDataSource.searchProjects(
      query: query,
      limit: limit,
      offset: offset,
    );

    return response.data.map((model) => model.toDomain()).toList();
  }

  @override
  Future<ProjectStats> getProjectStats({bool includeArchived = false}) async {
    final response = await _remoteDataSource.getProjectStats(
      includeArchived: includeArchived,
    );

    return response.data.toDomain();
  }

  @override
  Future<List<Project>> getFavoriteProjects() async {
    final response = await _remoteDataSource.getFavoriteProjects();
    return response.data.map((model) => model.toDomain()).toList();
  }

  @override
  Future<List<Project>> getProjectsByCategory(String category) async {
    final response = await _remoteDataSource.getProjectsByCategory(category);
    return response.data.map((model) => model.toDomain()).toList();
  }

  @override
  Future<void> archiveProject(String projectId) async {
    await _remoteDataSource.archiveProject(projectId);
  }

  @override
  Future<void> restoreProject(String projectId) async {
    await _remoteDataSource.restoreProject(projectId);
  }

  @override
  Future<void> deleteProject(String projectId) async {
    // Note: Delete endpoint not provided in API collection
    // This would need to be implemented when the API supports it
    throw UnimplementedError('Delete project not yet implemented in API');
  }
}

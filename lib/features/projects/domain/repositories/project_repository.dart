import '../entities/create_project_request.dart';
import '../entities/project.dart';
import '../entities/project_stats.dart';
import '../../data/models/export_import_models.dart';

/// Abstract repository for project operations.
/// Defines the contract for project data access.
abstract class ProjectRepository {
  /// Create a new project
  Future<Project> createProject(CreateProjectRequest request);

  /// Get all user projects
  Future<List<Project>> getUserProjects({
    bool includeCounts = true,
    bool includeArchived = false,
  });

  /// Get project by ID
  Future<Project> getProjectById(String projectId, {bool includeCounts = true});

  /// Update project
  Future<Project> updateProject(String projectId, Map<String, dynamic> updates);

  /// Search projects
  Future<List<Project>> searchProjects({
    required String query,
    int limit = 10,
    int offset = 0,
  });

  /// Get project statistics
  Future<ProjectStats> getProjectStats({bool includeArchived = false});

  /// Get favorite projects
  Future<List<Project>> getFavoriteProjects();

  /// Get projects by category
  Future<List<Project>> getProjectsByCategory(String category);

  /// Archive project
  Future<void> archiveProject(String projectId);

  /// Restore archived project
  Future<void> restoreProject(String projectId);

  /// Delete project
  Future<void> deleteProject(String projectId);

  /// Export project data as ZIP file
  Future<String> exportProject(String projectId);

  /// Import project data from ZIP file
  Future<ImportProjectResponse> importProject(String projectId);
}

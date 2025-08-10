import 'package:injectable/injectable.dart';

import '../entities/project.dart';
import '../repositories/project_repository.dart';

/// Use case for getting user's projects.
/// Retrieves all projects for the current user with optional filtering.
@injectable
class GetUserProjectsUseCase {
  const GetUserProjectsUseCase(this._projectRepository);

  final ProjectRepository _projectRepository;

  /// Execute getting user projects
  /// Returns list of projects for the authenticated user
  Future<List<Project>> call({
    bool includeCounts = true,
    bool includeArchived = false,
  }) async {
    return await _projectRepository.getUserProjects(
      includeCounts: includeCounts,
      includeArchived: includeArchived,
    );
  }
}

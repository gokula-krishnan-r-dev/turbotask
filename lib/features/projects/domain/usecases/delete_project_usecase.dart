import 'package:injectable/injectable.dart';

import '../repositories/project_repository.dart';

/// Use case for deleting a project.
/// Validates input and deletes the project through the repository.
@injectable
class DeleteProjectUseCase {
  const DeleteProjectUseCase(this._projectRepository);

  final ProjectRepository _projectRepository;

  /// Execute project deletion
  /// Throws an exception if the project ID is invalid or deletion fails
  Future<void> call(String projectId) async {
    // Input validation
    if (projectId.trim().isEmpty) {
      throw ArgumentError('Project ID cannot be empty');
    }

    // Execute project deletion through repository
    return await _projectRepository.deleteProject(projectId);
  }
}

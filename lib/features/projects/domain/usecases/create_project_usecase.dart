import 'package:injectable/injectable.dart';

import '../entities/create_project_request.dart';
import '../entities/project.dart';
import '../repositories/project_repository.dart';

/// Use case for creating a new project.
/// Validates input and creates a project through the repository.
@injectable
class CreateProjectUseCase {
  const CreateProjectUseCase(this._projectRepository);

  final ProjectRepository _projectRepository;

  /// Execute project creation
  /// Returns the created project on success
  Future<Project> call(CreateProjectRequest request) async {
    // Input validation
    if (request.title.trim().isEmpty) {
      throw ArgumentError('Project title cannot be empty');
    }

    if (request.description.trim().isEmpty) {
      throw ArgumentError('Project description cannot be empty');
    }

    if (request.category.trim().isEmpty) {
      throw ArgumentError('Project category cannot be empty');
    }

    if (request.colorTheme.trim().isEmpty) {
      throw ArgumentError('Project color theme cannot be empty');
    }

    // Validate color theme format (should be a hex color)
    final colorRegex = RegExp(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$');
    if (!colorRegex.hasMatch(request.colorTheme)) {
      throw ArgumentError(
        'Invalid color theme format. Use hex format like #2ecc71',
      );
    }

    // Execute project creation through repository
    return await _projectRepository.createProject(request);
  }
}

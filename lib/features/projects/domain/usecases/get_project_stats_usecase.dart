import 'package:injectable/injectable.dart';

import '../entities/project_stats.dart';
import '../repositories/project_repository.dart';

/// Use case for getting project statistics.
/// Retrieves aggregated statistics about user's projects.
@injectable
class GetProjectStatsUseCase {
  const GetProjectStatsUseCase(this._projectRepository);

  final ProjectRepository _projectRepository;

  /// Execute getting project statistics
  /// Returns project statistics for the authenticated user
  Future<ProjectStats> call({bool includeArchived = false}) async {
    return await _projectRepository.getProjectStats(
      includeArchived: includeArchived,
    );
  }
}

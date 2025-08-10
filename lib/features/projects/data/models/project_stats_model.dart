import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project_stats.dart';

part 'project_stats_model.freezed.dart';
part 'project_stats_model.g.dart';

/// Data model for ProjectStats entity with JSON serialization.
@freezed
class ProjectStatsModel with _$ProjectStatsModel {
  const factory ProjectStatsModel({
    @JsonKey(name: 'total_projects') required int totalProjects,
    @JsonKey(name: 'active_projects') required int activeProjects,
    @JsonKey(name: 'archived_projects') required int archivedProjects,
    @JsonKey(name: 'favorite_projects') required int favoriteProjects,
    @JsonKey(name: 'total_tasks') required int totalTasks,
    @JsonKey(name: 'completed_tasks') required int completedTasks,
    @JsonKey(name: 'pending_tasks') required int pendingTasks,
    @JsonKey(name: 'completion_rate') required double completionRate,
    @JsonKey(name: 'category_breakdown')
    required Map<String, int> categoryBreakdown,
  }) = _ProjectStatsModel;

  const ProjectStatsModel._();

  /// Create ProjectStatsModel from JSON
  factory ProjectStatsModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectStatsModelFromJson(json);

  /// Convert to domain entity
  ProjectStats toDomain() {
    return ProjectStats(
      totalProjects: totalProjects,
      activeProjects: activeProjects,
      archivedProjects: archivedProjects,
      favoriteProjects: favoriteProjects,
      totalTasks: totalTasks,
      completedTasks: completedTasks,
      pendingTasks: pendingTasks,
      completionRate: completionRate,
      categoryBreakdown: categoryBreakdown,
    );
  }

  /// Create from domain entity
  factory ProjectStatsModel.fromDomain(ProjectStats stats) {
    return ProjectStatsModel(
      totalProjects: stats.totalProjects,
      activeProjects: stats.activeProjects,
      archivedProjects: stats.archivedProjects,
      favoriteProjects: stats.favoriteProjects,
      totalTasks: stats.totalTasks,
      completedTasks: stats.completedTasks,
      pendingTasks: stats.pendingTasks,
      completionRate: stats.completionRate,
      categoryBreakdown: stats.categoryBreakdown,
    );
  }
}

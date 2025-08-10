import 'package:equatable/equatable.dart';

/// Project statistics entity.
/// Contains aggregated statistics about user's projects.
class ProjectStats extends Equatable {
  const ProjectStats({
    required this.totalProjects,
    required this.activeProjects,
    required this.archivedProjects,
    required this.favoriteProjects,
    required this.totalTasks,
    required this.completedTasks,
    required this.pendingTasks,
    required this.completionRate,
    required this.categoryBreakdown,
  });

  final int totalProjects;
  final int activeProjects;
  final int archivedProjects;
  final int favoriteProjects;
  final int totalTasks;
  final int completedTasks;
  final int pendingTasks;
  final double completionRate;
  final Map<String, int> categoryBreakdown;

  @override
  List<Object?> get props => [
    totalProjects,
    activeProjects,
    archivedProjects,
    favoriteProjects,
    totalTasks,
    completedTasks,
    pendingTasks,
    completionRate,
    categoryBreakdown,
  ];

  @override
  String toString() {
    return 'ProjectStats(totalProjects: $totalProjects, activeProjects: $activeProjects, completionRate: $completionRate)';
  }
}

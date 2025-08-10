import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project.dart';
import '../../domain/entities/project_stats.dart';

part 'projects_state.freezed.dart';

/// Status enum for projects operations
enum ProjectsStatus { initial, loading, loaded, creating, created, error }

/// State for projects management
@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState({
    @Default(ProjectsStatus.initial) ProjectsStatus status,
    @Default([]) List<Project> projects,
    @Default([]) List<Project> filteredProjects,
    ProjectStats? stats,
    String? searchQuery,
    String? categoryFilter,
    String? errorMessage,
    @Default(false) bool isRefreshing,
    @Default(false) bool isCreating,
  }) = _ProjectsState;
}

/// Extension for ProjectsState convenience methods
extension ProjectsStateX on ProjectsState {
  bool get isLoading => status == ProjectsStatus.loading;
  bool get isLoaded => status == ProjectsStatus.loaded;
  bool get hasError => status == ProjectsStatus.error;
  bool get isEmpty => projects.isEmpty && status == ProjectsStatus.loaded;
  bool get hasProjects => projects.isNotEmpty;
  bool get isSearching => searchQuery != null && searchQuery!.isNotEmpty;
  bool get isFiltering => categoryFilter != null && categoryFilter!.isNotEmpty;

  List<Project> get displayProjects {
    if (isSearching || isFiltering) {
      return filteredProjects;
    }
    return projects;
  }

  List<String> get availableCategories {
    return projects.map((p) => p.category).toSet().toList()..sort();
  }
}

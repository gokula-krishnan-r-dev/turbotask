import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/create_project_request.dart';

part 'projects_event.freezed.dart';

/// Events for project management BLoC
@freezed
class ProjectsEvent with _$ProjectsEvent {
  const factory ProjectsEvent.loadProjects() = _LoadProjects;
  const factory ProjectsEvent.refreshProjects() = _RefreshProjects;
  const factory ProjectsEvent.createProject(CreateProjectRequest request) =
      _CreateProject;
  const factory ProjectsEvent.searchProjects(String query) = _SearchProjects;
  const factory ProjectsEvent.clearSearch() = _ClearSearch;
  const factory ProjectsEvent.filterByCategory(String category) =
      _FilterByCategory;
  const factory ProjectsEvent.clearFilter() = _ClearFilter;
  const factory ProjectsEvent.toggleFavorite(String projectId) =
      _ToggleFavorite;
  const factory ProjectsEvent.archiveProject(String projectId) =
      _ArchiveProject;
  const factory ProjectsEvent.restoreProject(String projectId) =
      _RestoreProject;
}

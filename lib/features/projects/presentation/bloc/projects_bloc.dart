import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/create_project_request.dart';
import '../../domain/entities/project.dart';
import '../../domain/usecases/create_project_usecase.dart';
import '../../domain/usecases/get_project_stats_usecase.dart';
import '../../domain/usecases/get_user_projects_usecase.dart';
import 'projects_event.dart';
import 'projects_state.dart';

/// BLoC for managing projects state and operations
@injectable
class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc(
    this._getUserProjectsUseCase,
    this._createProjectUseCase,
    this._getProjectStatsUseCase,
  ) : super(const ProjectsState()) {
    on<ProjectsEvent>((event, emit) async {
      await event.when(
        loadProjects: () => _onLoadProjects(emit),
        refreshProjects: () => _onRefreshProjects(emit),
        createProject: (request) => _onCreateProject(request, emit),
        searchProjects: (query) => _onSearchProjects(query, emit),
        clearSearch: () => _onClearSearch(emit),
        filterByCategory: (category) => _onFilterByCategory(category, emit),
        clearFilter: () => _onClearFilter(emit),
        toggleFavorite: (projectId) => _onToggleFavorite(projectId, emit),
        archiveProject: (projectId) => _onArchiveProject(projectId, emit),
        restoreProject: (projectId) => _onRestoreProject(projectId, emit),
      );
    });
  }

  final GetUserProjectsUseCase _getUserProjectsUseCase;
  final CreateProjectUseCase _createProjectUseCase;
  final GetProjectStatsUseCase _getProjectStatsUseCase;

  /// Load projects for the first time
  Future<void> _onLoadProjects(Emitter<ProjectsState> emit) async {
    emit(state.copyWith(status: ProjectsStatus.loading, errorMessage: null));

    try {
      final projects = await _getUserProjectsUseCase();
      final sortedProjects = _sortProjectsLatestFirst(projects);
      final stats = await _getProjectStatsUseCase();

      emit(
        state.copyWith(
          status: ProjectsStatus.loaded,
          projects: sortedProjects,
          filteredProjects: sortedProjects,
          stats: stats,
        ),
      );
    } on NetworkExceptions catch (e) {
      emit(
        state.copyWith(
          status: ProjectsStatus.error,
          errorMessage: NetworkExceptions.getErrorMessage(e),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProjectsStatus.error,
          errorMessage: 'Failed to load projects: ${e.toString()}',
        ),
      );
    }
  }

  /// Refresh projects list
  Future<void> _onRefreshProjects(Emitter<ProjectsState> emit) async {
    emit(state.copyWith(isRefreshing: true, errorMessage: null));

    try {
      final projects = await _getUserProjectsUseCase();
      final sortedProjects = _sortProjectsLatestFirst(projects);
      final stats = await _getProjectStatsUseCase();

      emit(
        state.copyWith(
          status: ProjectsStatus.loaded,
          projects: sortedProjects,
          filteredProjects: _applyCurrentFilters(sortedProjects),
          stats: stats,
          isRefreshing: false,
        ),
      );
    } on NetworkExceptions catch (e) {
      emit(
        state.copyWith(
          status: ProjectsStatus.error,
          errorMessage: NetworkExceptions.getErrorMessage(e),
          isRefreshing: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProjectsStatus.error,
          errorMessage: 'Failed to refresh projects: ${e.toString()}',
          isRefreshing: false,
        ),
      );
    }
  }

  /// Create a new project and automatically refresh the list
  Future<void> _onCreateProject(
    CreateProjectRequest request,
    Emitter<ProjectsState> emit,
  ) async {
    emit(state.copyWith(isCreating: true, errorMessage: null));

    try {
      // Create the project via API
      final newProject = await _createProjectUseCase(request);

      // Optimistic update: show the newly created project at the top immediately
      final optimisticallyUpdated = [
        newProject,
        ...state.projects,
      ];
      emit(
        state.copyWith(
          projects: optimisticallyUpdated,
          filteredProjects: _applyCurrentFilters(optimisticallyUpdated),
        ),
      );

      // Emit created status to trigger UI feedback (toast + modal dismissal)
      emit(
        state.copyWith(
          isCreating: false,
          status: ProjectsStatus.created,
          errorMessage: null,
        ),
      );

      // Allow UI to handle the created status (show toast, dismiss modal)
      await Future.delayed(const Duration(milliseconds: 500));

      // Automatically refresh the entire project list to get latest data from server
      // This ensures we have the most up-to-date data including the newly created project
      if (!emit.isDone) {
        emit(state.copyWith(isRefreshing: true));

        try {
          // Fetch latest projects and stats from server
          final projects = await _getUserProjectsUseCase();
          final sortedProjects = _sortProjectsLatestFirst(projects);
          final stats = await _getProjectStatsUseCase();

          emit(
            state.copyWith(
              status: ProjectsStatus.loaded,
              projects: sortedProjects,
              filteredProjects: _applyCurrentFilters(sortedProjects),
              stats: stats,
              isRefreshing: false,
              errorMessage: null,
            ),
          );
        } catch (refreshError) {
          // If refresh fails, at least add the created project to current list
          final updatedProjects = _sortProjectsLatestFirst([
            newProject,
            ...state.projects,
          ]);
          emit(
            state.copyWith(
              status: ProjectsStatus.loaded,
              projects: updatedProjects,
              filteredProjects: _applyCurrentFilters(updatedProjects),
              isRefreshing: false,
              errorMessage: null,
            ),
          );
        }
      }
    } on NetworkExceptions catch (e) {
      emit(
        state.copyWith(
          status: ProjectsStatus.error,
          errorMessage: NetworkExceptions.getErrorMessage(e),
          isCreating: false,
        ),
      );
    } catch (e) {
      String errorMessage = 'Failed to create project';

      // Handle specific validation errors
      if (e is ArgumentError) {
        errorMessage = e.message;
      }

      emit(
        state.copyWith(
          status: ProjectsStatus.error,
          errorMessage: errorMessage,
          isCreating: false,
        ),
      );
    }
  }

  /// Search projects by query
  Future<void> _onSearchProjects(
    String query,
    Emitter<ProjectsState> emit,
  ) async {
    emit(state.copyWith(searchQuery: query));

    final filteredProjects = _applyCurrentFilters(state.projects);
    emit(state.copyWith(filteredProjects: filteredProjects));
  }

  /// Clear search
  Future<void> _onClearSearch(Emitter<ProjectsState> emit) async {
    emit(state.copyWith(searchQuery: null));

    final filteredProjects = _applyCurrentFilters(state.projects);
    emit(state.copyWith(filteredProjects: filteredProjects));
  }

  /// Filter projects by category
  Future<void> _onFilterByCategory(
    String category,
    Emitter<ProjectsState> emit,
  ) async {
    emit(state.copyWith(categoryFilter: category));

    final filteredProjects = _applyCurrentFilters(state.projects);
    emit(state.copyWith(filteredProjects: filteredProjects));
  }

  /// Clear category filter
  Future<void> _onClearFilter(Emitter<ProjectsState> emit) async {
    emit(state.copyWith(categoryFilter: null));

    final filteredProjects = _applyCurrentFilters(state.projects);
    emit(state.copyWith(filteredProjects: filteredProjects));
  }

  /// Toggle project favorite status
  Future<void> _onToggleFavorite(
    String projectId,
    Emitter<ProjectsState> emit,
  ) async {
    // This would need to be implemented with an API call
    // For now, just update local state
    final updatedProjects = state.projects.map((project) {
      if (project.id == projectId) {
        return project.copyWith(isFavorite: !project.isFavorite);
      }
      return project;
    }).toList();

    emit(
      state.copyWith(
        projects: updatedProjects,
        filteredProjects: _applyCurrentFilters(updatedProjects),
      ),
    );
  }

  /// Archive a project
  Future<void> _onArchiveProject(
    String projectId,
    Emitter<ProjectsState> emit,
  ) async {
    // This would need to be implemented with an API call
    // For now, just remove from current list
    final updatedProjects = state.projects
        .where((p) => p.id != projectId)
        .toList();

    emit(
      state.copyWith(
        projects: updatedProjects,
        filteredProjects: _applyCurrentFilters(updatedProjects),
      ),
    );
  }

  /// Restore an archived project
  Future<void> _onRestoreProject(
    String projectId,
    Emitter<ProjectsState> emit,
  ) async {
    // This would need to be implemented with an API call
    // For now, this is a placeholder
  }

  /// Apply current search and filter criteria to projects list
  List<Project> _applyCurrentFilters(List<Project> projects) {
    var filtered = projects;

    // Apply search filter
    if (state.searchQuery != null && state.searchQuery!.isNotEmpty) {
      final query = state.searchQuery!.toLowerCase();
      filtered = filtered.where((project) {
        return project.title.toLowerCase().contains(query) ||
            project.description.toLowerCase().contains(query) ||
            project.category.toLowerCase().contains(query);
      }).toList();
    }

    // Apply category filter
    if (state.categoryFilter != null && state.categoryFilter!.isNotEmpty) {
      filtered = filtered.where((project) {
        return project.category == state.categoryFilter;
      }).toList();
    }

    return filtered;
  }

  /// Sort projects by `createdAt` descending so newest appear first
  List<Project> _sortProjectsLatestFirst(List<Project> projects) {
    final sorted = List<Project>.from(projects);
    sorted.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return sorted;
  }
}

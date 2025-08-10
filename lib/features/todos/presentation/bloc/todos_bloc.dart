import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../domain/entities/todo.dart';
import '../../domain/entities/subtask.dart';
import '../../domain/entities/create_todo_request.dart';
import '../../domain/entities/create_subtask_request.dart';
import '../../domain/usecases/get_project_todos_usecase.dart';
import '../../domain/usecases/create_todo_usecase.dart';
import '../../domain/usecases/create_subtask_usecase.dart';
import '../../domain/usecases/update_todo_status_usecase.dart';
import '../../domain/repositories/todo_repository.dart';
import 'todos_event.dart';
import 'todos_state.dart';

/// BLoC for managing todos state and operations
@injectable
class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc(
    this._getProjectTodosUseCase,
    this._createTodoUseCase,
    this._createSubtaskUseCase,
    this._updateTodoStatusUseCase,
    this._todoRepository,
  ) : super(const TodosState()) {
    on<TodosEvent>((event, emit) async {
      await event.when(
        loadProjectTodos: (projectId) => _onLoadProjectTodos(projectId, emit),
        refreshTodos: () => _onRefreshTodos(emit),
        createTodo: (request) => _onCreateTodo(request, emit),
        updateTodoStatus: (todoId, status) =>
            _onUpdateTodoStatus(todoId, status, emit),
        updateTodoSortOrder: (todoId, sortOrder) =>
            _onUpdateTodoSortOrder(todoId, sortOrder, emit),
        updateTodoStatusAndSortOrder: (todoId, status, sortOrder) =>
            _onUpdateTodoStatusAndSortOrder(todoId, status, sortOrder, emit),
        toggleTodoCompletion: (todoId) => _onToggleTodoCompletion(todoId, emit),
        toggleTodoPin: (todoId) => _onToggleTodoPin(todoId, emit),
        updateTodo: (todoId, updates) => _onUpdateTodo(todoId, updates, emit),
        deleteTodo: (todoId) => _onDeleteTodo(todoId, emit),
        searchTodos: (query) => _onSearchTodos(query, emit),
        clearSearch: () => _onClearSearch(emit),
        loadSubtasks: (todoId) => _onLoadSubtasks(todoId, emit),
        createSubtask: (todoId, request) =>
            _onCreateSubtask(todoId, request, emit),
        updateSubtaskStatus: (subtaskId, status) =>
            _onUpdateSubtaskStatus(subtaskId, status, emit),
        toggleSubtaskCompletion: (subtaskId) =>
            _onToggleSubtaskCompletion(subtaskId, emit),
        deleteSubtask: (subtaskId) => _onDeleteSubtask(subtaskId, emit),
        reorderSubtasks: (todoId, subtaskIds) =>
            _onReorderSubtasks(todoId, subtaskIds, emit),
      );
    });
  }

  final GetProjectTodosUseCase _getProjectTodosUseCase;
  final CreateTodoUseCase _createTodoUseCase;
  final CreateSubtaskUseCase _createSubtaskUseCase;
  final UpdateTodoStatusUseCase _updateTodoStatusUseCase;
  final TodoRepository _todoRepository;

  /// Load todos for a specific project
  Future<void> _onLoadProjectTodos(
    String projectId,
    Emitter<TodosState> emit,
  ) async {
    emit(
      state.copyWith(
        status: TodosStatus.loading,
        currentProjectId: projectId,
        errorMessage: null,
      ),
    );

    try {
      final todosByStatus = await _getProjectTodosUseCase(projectId);

      emit(
        state.copyWith(
          status: TodosStatus.loaded,
          todosByStatus: todosByStatus,
          searchQuery: null, // Clear search when loading new project
          searchResults: [],
        ),
      );
    } on NetworkExceptions catch (e) {
      emit(
        state.copyWith(
          status: TodosStatus.error,
          errorMessage: NetworkExceptions.getErrorMessage(e),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodosStatus.error,
          errorMessage: 'Failed to load todos: ${e.toString()}',
        ),
      );
    }
  }

  /// Refresh todos for the current project
  Future<void> _onRefreshTodos(Emitter<TodosState> emit) async {
    if (state.currentProjectId == null) return;

    emit(state.copyWith(isRefreshing: true, errorMessage: null));

    try {
      final todosByStatus = await _getProjectTodosUseCase(
        state.currentProjectId!,
      );

      emit(
        state.copyWith(
          status: TodosStatus.loaded,
          todosByStatus: todosByStatus,
          isRefreshing: false,
        ),
      );
    } on NetworkExceptions catch (e) {
      emit(
        state.copyWith(
          status: TodosStatus.error,
          errorMessage: NetworkExceptions.getErrorMessage(e),
          isRefreshing: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: TodosStatus.error,
          errorMessage: 'Failed to refresh todos: ${e.toString()}',
          isRefreshing: false,
        ),
      );
    }
  }

  /// Create a new todo
  Future<void> _onCreateTodo(
    CreateTodoRequest request,
    Emitter<TodosState> emit,
  ) async {
    emit(state.copyWith(isCreatingTodo: true, errorMessage: null));

    try {
      final newTodo = await _createTodoUseCase(request);

      // Add the new todo to the appropriate status list
      final updatedTodosByStatus = Map<TodoStatus, List<Todo>>.from(
        state.todosByStatus,
      );
      final statusTodos = List<Todo>.from(
        updatedTodosByStatus[newTodo.status] ?? [],
      );
      statusTodos.insert(0, newTodo); // Add at the beginning
      updatedTodosByStatus[newTodo.status] = statusTodos;

      emit(
        state.copyWith(
          status: TodosStatus.created,
          todosByStatus: updatedTodosByStatus,
          isCreatingTodo: false,
        ),
      );

      // Reset to loaded status after brief delay
      await Future.delayed(const Duration(milliseconds: 300));
      if (!emit.isDone) {
        emit(state.copyWith(status: TodosStatus.loaded));
      }
    } on NetworkExceptions catch (e) {
      emit(
        state.copyWith(
          status: TodosStatus.error,
          errorMessage: NetworkExceptions.getErrorMessage(e),
          isCreatingTodo: false,
        ),
      );
    } catch (e) {
      String errorMessage = 'Failed to create todo';

      if (e is ArgumentError) {
        errorMessage = e.message;
      }

      emit(
        state.copyWith(
          status: TodosStatus.error,
          errorMessage: errorMessage,
          isCreatingTodo: false,
        ),
      );
    }
  }

  /// Update todo status (for drag & drop) with dynamic API refetch
  Future<void> _onUpdateTodoStatus(
    String todoId,
    TodoStatus newStatus,
    Emitter<TodosState> emit,
  ) async {
    // Get current todo for optimistic update and potential revert
    final currentTodo = _findTodoById(todoId);
    if (currentTodo == null) return;

    // Skip if status hasn't changed
    if (currentTodo.status == newStatus) return;

    // Set loading state for visual feedback
    final updatedLoadingMap = Map<String, bool>.from(state.isUpdatingTodos);
    updatedLoadingMap[todoId] = true;

    // Optimistically update the UI for immediate feedback
    final optimisticTodo = currentTodo.copyWith(
      status: newStatus,
      updatedAt: DateTime.now(),
    );
    final optimisticTodosByStatus = _updateTodoInState(optimisticTodo);

    emit(
      state.copyWith(
        todosByStatus: optimisticTodosByStatus,
        isUpdatingTodos: updatedLoadingMap,
        errorMessage: null,
      ),
    );

    try {
      // Call the API to update the status
      final updatedTodo = await _todoRepository.updateTodo(todoId, {
        'status': newStatus.apiValue,
        'updated_at': DateTime.now().toIso8601String(),
      });

      // Clear loading state
      updatedLoadingMap[todoId] = false;

      // Dynamically refetch the entire project todos to get fresh data
      if (state.currentProjectId != null) {
        emit(state.copyWith(isUpdatingTodos: updatedLoadingMap));

        // Fetch fresh data from server
        final freshTodosByStatus = await _getProjectTodosUseCase(
          state.currentProjectId!,
          includeCompleted: true,
        );

        emit(
          state.copyWith(
            todosByStatus: freshTodosByStatus,
            isUpdatingTodos: updatedLoadingMap,
            errorMessage: null,
            status: TodosStatus.loaded,
          ),
        );

        // Show success feedback
        emit(
          state.copyWith(
            status: TodosStatus.updating,
            errorMessage: 'Task moved successfully!',
          ),
        );

        // Reset status after brief delay
        await Future.delayed(const Duration(milliseconds: 800));
        if (!emit.isDone) {
          emit(state.copyWith(status: TodosStatus.loaded, errorMessage: null));
        }
      } else {
        // Fallback: just update with server response if no project ID
        final finalTodosByStatus = _updateTodoInState(updatedTodo);
        emit(
          state.copyWith(
            todosByStatus: finalTodosByStatus,
            isUpdatingTodos: updatedLoadingMap,
            errorMessage: null,
          ),
        );
      }
    } on NetworkExceptions catch (e) {
      // Revert to original state on error
      final revertedTodosByStatus = _updateTodoInState(currentTodo);
      updatedLoadingMap[todoId] = false;

      emit(
        state.copyWith(
          todosByStatus: revertedTodosByStatus,
          errorMessage:
              'Failed to move task: ${NetworkExceptions.getErrorMessage(e)}',
          isUpdatingTodos: updatedLoadingMap,
          status: TodosStatus.error,
        ),
      );

      // Reset error status after delay
      await Future.delayed(const Duration(seconds: 3));
      if (!emit.isDone) {
        emit(state.copyWith(status: TodosStatus.loaded, errorMessage: null));
      }
    } catch (e) {
      // Revert to original state on error
      final revertedTodosByStatus = _updateTodoInState(currentTodo);
      updatedLoadingMap[todoId] = false;

      emit(
        state.copyWith(
          todosByStatus: revertedTodosByStatus,
          errorMessage: 'Failed to move task: ${e.toString()}',
          isUpdatingTodos: updatedLoadingMap,
          status: TodosStatus.error,
        ),
      );

      // Reset error status after delay
      await Future.delayed(const Duration(seconds: 3));
      if (!emit.isDone) {
        emit(state.copyWith(status: TodosStatus.loaded, errorMessage: null));
      }
    }
  }

  /// Update todo sort order (for reordering within same column)
  Future<void> _onUpdateTodoSortOrder(
    String todoId,
    int newSortOrder,
    Emitter<TodosState> emit,
  ) async {
    final currentTodo = _findTodoById(todoId);
    if (currentTodo == null) return;

    // Skip if sort order hasn't changed
    if (currentTodo.sortOrder == newSortOrder) return;

    // Set loading state for visual feedback
    final updatedLoadingMap = Map<String, bool>.from(state.isUpdatingTodos);
    updatedLoadingMap[todoId] = true;

    // Optimistically update the UI
    final optimisticTodo = currentTodo.copyWith(
      sortOrder: newSortOrder,
      updatedAt: DateTime.now(),
    );
    final optimisticTodosByStatus = _updateTodoInState(optimisticTodo);

    emit(
      state.copyWith(
        todosByStatus: optimisticTodosByStatus,
        isUpdatingTodos: updatedLoadingMap,
        errorMessage: null,
      ),
    );

    try {
      // Call the API to update the sort order
      await _todoRepository.updateTodo(todoId, {
        'sort_order': newSortOrder,
        'updated_at': DateTime.now().toIso8601String(),
      });

      // Clear loading state
      updatedLoadingMap[todoId] = false;

      // Refetch data to ensure consistency
      if (state.currentProjectId != null) {
        emit(state.copyWith(isUpdatingTodos: updatedLoadingMap));

        final freshTodosByStatus = await _getProjectTodosUseCase(
          state.currentProjectId!,
          includeCompleted: true,
        );

        emit(
          state.copyWith(
            todosByStatus: freshTodosByStatus,
            isUpdatingTodos: updatedLoadingMap,
            errorMessage: null,
            status: TodosStatus.loaded,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isUpdatingTodos: updatedLoadingMap,
            errorMessage: null,
          ),
        );
      }
    } on NetworkExceptions catch (e) {
      // Revert to original state on error
      final revertedTodosByStatus = _updateTodoInState(currentTodo);
      updatedLoadingMap[todoId] = false;

      emit(
        state.copyWith(
          todosByStatus: revertedTodosByStatus,
          errorMessage:
              'Failed to reorder task: ${NetworkExceptions.getErrorMessage(e)}',
          isUpdatingTodos: updatedLoadingMap,
          status: TodosStatus.error,
        ),
      );
    } catch (e) {
      // Revert to original state on error
      final revertedTodosByStatus = _updateTodoInState(currentTodo);
      updatedLoadingMap[todoId] = false;

      emit(
        state.copyWith(
          todosByStatus: revertedTodosByStatus,
          errorMessage: 'Failed to reorder task: ${e.toString()}',
          isUpdatingTodos: updatedLoadingMap,
          status: TodosStatus.error,
        ),
      );
    }
  }

  /// Update both status and sort order (for cross-column moves)
  Future<void> _onUpdateTodoStatusAndSortOrder(
    String todoId,
    TodoStatus newStatus,
    int newSortOrder,
    Emitter<TodosState> emit,
  ) async {
    final currentTodo = _findTodoById(todoId);
    if (currentTodo == null) return;

    // Skip if nothing has changed
    if (currentTodo.status == newStatus &&
        currentTodo.sortOrder == newSortOrder) {
      return;
    }

    // Set loading state for visual feedback
    final updatedLoadingMap = Map<String, bool>.from(state.isUpdatingTodos);
    updatedLoadingMap[todoId] = true;

    // Optimistically update the UI
    final optimisticTodo = currentTodo.copyWith(
      status: newStatus,
      sortOrder: newSortOrder,
      updatedAt: DateTime.now(),
    );
    final optimisticTodosByStatus = _updateTodoInState(optimisticTodo);

    emit(
      state.copyWith(
        todosByStatus: optimisticTodosByStatus,
        isUpdatingTodos: updatedLoadingMap,
        errorMessage: null,
      ),
    );

    try {
      // Call the API to update both status and sort order
      await _todoRepository.updateTodo(todoId, {
        'status': newStatus.apiValue,
        'sort_order': newSortOrder,
        'updated_at': DateTime.now().toIso8601String(),
      });

      // Clear loading state
      updatedLoadingMap[todoId] = false;

      // Refetch data to ensure consistency
      if (state.currentProjectId != null) {
        emit(state.copyWith(isUpdatingTodos: updatedLoadingMap));

        final freshTodosByStatus = await _getProjectTodosUseCase(
          state.currentProjectId!,
          includeCompleted: true,
        );

        emit(
          state.copyWith(
            todosByStatus: freshTodosByStatus,
            isUpdatingTodos: updatedLoadingMap,
            errorMessage: null,
            status: TodosStatus.loaded,
          ),
        );

        // Show success feedback
        emit(
          state.copyWith(
            status: TodosStatus.updating,
            errorMessage: 'Task moved successfully!',
          ),
        );

        // Reset status after brief delay
        await Future.delayed(const Duration(milliseconds: 800));
        if (!emit.isDone) {
          emit(state.copyWith(status: TodosStatus.loaded, errorMessage: null));
        }
      } else {
        emit(
          state.copyWith(
            isUpdatingTodos: updatedLoadingMap,
            errorMessage: null,
          ),
        );
      }
    } on NetworkExceptions catch (e) {
      // Revert to original state on error
      final revertedTodosByStatus = _updateTodoInState(currentTodo);
      updatedLoadingMap[todoId] = false;

      emit(
        state.copyWith(
          todosByStatus: revertedTodosByStatus,
          errorMessage:
              'Failed to move task: ${NetworkExceptions.getErrorMessage(e)}',
          isUpdatingTodos: updatedLoadingMap,
          status: TodosStatus.error,
        ),
      );
    } catch (e) {
      // Revert to original state on error
      final revertedTodosByStatus = _updateTodoInState(currentTodo);
      updatedLoadingMap[todoId] = false;

      emit(
        state.copyWith(
          todosByStatus: revertedTodosByStatus,
          errorMessage: 'Failed to move task: ${e.toString()}',
          isUpdatingTodos: updatedLoadingMap,
          status: TodosStatus.error,
        ),
      );
    }
  }

  /// Toggle todo completion
  Future<void> _onToggleTodoCompletion(
    String todoId,
    Emitter<TodosState> emit,
  ) async {
    try {
      final updatedTodo = await _updateTodoStatusUseCase.toggleCompletion(
        todoId,
      );
      final updatedTodosByStatus = _updateTodoInState(updatedTodo);

      emit(
        state.copyWith(todosByStatus: updatedTodosByStatus, errorMessage: null),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to toggle completion: ${e.toString()}',
        ),
      );
    }
  }

  /// Toggle todo pin status
  Future<void> _onToggleTodoPin(String todoId, Emitter<TodosState> emit) async {
    try {
      // Find current todo to get current pin status
      final currentTodo = _findTodoById(todoId);
      if (currentTodo == null) return;

      final updatedTodo = await _todoRepository.pinTodo(
        todoId,
        !currentTodo.isPinned,
      );
      final updatedTodosByStatus = _updateTodoInState(updatedTodo);

      emit(
        state.copyWith(todosByStatus: updatedTodosByStatus, errorMessage: null),
      );
    } catch (e) {
      emit(
        state.copyWith(errorMessage: 'Failed to toggle pin: ${e.toString()}'),
      );
    }
  }

  /// Update todo details
  Future<void> _onUpdateTodo(
    String todoId,
    Map<String, dynamic> updates,
    Emitter<TodosState> emit,
  ) async {
    try {
      final updatedTodo = await _todoRepository.updateTodo(todoId, updates);
      final updatedTodosByStatus = _updateTodoInState(updatedTodo);

      emit(
        state.copyWith(todosByStatus: updatedTodosByStatus, errorMessage: null),
      );
    } catch (e) {
      emit(
        state.copyWith(errorMessage: 'Failed to update todo: ${e.toString()}'),
      );
    }
  }

  /// Delete a todo
  Future<void> _onDeleteTodo(String todoId, Emitter<TodosState> emit) async {
    try {
      await _todoRepository.deleteTodo(todoId);

      // Remove todo from state
      final updatedTodosByStatus = Map<TodoStatus, List<Todo>>.from(
        state.todosByStatus,
      );
      for (final status in updatedTodosByStatus.keys) {
        updatedTodosByStatus[status] = updatedTodosByStatus[status]!
            .where((todo) => todo.id != todoId)
            .toList();
      }

      // Remove subtasks for this todo
      final updatedSubtasks = Map<String, List<Subtask>>.from(
        state.subtasksByTodoId,
      );
      updatedSubtasks.remove(todoId);

      emit(
        state.copyWith(
          todosByStatus: updatedTodosByStatus,
          subtasksByTodoId: updatedSubtasks,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(errorMessage: 'Failed to delete todo: ${e.toString()}'),
      );
    }
  }

  /// Search todos
  Future<void> _onSearchTodos(String query, Emitter<TodosState> emit) async {
    if (query.trim().isEmpty) {
      emit(state.copyWith(searchQuery: null, searchResults: []));
      return;
    }

    try {
      final searchResults = await _todoRepository.searchTodos(query: query);

      emit(
        state.copyWith(
          searchQuery: query,
          searchResults: searchResults,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(errorMessage: 'Failed to search todos: ${e.toString()}'),
      );
    }
  }

  /// Clear search
  Future<void> _onClearSearch(Emitter<TodosState> emit) async {
    emit(state.copyWith(searchQuery: null, searchResults: []));
  }

  /// Load subtasks for a todo
  Future<void> _onLoadSubtasks(String todoId, Emitter<TodosState> emit) async {
    final updatedLoadingMap = Map<String, bool>.from(state.isLoadingSubtasks);
    updatedLoadingMap[todoId] = true;
    emit(state.copyWith(isLoadingSubtasks: updatedLoadingMap));

    try {
      final subtasks = await _todoRepository.getSubtasks(todoId);

      final updatedSubtasks = Map<String, List<Subtask>>.from(
        state.subtasksByTodoId,
      );
      updatedSubtasks[todoId] = subtasks;

      updatedLoadingMap[todoId] = false;

      emit(
        state.copyWith(
          subtasksByTodoId: updatedSubtasks,
          isLoadingSubtasks: updatedLoadingMap,
          errorMessage: null,
        ),
      );
    } catch (e) {
      updatedLoadingMap[todoId] = false;
      emit(
        state.copyWith(
          errorMessage: 'Failed to load subtasks: ${e.toString()}',
          isLoadingSubtasks: updatedLoadingMap,
        ),
      );
    }
  }

  /// Create a new subtask
  Future<void> _onCreateSubtask(
    String todoId,
    CreateSubtaskRequest request,
    Emitter<TodosState> emit,
  ) async {
    // Set loading state for the specific todo
    final updatedLoadingMap = Map<String, bool>.from(state.isLoadingSubtasks);
    updatedLoadingMap[todoId] = true;

    emit(
      state.copyWith(isLoadingSubtasks: updatedLoadingMap, errorMessage: null),
    );

    try {
      final newSubtask = await _createSubtaskUseCase(todoId, request);

      // Clear loading state
      updatedLoadingMap[todoId] = false;

      // Dynamically refetch all todos to get updated data including subtasks
      if (state.currentProjectId != null) {
        final freshTodosByStatus = await _getProjectTodosUseCase(
          state.currentProjectId!,
          includeCompleted: true,
        );

        emit(
          state.copyWith(
            todosByStatus: freshTodosByStatus,
            isLoadingSubtasks: updatedLoadingMap,
            status: TodosStatus.loaded,
            errorMessage: null,
          ),
        );

        // Show success feedback
        emit(
          state.copyWith(
            status: TodosStatus.updating,
            errorMessage: 'Subtask created successfully!',
          ),
        );

        // Reset status after brief delay
        await Future.delayed(const Duration(milliseconds: 1000));
        if (!emit.isDone) {
          emit(state.copyWith(status: TodosStatus.loaded, errorMessage: null));
        }
      } else {
        // Fallback: Add subtask to state if no project ID
        final updatedSubtasks = Map<String, List<Subtask>>.from(
          state.subtasksByTodoId,
        );
        final todoSubtasks = List<Subtask>.from(updatedSubtasks[todoId] ?? []);
        todoSubtasks.insert(0, newSubtask);
        updatedSubtasks[todoId] = todoSubtasks;

        emit(
          state.copyWith(
            subtasksByTodoId: updatedSubtasks,
            isLoadingSubtasks: updatedLoadingMap,
          ),
        );
      }
    } on NetworkExceptions catch (e) {
      updatedLoadingMap[todoId] = false;
      emit(
        state.copyWith(
          isLoadingSubtasks: updatedLoadingMap,
          status: TodosStatus.error,
          errorMessage:
              'Failed to create subtask: ${NetworkExceptions.getErrorMessage(e)}',
        ),
      );

      // Reset error status after delay
      await Future.delayed(const Duration(seconds: 3));
      if (!emit.isDone) {
        emit(state.copyWith(status: TodosStatus.loaded, errorMessage: null));
      }
    } catch (e) {
      updatedLoadingMap[todoId] = false;
      String errorMessage = 'Failed to create subtask';

      if (e is ArgumentError) {
        errorMessage = e.message;
      }

      emit(
        state.copyWith(
          errorMessage: errorMessage,
          isLoadingSubtasks: updatedLoadingMap,
          status: TodosStatus.error,
        ),
      );

      // Reset error status after delay
      await Future.delayed(const Duration(seconds: 3));
      if (!emit.isDone) {
        emit(state.copyWith(status: TodosStatus.loaded, errorMessage: null));
      }
    }
  }

  /// Update subtask status
  Future<void> _onUpdateSubtaskStatus(
    String subtaskId,
    TodoStatus newStatus,
    Emitter<TodosState> emit,
  ) async {
    final updatedLoadingMap = Map<String, bool>.from(state.isUpdatingSubtasks);
    updatedLoadingMap[subtaskId] = true;
    emit(state.copyWith(isUpdatingSubtasks: updatedLoadingMap));

    try {
      final updatedSubtask = await _todoRepository.updateSubtask(subtaskId, {
        'status': newStatus.apiValue,
      });

      // Update subtask in state
      final updatedSubtasks = _updateSubtaskInState(updatedSubtask);
      updatedLoadingMap[subtaskId] = false;

      emit(
        state.copyWith(
          subtasksByTodoId: updatedSubtasks,
          isUpdatingSubtasks: updatedLoadingMap,
          errorMessage: null,
        ),
      );
    } catch (e) {
      updatedLoadingMap[subtaskId] = false;
      emit(
        state.copyWith(
          errorMessage: 'Failed to update subtask: ${e.toString()}',
          isUpdatingSubtasks: updatedLoadingMap,
        ),
      );
    }
  }

  /// Toggle subtask completion
  Future<void> _onToggleSubtaskCompletion(
    String subtaskId,
    Emitter<TodosState> emit,
  ) async {
    try {
      // Find current subtask
      final currentSubtask = _findSubtaskById(subtaskId);
      if (currentSubtask == null) return;

      final newStatus = currentSubtask.isCompleted
          ? TodoStatus.todo
          : TodoStatus.completed;
      final updatedSubtask = await _todoRepository.updateSubtask(subtaskId, {
        'status': newStatus.apiValue,
      });

      final updatedSubtasks = _updateSubtaskInState(updatedSubtask);

      emit(
        state.copyWith(subtasksByTodoId: updatedSubtasks, errorMessage: null),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to toggle subtask: ${e.toString()}',
        ),
      );
    }
  }

  /// Delete a subtask
  Future<void> _onDeleteSubtask(
    String subtaskId,
    Emitter<TodosState> emit,
  ) async {
    try {
      await _todoRepository.deleteSubtask(subtaskId);

      // Remove subtask from state
      final updatedSubtasks = Map<String, List<Subtask>>.from(
        state.subtasksByTodoId,
      );
      for (final todoId in updatedSubtasks.keys) {
        updatedSubtasks[todoId] = updatedSubtasks[todoId]!
            .where((subtask) => subtask.id != subtaskId)
            .toList();
      }

      emit(
        state.copyWith(subtasksByTodoId: updatedSubtasks, errorMessage: null),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to delete subtask: ${e.toString()}',
        ),
      );
    }
  }

  /// Reorder subtasks
  Future<void> _onReorderSubtasks(
    String todoId,
    List<String> subtaskIds,
    Emitter<TodosState> emit,
  ) async {
    try {
      await _todoRepository.reorderSubtasks(todoId, subtaskIds);

      // Update subtask order in state
      final updatedSubtasks = Map<String, List<Subtask>>.from(
        state.subtasksByTodoId,
      );
      final currentSubtasks = updatedSubtasks[todoId] ?? [];

      // Reorder based on provided IDs
      final reorderedSubtasks = <Subtask>[];
      for (final id in subtaskIds) {
        final subtask = currentSubtasks.firstWhere((s) => s.id == id);
        reorderedSubtasks.add(subtask);
      }

      updatedSubtasks[todoId] = reorderedSubtasks;

      emit(
        state.copyWith(subtasksByTodoId: updatedSubtasks, errorMessage: null),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to reorder subtasks: ${e.toString()}',
        ),
      );
    }
  }

  /// Helper method to update a todo in the state
  Map<TodoStatus, List<Todo>> _updateTodoInState(Todo updatedTodo) {
    final updatedTodosByStatus = Map<TodoStatus, List<Todo>>.from(
      state.todosByStatus,
    );

    // Remove todo from all status lists
    for (final status in updatedTodosByStatus.keys) {
      updatedTodosByStatus[status] = updatedTodosByStatus[status]!
          .where((todo) => todo.id != updatedTodo.id)
          .toList();
    }

    // Add updated todo to the correct status list
    final statusTodos = List<Todo>.from(
      updatedTodosByStatus[updatedTodo.status] ?? [],
    );
    statusTodos.add(updatedTodo);
    updatedTodosByStatus[updatedTodo.status] = statusTodos;

    return updatedTodosByStatus;
  }

  /// Helper method to update a subtask in the state
  Map<String, List<Subtask>> _updateSubtaskInState(Subtask updatedSubtask) {
    final updatedSubtasks = Map<String, List<Subtask>>.from(
      state.subtasksByTodoId,
    );

    for (final todoId in updatedSubtasks.keys) {
      final subtasks = updatedSubtasks[todoId]!;
      final index = subtasks.indexWhere((s) => s.id == updatedSubtask.id);
      if (index != -1) {
        final updatedList = List<Subtask>.from(subtasks);
        updatedList[index] = updatedSubtask;
        updatedSubtasks[todoId] = updatedList;
        break;
      }
    }

    return updatedSubtasks;
  }

  /// Helper method to find a todo by ID
  Todo? _findTodoById(String todoId) {
    for (final todos in state.todosByStatus.values) {
      for (final todo in todos) {
        if (todo.id == todoId) return todo;
      }
    }
    return null;
  }

  /// Helper method to find a subtask by ID
  Subtask? _findSubtaskById(String subtaskId) {
    for (final subtasks in state.subtasksByTodoId.values) {
      for (final subtask in subtasks) {
        if (subtask.id == subtaskId) return subtask;
      }
    }
    return null;
  }
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todos_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TodosEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodosEventCopyWith<$Res> {
  factory $TodosEventCopyWith(
    TodosEvent value,
    $Res Function(TodosEvent) then,
  ) = _$TodosEventCopyWithImpl<$Res, TodosEvent>;
}

/// @nodoc
class _$TodosEventCopyWithImpl<$Res, $Val extends TodosEvent>
    implements $TodosEventCopyWith<$Res> {
  _$TodosEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadProjectTodosImplCopyWith<$Res> {
  factory _$$LoadProjectTodosImplCopyWith(
    _$LoadProjectTodosImpl value,
    $Res Function(_$LoadProjectTodosImpl) then,
  ) = __$$LoadProjectTodosImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class __$$LoadProjectTodosImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$LoadProjectTodosImpl>
    implements _$$LoadProjectTodosImplCopyWith<$Res> {
  __$$LoadProjectTodosImplCopyWithImpl(
    _$LoadProjectTodosImpl _value,
    $Res Function(_$LoadProjectTodosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? projectId = null}) {
    return _then(
      _$LoadProjectTodosImpl(
        null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadProjectTodosImpl implements _LoadProjectTodos {
  const _$LoadProjectTodosImpl(this.projectId);

  @override
  final String projectId;

  @override
  String toString() {
    return 'TodosEvent.loadProjectTodos(projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProjectTodosImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProjectTodosImplCopyWith<_$LoadProjectTodosImpl> get copyWith =>
      __$$LoadProjectTodosImplCopyWithImpl<_$LoadProjectTodosImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return loadProjectTodos(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return loadProjectTodos?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (loadProjectTodos != null) {
      return loadProjectTodos(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return loadProjectTodos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return loadProjectTodos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (loadProjectTodos != null) {
      return loadProjectTodos(this);
    }
    return orElse();
  }
}

abstract class _LoadProjectTodos implements TodosEvent {
  const factory _LoadProjectTodos(final String projectId) =
      _$LoadProjectTodosImpl;

  String get projectId;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadProjectTodosImplCopyWith<_$LoadProjectTodosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshTodosImplCopyWith<$Res> {
  factory _$$RefreshTodosImplCopyWith(
    _$RefreshTodosImpl value,
    $Res Function(_$RefreshTodosImpl) then,
  ) = __$$RefreshTodosImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshTodosImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$RefreshTodosImpl>
    implements _$$RefreshTodosImplCopyWith<$Res> {
  __$$RefreshTodosImplCopyWithImpl(
    _$RefreshTodosImpl _value,
    $Res Function(_$RefreshTodosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshTodosImpl implements _RefreshTodos {
  const _$RefreshTodosImpl();

  @override
  String toString() {
    return 'TodosEvent.refreshTodos()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshTodosImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return refreshTodos();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return refreshTodos?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (refreshTodos != null) {
      return refreshTodos();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return refreshTodos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return refreshTodos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (refreshTodos != null) {
      return refreshTodos(this);
    }
    return orElse();
  }
}

abstract class _RefreshTodos implements TodosEvent {
  const factory _RefreshTodos() = _$RefreshTodosImpl;
}

/// @nodoc
abstract class _$$CreateTodoImplCopyWith<$Res> {
  factory _$$CreateTodoImplCopyWith(
    _$CreateTodoImpl value,
    $Res Function(_$CreateTodoImpl) then,
  ) = __$$CreateTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateTodoRequest request});
}

/// @nodoc
class __$$CreateTodoImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$CreateTodoImpl>
    implements _$$CreateTodoImplCopyWith<$Res> {
  __$$CreateTodoImplCopyWithImpl(
    _$CreateTodoImpl _value,
    $Res Function(_$CreateTodoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? request = null}) {
    return _then(
      _$CreateTodoImpl(
        null == request
            ? _value.request
            : request // ignore: cast_nullable_to_non_nullable
                  as CreateTodoRequest,
      ),
    );
  }
}

/// @nodoc

class _$CreateTodoImpl implements _CreateTodo {
  const _$CreateTodoImpl(this.request);

  @override
  final CreateTodoRequest request;

  @override
  String toString() {
    return 'TodosEvent.createTodo(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTodoImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTodoImplCopyWith<_$CreateTodoImpl> get copyWith =>
      __$$CreateTodoImplCopyWithImpl<_$CreateTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return createTodo(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return createTodo?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (createTodo != null) {
      return createTodo(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return createTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return createTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (createTodo != null) {
      return createTodo(this);
    }
    return orElse();
  }
}

abstract class _CreateTodo implements TodosEvent {
  const factory _CreateTodo(final CreateTodoRequest request) = _$CreateTodoImpl;

  CreateTodoRequest get request;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTodoImplCopyWith<_$CreateTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTodoStatusImplCopyWith<$Res> {
  factory _$$UpdateTodoStatusImplCopyWith(
    _$UpdateTodoStatusImpl value,
    $Res Function(_$UpdateTodoStatusImpl) then,
  ) = __$$UpdateTodoStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId, TodoStatus newStatus});
}

/// @nodoc
class __$$UpdateTodoStatusImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$UpdateTodoStatusImpl>
    implements _$$UpdateTodoStatusImplCopyWith<$Res> {
  __$$UpdateTodoStatusImplCopyWithImpl(
    _$UpdateTodoStatusImpl _value,
    $Res Function(_$UpdateTodoStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null, Object? newStatus = null}) {
    return _then(
      _$UpdateTodoStatusImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == newStatus
            ? _value.newStatus
            : newStatus // ignore: cast_nullable_to_non_nullable
                  as TodoStatus,
      ),
    );
  }
}

/// @nodoc

class _$UpdateTodoStatusImpl implements _UpdateTodoStatus {
  const _$UpdateTodoStatusImpl(this.todoId, this.newStatus);

  @override
  final String todoId;
  @override
  final TodoStatus newStatus;

  @override
  String toString() {
    return 'TodosEvent.updateTodoStatus(todoId: $todoId, newStatus: $newStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTodoStatusImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.newStatus, newStatus) ||
                other.newStatus == newStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId, newStatus);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTodoStatusImplCopyWith<_$UpdateTodoStatusImpl> get copyWith =>
      __$$UpdateTodoStatusImplCopyWithImpl<_$UpdateTodoStatusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return updateTodoStatus(todoId, newStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return updateTodoStatus?.call(todoId, newStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (updateTodoStatus != null) {
      return updateTodoStatus(todoId, newStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return updateTodoStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return updateTodoStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (updateTodoStatus != null) {
      return updateTodoStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateTodoStatus implements TodosEvent {
  const factory _UpdateTodoStatus(
    final String todoId,
    final TodoStatus newStatus,
  ) = _$UpdateTodoStatusImpl;

  String get todoId;
  TodoStatus get newStatus;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTodoStatusImplCopyWith<_$UpdateTodoStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTodoSortOrderImplCopyWith<$Res> {
  factory _$$UpdateTodoSortOrderImplCopyWith(
    _$UpdateTodoSortOrderImpl value,
    $Res Function(_$UpdateTodoSortOrderImpl) then,
  ) = __$$UpdateTodoSortOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId, int newSortOrder});
}

/// @nodoc
class __$$UpdateTodoSortOrderImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$UpdateTodoSortOrderImpl>
    implements _$$UpdateTodoSortOrderImplCopyWith<$Res> {
  __$$UpdateTodoSortOrderImplCopyWithImpl(
    _$UpdateTodoSortOrderImpl _value,
    $Res Function(_$UpdateTodoSortOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null, Object? newSortOrder = null}) {
    return _then(
      _$UpdateTodoSortOrderImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == newSortOrder
            ? _value.newSortOrder
            : newSortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$UpdateTodoSortOrderImpl implements _UpdateTodoSortOrder {
  const _$UpdateTodoSortOrderImpl(this.todoId, this.newSortOrder);

  @override
  final String todoId;
  @override
  final int newSortOrder;

  @override
  String toString() {
    return 'TodosEvent.updateTodoSortOrder(todoId: $todoId, newSortOrder: $newSortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTodoSortOrderImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.newSortOrder, newSortOrder) ||
                other.newSortOrder == newSortOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId, newSortOrder);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTodoSortOrderImplCopyWith<_$UpdateTodoSortOrderImpl> get copyWith =>
      __$$UpdateTodoSortOrderImplCopyWithImpl<_$UpdateTodoSortOrderImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return updateTodoSortOrder(todoId, newSortOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return updateTodoSortOrder?.call(todoId, newSortOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (updateTodoSortOrder != null) {
      return updateTodoSortOrder(todoId, newSortOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return updateTodoSortOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return updateTodoSortOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (updateTodoSortOrder != null) {
      return updateTodoSortOrder(this);
    }
    return orElse();
  }
}

abstract class _UpdateTodoSortOrder implements TodosEvent {
  const factory _UpdateTodoSortOrder(
    final String todoId,
    final int newSortOrder,
  ) = _$UpdateTodoSortOrderImpl;

  String get todoId;
  int get newSortOrder;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTodoSortOrderImplCopyWith<_$UpdateTodoSortOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTodoStatusAndSortOrderImplCopyWith<$Res> {
  factory _$$UpdateTodoStatusAndSortOrderImplCopyWith(
    _$UpdateTodoStatusAndSortOrderImpl value,
    $Res Function(_$UpdateTodoStatusAndSortOrderImpl) then,
  ) = __$$UpdateTodoStatusAndSortOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId, TodoStatus newStatus, int newSortOrder});
}

/// @nodoc
class __$$UpdateTodoStatusAndSortOrderImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$UpdateTodoStatusAndSortOrderImpl>
    implements _$$UpdateTodoStatusAndSortOrderImplCopyWith<$Res> {
  __$$UpdateTodoStatusAndSortOrderImplCopyWithImpl(
    _$UpdateTodoStatusAndSortOrderImpl _value,
    $Res Function(_$UpdateTodoStatusAndSortOrderImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
    Object? newStatus = null,
    Object? newSortOrder = null,
  }) {
    return _then(
      _$UpdateTodoStatusAndSortOrderImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == newStatus
            ? _value.newStatus
            : newStatus // ignore: cast_nullable_to_non_nullable
                  as TodoStatus,
        null == newSortOrder
            ? _value.newSortOrder
            : newSortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$UpdateTodoStatusAndSortOrderImpl
    implements _UpdateTodoStatusAndSortOrder {
  const _$UpdateTodoStatusAndSortOrderImpl(
    this.todoId,
    this.newStatus,
    this.newSortOrder,
  );

  @override
  final String todoId;
  @override
  final TodoStatus newStatus;
  @override
  final int newSortOrder;

  @override
  String toString() {
    return 'TodosEvent.updateTodoStatusAndSortOrder(todoId: $todoId, newStatus: $newStatus, newSortOrder: $newSortOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTodoStatusAndSortOrderImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.newStatus, newStatus) ||
                other.newStatus == newStatus) &&
            (identical(other.newSortOrder, newSortOrder) ||
                other.newSortOrder == newSortOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId, newStatus, newSortOrder);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTodoStatusAndSortOrderImplCopyWith<
    _$UpdateTodoStatusAndSortOrderImpl
  >
  get copyWith =>
      __$$UpdateTodoStatusAndSortOrderImplCopyWithImpl<
        _$UpdateTodoStatusAndSortOrderImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return updateTodoStatusAndSortOrder(todoId, newStatus, newSortOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return updateTodoStatusAndSortOrder?.call(todoId, newStatus, newSortOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (updateTodoStatusAndSortOrder != null) {
      return updateTodoStatusAndSortOrder(todoId, newStatus, newSortOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return updateTodoStatusAndSortOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return updateTodoStatusAndSortOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (updateTodoStatusAndSortOrder != null) {
      return updateTodoStatusAndSortOrder(this);
    }
    return orElse();
  }
}

abstract class _UpdateTodoStatusAndSortOrder implements TodosEvent {
  const factory _UpdateTodoStatusAndSortOrder(
    final String todoId,
    final TodoStatus newStatus,
    final int newSortOrder,
  ) = _$UpdateTodoStatusAndSortOrderImpl;

  String get todoId;
  TodoStatus get newStatus;
  int get newSortOrder;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTodoStatusAndSortOrderImplCopyWith<
    _$UpdateTodoStatusAndSortOrderImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleTodoCompletionImplCopyWith<$Res> {
  factory _$$ToggleTodoCompletionImplCopyWith(
    _$ToggleTodoCompletionImpl value,
    $Res Function(_$ToggleTodoCompletionImpl) then,
  ) = __$$ToggleTodoCompletionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId});
}

/// @nodoc
class __$$ToggleTodoCompletionImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$ToggleTodoCompletionImpl>
    implements _$$ToggleTodoCompletionImplCopyWith<$Res> {
  __$$ToggleTodoCompletionImplCopyWithImpl(
    _$ToggleTodoCompletionImpl _value,
    $Res Function(_$ToggleTodoCompletionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null}) {
    return _then(
      _$ToggleTodoCompletionImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ToggleTodoCompletionImpl implements _ToggleTodoCompletion {
  const _$ToggleTodoCompletionImpl(this.todoId);

  @override
  final String todoId;

  @override
  String toString() {
    return 'TodosEvent.toggleTodoCompletion(todoId: $todoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleTodoCompletionImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleTodoCompletionImplCopyWith<_$ToggleTodoCompletionImpl>
  get copyWith =>
      __$$ToggleTodoCompletionImplCopyWithImpl<_$ToggleTodoCompletionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return toggleTodoCompletion(todoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return toggleTodoCompletion?.call(todoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (toggleTodoCompletion != null) {
      return toggleTodoCompletion(todoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return toggleTodoCompletion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return toggleTodoCompletion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (toggleTodoCompletion != null) {
      return toggleTodoCompletion(this);
    }
    return orElse();
  }
}

abstract class _ToggleTodoCompletion implements TodosEvent {
  const factory _ToggleTodoCompletion(final String todoId) =
      _$ToggleTodoCompletionImpl;

  String get todoId;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleTodoCompletionImplCopyWith<_$ToggleTodoCompletionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleTodoPinImplCopyWith<$Res> {
  factory _$$ToggleTodoPinImplCopyWith(
    _$ToggleTodoPinImpl value,
    $Res Function(_$ToggleTodoPinImpl) then,
  ) = __$$ToggleTodoPinImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId});
}

/// @nodoc
class __$$ToggleTodoPinImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$ToggleTodoPinImpl>
    implements _$$ToggleTodoPinImplCopyWith<$Res> {
  __$$ToggleTodoPinImplCopyWithImpl(
    _$ToggleTodoPinImpl _value,
    $Res Function(_$ToggleTodoPinImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null}) {
    return _then(
      _$ToggleTodoPinImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ToggleTodoPinImpl implements _ToggleTodoPin {
  const _$ToggleTodoPinImpl(this.todoId);

  @override
  final String todoId;

  @override
  String toString() {
    return 'TodosEvent.toggleTodoPin(todoId: $todoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleTodoPinImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleTodoPinImplCopyWith<_$ToggleTodoPinImpl> get copyWith =>
      __$$ToggleTodoPinImplCopyWithImpl<_$ToggleTodoPinImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return toggleTodoPin(todoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return toggleTodoPin?.call(todoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (toggleTodoPin != null) {
      return toggleTodoPin(todoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return toggleTodoPin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return toggleTodoPin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (toggleTodoPin != null) {
      return toggleTodoPin(this);
    }
    return orElse();
  }
}

abstract class _ToggleTodoPin implements TodosEvent {
  const factory _ToggleTodoPin(final String todoId) = _$ToggleTodoPinImpl;

  String get todoId;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleTodoPinImplCopyWith<_$ToggleTodoPinImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTodoImplCopyWith<$Res> {
  factory _$$UpdateTodoImplCopyWith(
    _$UpdateTodoImpl value,
    $Res Function(_$UpdateTodoImpl) then,
  ) = __$$UpdateTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId, Map<String, dynamic> updates});
}

/// @nodoc
class __$$UpdateTodoImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$UpdateTodoImpl>
    implements _$$UpdateTodoImplCopyWith<$Res> {
  __$$UpdateTodoImplCopyWithImpl(
    _$UpdateTodoImpl _value,
    $Res Function(_$UpdateTodoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null, Object? updates = null}) {
    return _then(
      _$UpdateTodoImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == updates
            ? _value._updates
            : updates // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$UpdateTodoImpl implements _UpdateTodo {
  const _$UpdateTodoImpl(this.todoId, final Map<String, dynamic> updates)
    : _updates = updates;

  @override
  final String todoId;
  final Map<String, dynamic> _updates;
  @override
  Map<String, dynamic> get updates {
    if (_updates is EqualUnmodifiableMapView) return _updates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_updates);
  }

  @override
  String toString() {
    return 'TodosEvent.updateTodo(todoId: $todoId, updates: $updates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTodoImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            const DeepCollectionEquality().equals(other._updates, _updates));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    todoId,
    const DeepCollectionEquality().hash(_updates),
  );

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTodoImplCopyWith<_$UpdateTodoImpl> get copyWith =>
      __$$UpdateTodoImplCopyWithImpl<_$UpdateTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return updateTodo(todoId, updates);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return updateTodo?.call(todoId, updates);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (updateTodo != null) {
      return updateTodo(todoId, updates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return updateTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return updateTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (updateTodo != null) {
      return updateTodo(this);
    }
    return orElse();
  }
}

abstract class _UpdateTodo implements TodosEvent {
  const factory _UpdateTodo(
    final String todoId,
    final Map<String, dynamic> updates,
  ) = _$UpdateTodoImpl;

  String get todoId;
  Map<String, dynamic> get updates;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTodoImplCopyWith<_$UpdateTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTodoImplCopyWith<$Res> {
  factory _$$DeleteTodoImplCopyWith(
    _$DeleteTodoImpl value,
    $Res Function(_$DeleteTodoImpl) then,
  ) = __$$DeleteTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId});
}

/// @nodoc
class __$$DeleteTodoImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$DeleteTodoImpl>
    implements _$$DeleteTodoImplCopyWith<$Res> {
  __$$DeleteTodoImplCopyWithImpl(
    _$DeleteTodoImpl _value,
    $Res Function(_$DeleteTodoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null}) {
    return _then(
      _$DeleteTodoImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteTodoImpl implements _DeleteTodo {
  const _$DeleteTodoImpl(this.todoId);

  @override
  final String todoId;

  @override
  String toString() {
    return 'TodosEvent.deleteTodo(todoId: $todoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTodoImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTodoImplCopyWith<_$DeleteTodoImpl> get copyWith =>
      __$$DeleteTodoImplCopyWithImpl<_$DeleteTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return deleteTodo(todoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return deleteTodo?.call(todoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (deleteTodo != null) {
      return deleteTodo(todoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return deleteTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return deleteTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (deleteTodo != null) {
      return deleteTodo(this);
    }
    return orElse();
  }
}

abstract class _DeleteTodo implements TodosEvent {
  const factory _DeleteTodo(final String todoId) = _$DeleteTodoImpl;

  String get todoId;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteTodoImplCopyWith<_$DeleteTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchTodosImplCopyWith<$Res> {
  factory _$$SearchTodosImplCopyWith(
    _$SearchTodosImpl value,
    $Res Function(_$SearchTodosImpl) then,
  ) = __$$SearchTodosImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchTodosImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$SearchTodosImpl>
    implements _$$SearchTodosImplCopyWith<$Res> {
  __$$SearchTodosImplCopyWithImpl(
    _$SearchTodosImpl _value,
    $Res Function(_$SearchTodosImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null}) {
    return _then(
      _$SearchTodosImpl(
        null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchTodosImpl implements _SearchTodos {
  const _$SearchTodosImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'TodosEvent.searchTodos(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTodosImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTodosImplCopyWith<_$SearchTodosImpl> get copyWith =>
      __$$SearchTodosImplCopyWithImpl<_$SearchTodosImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return searchTodos(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return searchTodos?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (searchTodos != null) {
      return searchTodos(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return searchTodos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return searchTodos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (searchTodos != null) {
      return searchTodos(this);
    }
    return orElse();
  }
}

abstract class _SearchTodos implements TodosEvent {
  const factory _SearchTodos(final String query) = _$SearchTodosImpl;

  String get query;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchTodosImplCopyWith<_$SearchTodosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearSearchImplCopyWith<$Res> {
  factory _$$ClearSearchImplCopyWith(
    _$ClearSearchImpl value,
    $Res Function(_$ClearSearchImpl) then,
  ) = __$$ClearSearchImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearSearchImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$ClearSearchImpl>
    implements _$$ClearSearchImplCopyWith<$Res> {
  __$$ClearSearchImplCopyWithImpl(
    _$ClearSearchImpl _value,
    $Res Function(_$ClearSearchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearSearchImpl implements _ClearSearch {
  const _$ClearSearchImpl();

  @override
  String toString() {
    return 'TodosEvent.clearSearch()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearSearchImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return clearSearch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return clearSearch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return clearSearch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return clearSearch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (clearSearch != null) {
      return clearSearch(this);
    }
    return orElse();
  }
}

abstract class _ClearSearch implements TodosEvent {
  const factory _ClearSearch() = _$ClearSearchImpl;
}

/// @nodoc
abstract class _$$LoadSubtasksImplCopyWith<$Res> {
  factory _$$LoadSubtasksImplCopyWith(
    _$LoadSubtasksImpl value,
    $Res Function(_$LoadSubtasksImpl) then,
  ) = __$$LoadSubtasksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId});
}

/// @nodoc
class __$$LoadSubtasksImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$LoadSubtasksImpl>
    implements _$$LoadSubtasksImplCopyWith<$Res> {
  __$$LoadSubtasksImplCopyWithImpl(
    _$LoadSubtasksImpl _value,
    $Res Function(_$LoadSubtasksImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null}) {
    return _then(
      _$LoadSubtasksImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadSubtasksImpl implements _LoadSubtasks {
  const _$LoadSubtasksImpl(this.todoId);

  @override
  final String todoId;

  @override
  String toString() {
    return 'TodosEvent.loadSubtasks(todoId: $todoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSubtasksImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSubtasksImplCopyWith<_$LoadSubtasksImpl> get copyWith =>
      __$$LoadSubtasksImplCopyWithImpl<_$LoadSubtasksImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return loadSubtasks(todoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return loadSubtasks?.call(todoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (loadSubtasks != null) {
      return loadSubtasks(todoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return loadSubtasks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return loadSubtasks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (loadSubtasks != null) {
      return loadSubtasks(this);
    }
    return orElse();
  }
}

abstract class _LoadSubtasks implements TodosEvent {
  const factory _LoadSubtasks(final String todoId) = _$LoadSubtasksImpl;

  String get todoId;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSubtasksImplCopyWith<_$LoadSubtasksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateSubtaskImplCopyWith<$Res> {
  factory _$$CreateSubtaskImplCopyWith(
    _$CreateSubtaskImpl value,
    $Res Function(_$CreateSubtaskImpl) then,
  ) = __$$CreateSubtaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId, CreateSubtaskRequest request});
}

/// @nodoc
class __$$CreateSubtaskImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$CreateSubtaskImpl>
    implements _$$CreateSubtaskImplCopyWith<$Res> {
  __$$CreateSubtaskImplCopyWithImpl(
    _$CreateSubtaskImpl _value,
    $Res Function(_$CreateSubtaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null, Object? request = null}) {
    return _then(
      _$CreateSubtaskImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == request
            ? _value.request
            : request // ignore: cast_nullable_to_non_nullable
                  as CreateSubtaskRequest,
      ),
    );
  }
}

/// @nodoc

class _$CreateSubtaskImpl implements _CreateSubtask {
  const _$CreateSubtaskImpl(this.todoId, this.request);

  @override
  final String todoId;
  @override
  final CreateSubtaskRequest request;

  @override
  String toString() {
    return 'TodosEvent.createSubtask(todoId: $todoId, request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSubtaskImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId, request);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSubtaskImplCopyWith<_$CreateSubtaskImpl> get copyWith =>
      __$$CreateSubtaskImplCopyWithImpl<_$CreateSubtaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return createSubtask(todoId, request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return createSubtask?.call(todoId, request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (createSubtask != null) {
      return createSubtask(todoId, request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return createSubtask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return createSubtask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (createSubtask != null) {
      return createSubtask(this);
    }
    return orElse();
  }
}

abstract class _CreateSubtask implements TodosEvent {
  const factory _CreateSubtask(
    final String todoId,
    final CreateSubtaskRequest request,
  ) = _$CreateSubtaskImpl;

  String get todoId;
  CreateSubtaskRequest get request;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateSubtaskImplCopyWith<_$CreateSubtaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSubtaskStatusImplCopyWith<$Res> {
  factory _$$UpdateSubtaskStatusImplCopyWith(
    _$UpdateSubtaskStatusImpl value,
    $Res Function(_$UpdateSubtaskStatusImpl) then,
  ) = __$$UpdateSubtaskStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String subtaskId, TodoStatus newStatus});
}

/// @nodoc
class __$$UpdateSubtaskStatusImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$UpdateSubtaskStatusImpl>
    implements _$$UpdateSubtaskStatusImplCopyWith<$Res> {
  __$$UpdateSubtaskStatusImplCopyWithImpl(
    _$UpdateSubtaskStatusImpl _value,
    $Res Function(_$UpdateSubtaskStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? subtaskId = null, Object? newStatus = null}) {
    return _then(
      _$UpdateSubtaskStatusImpl(
        null == subtaskId
            ? _value.subtaskId
            : subtaskId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == newStatus
            ? _value.newStatus
            : newStatus // ignore: cast_nullable_to_non_nullable
                  as TodoStatus,
      ),
    );
  }
}

/// @nodoc

class _$UpdateSubtaskStatusImpl implements _UpdateSubtaskStatus {
  const _$UpdateSubtaskStatusImpl(this.subtaskId, this.newStatus);

  @override
  final String subtaskId;
  @override
  final TodoStatus newStatus;

  @override
  String toString() {
    return 'TodosEvent.updateSubtaskStatus(subtaskId: $subtaskId, newStatus: $newStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSubtaskStatusImpl &&
            (identical(other.subtaskId, subtaskId) ||
                other.subtaskId == subtaskId) &&
            (identical(other.newStatus, newStatus) ||
                other.newStatus == newStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subtaskId, newStatus);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSubtaskStatusImplCopyWith<_$UpdateSubtaskStatusImpl> get copyWith =>
      __$$UpdateSubtaskStatusImplCopyWithImpl<_$UpdateSubtaskStatusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return updateSubtaskStatus(subtaskId, newStatus);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return updateSubtaskStatus?.call(subtaskId, newStatus);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (updateSubtaskStatus != null) {
      return updateSubtaskStatus(subtaskId, newStatus);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return updateSubtaskStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return updateSubtaskStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (updateSubtaskStatus != null) {
      return updateSubtaskStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateSubtaskStatus implements TodosEvent {
  const factory _UpdateSubtaskStatus(
    final String subtaskId,
    final TodoStatus newStatus,
  ) = _$UpdateSubtaskStatusImpl;

  String get subtaskId;
  TodoStatus get newStatus;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSubtaskStatusImplCopyWith<_$UpdateSubtaskStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleSubtaskCompletionImplCopyWith<$Res> {
  factory _$$ToggleSubtaskCompletionImplCopyWith(
    _$ToggleSubtaskCompletionImpl value,
    $Res Function(_$ToggleSubtaskCompletionImpl) then,
  ) = __$$ToggleSubtaskCompletionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String subtaskId});
}

/// @nodoc
class __$$ToggleSubtaskCompletionImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$ToggleSubtaskCompletionImpl>
    implements _$$ToggleSubtaskCompletionImplCopyWith<$Res> {
  __$$ToggleSubtaskCompletionImplCopyWithImpl(
    _$ToggleSubtaskCompletionImpl _value,
    $Res Function(_$ToggleSubtaskCompletionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? subtaskId = null}) {
    return _then(
      _$ToggleSubtaskCompletionImpl(
        null == subtaskId
            ? _value.subtaskId
            : subtaskId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ToggleSubtaskCompletionImpl implements _ToggleSubtaskCompletion {
  const _$ToggleSubtaskCompletionImpl(this.subtaskId);

  @override
  final String subtaskId;

  @override
  String toString() {
    return 'TodosEvent.toggleSubtaskCompletion(subtaskId: $subtaskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSubtaskCompletionImpl &&
            (identical(other.subtaskId, subtaskId) ||
                other.subtaskId == subtaskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subtaskId);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSubtaskCompletionImplCopyWith<_$ToggleSubtaskCompletionImpl>
  get copyWith =>
      __$$ToggleSubtaskCompletionImplCopyWithImpl<
        _$ToggleSubtaskCompletionImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return toggleSubtaskCompletion(subtaskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return toggleSubtaskCompletion?.call(subtaskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (toggleSubtaskCompletion != null) {
      return toggleSubtaskCompletion(subtaskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return toggleSubtaskCompletion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return toggleSubtaskCompletion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (toggleSubtaskCompletion != null) {
      return toggleSubtaskCompletion(this);
    }
    return orElse();
  }
}

abstract class _ToggleSubtaskCompletion implements TodosEvent {
  const factory _ToggleSubtaskCompletion(final String subtaskId) =
      _$ToggleSubtaskCompletionImpl;

  String get subtaskId;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleSubtaskCompletionImplCopyWith<_$ToggleSubtaskCompletionImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSubtaskImplCopyWith<$Res> {
  factory _$$DeleteSubtaskImplCopyWith(
    _$DeleteSubtaskImpl value,
    $Res Function(_$DeleteSubtaskImpl) then,
  ) = __$$DeleteSubtaskImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String subtaskId});
}

/// @nodoc
class __$$DeleteSubtaskImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$DeleteSubtaskImpl>
    implements _$$DeleteSubtaskImplCopyWith<$Res> {
  __$$DeleteSubtaskImplCopyWithImpl(
    _$DeleteSubtaskImpl _value,
    $Res Function(_$DeleteSubtaskImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? subtaskId = null}) {
    return _then(
      _$DeleteSubtaskImpl(
        null == subtaskId
            ? _value.subtaskId
            : subtaskId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteSubtaskImpl implements _DeleteSubtask {
  const _$DeleteSubtaskImpl(this.subtaskId);

  @override
  final String subtaskId;

  @override
  String toString() {
    return 'TodosEvent.deleteSubtask(subtaskId: $subtaskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSubtaskImpl &&
            (identical(other.subtaskId, subtaskId) ||
                other.subtaskId == subtaskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subtaskId);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSubtaskImplCopyWith<_$DeleteSubtaskImpl> get copyWith =>
      __$$DeleteSubtaskImplCopyWithImpl<_$DeleteSubtaskImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return deleteSubtask(subtaskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return deleteSubtask?.call(subtaskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (deleteSubtask != null) {
      return deleteSubtask(subtaskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return deleteSubtask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return deleteSubtask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (deleteSubtask != null) {
      return deleteSubtask(this);
    }
    return orElse();
  }
}

abstract class _DeleteSubtask implements TodosEvent {
  const factory _DeleteSubtask(final String subtaskId) = _$DeleteSubtaskImpl;

  String get subtaskId;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteSubtaskImplCopyWith<_$DeleteSubtaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReorderSubtasksImplCopyWith<$Res> {
  factory _$$ReorderSubtasksImplCopyWith(
    _$ReorderSubtasksImpl value,
    $Res Function(_$ReorderSubtasksImpl) then,
  ) = __$$ReorderSubtasksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId, List<String> subtaskIds});
}

/// @nodoc
class __$$ReorderSubtasksImplCopyWithImpl<$Res>
    extends _$TodosEventCopyWithImpl<$Res, _$ReorderSubtasksImpl>
    implements _$$ReorderSubtasksImplCopyWith<$Res> {
  __$$ReorderSubtasksImplCopyWithImpl(
    _$ReorderSubtasksImpl _value,
    $Res Function(_$ReorderSubtasksImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null, Object? subtaskIds = null}) {
    return _then(
      _$ReorderSubtasksImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == subtaskIds
            ? _value._subtaskIds
            : subtaskIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$ReorderSubtasksImpl implements _ReorderSubtasks {
  const _$ReorderSubtasksImpl(this.todoId, final List<String> subtaskIds)
    : _subtaskIds = subtaskIds;

  @override
  final String todoId;
  final List<String> _subtaskIds;
  @override
  List<String> get subtaskIds {
    if (_subtaskIds is EqualUnmodifiableListView) return _subtaskIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subtaskIds);
  }

  @override
  String toString() {
    return 'TodosEvent.reorderSubtasks(todoId: $todoId, subtaskIds: $subtaskIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReorderSubtasksImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            const DeepCollectionEquality().equals(
              other._subtaskIds,
              _subtaskIds,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    todoId,
    const DeepCollectionEquality().hash(_subtaskIds),
  );

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReorderSubtasksImplCopyWith<_$ReorderSubtasksImpl> get copyWith =>
      __$$ReorderSubtasksImplCopyWithImpl<_$ReorderSubtasksImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String projectId) loadProjectTodos,
    required TResult Function() refreshTodos,
    required TResult Function(CreateTodoRequest request) createTodo,
    required TResult Function(String todoId, TodoStatus newStatus)
    updateTodoStatus,
    required TResult Function(String todoId, int newSortOrder)
    updateTodoSortOrder,
    required TResult Function(
      String todoId,
      TodoStatus newStatus,
      int newSortOrder,
    )
    updateTodoStatusAndSortOrder,
    required TResult Function(String todoId) toggleTodoCompletion,
    required TResult Function(String todoId) toggleTodoPin,
    required TResult Function(String todoId, Map<String, dynamic> updates)
    updateTodo,
    required TResult Function(String todoId) deleteTodo,
    required TResult Function(String query) searchTodos,
    required TResult Function() clearSearch,
    required TResult Function(String todoId) loadSubtasks,
    required TResult Function(String todoId, CreateSubtaskRequest request)
    createSubtask,
    required TResult Function(String subtaskId, TodoStatus newStatus)
    updateSubtaskStatus,
    required TResult Function(String subtaskId) toggleSubtaskCompletion,
    required TResult Function(String subtaskId) deleteSubtask,
    required TResult Function(String todoId, List<String> subtaskIds)
    reorderSubtasks,
  }) {
    return reorderSubtasks(todoId, subtaskIds);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String projectId)? loadProjectTodos,
    TResult? Function()? refreshTodos,
    TResult? Function(CreateTodoRequest request)? createTodo,
    TResult? Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult? Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult? Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult? Function(String todoId)? toggleTodoCompletion,
    TResult? Function(String todoId)? toggleTodoPin,
    TResult? Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult? Function(String todoId)? deleteTodo,
    TResult? Function(String query)? searchTodos,
    TResult? Function()? clearSearch,
    TResult? Function(String todoId)? loadSubtasks,
    TResult? Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult? Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult? Function(String subtaskId)? toggleSubtaskCompletion,
    TResult? Function(String subtaskId)? deleteSubtask,
    TResult? Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
  }) {
    return reorderSubtasks?.call(todoId, subtaskIds);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String projectId)? loadProjectTodos,
    TResult Function()? refreshTodos,
    TResult Function(CreateTodoRequest request)? createTodo,
    TResult Function(String todoId, TodoStatus newStatus)? updateTodoStatus,
    TResult Function(String todoId, int newSortOrder)? updateTodoSortOrder,
    TResult Function(String todoId, TodoStatus newStatus, int newSortOrder)?
    updateTodoStatusAndSortOrder,
    TResult Function(String todoId)? toggleTodoCompletion,
    TResult Function(String todoId)? toggleTodoPin,
    TResult Function(String todoId, Map<String, dynamic> updates)? updateTodo,
    TResult Function(String todoId)? deleteTodo,
    TResult Function(String query)? searchTodos,
    TResult Function()? clearSearch,
    TResult Function(String todoId)? loadSubtasks,
    TResult Function(String todoId, CreateSubtaskRequest request)?
    createSubtask,
    TResult Function(String subtaskId, TodoStatus newStatus)?
    updateSubtaskStatus,
    TResult Function(String subtaskId)? toggleSubtaskCompletion,
    TResult Function(String subtaskId)? deleteSubtask,
    TResult Function(String todoId, List<String> subtaskIds)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (reorderSubtasks != null) {
      return reorderSubtasks(todoId, subtaskIds);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadProjectTodos value) loadProjectTodos,
    required TResult Function(_RefreshTodos value) refreshTodos,
    required TResult Function(_CreateTodo value) createTodo,
    required TResult Function(_UpdateTodoStatus value) updateTodoStatus,
    required TResult Function(_UpdateTodoSortOrder value) updateTodoSortOrder,
    required TResult Function(_UpdateTodoStatusAndSortOrder value)
    updateTodoStatusAndSortOrder,
    required TResult Function(_ToggleTodoCompletion value) toggleTodoCompletion,
    required TResult Function(_ToggleTodoPin value) toggleTodoPin,
    required TResult Function(_UpdateTodo value) updateTodo,
    required TResult Function(_DeleteTodo value) deleteTodo,
    required TResult Function(_SearchTodos value) searchTodos,
    required TResult Function(_ClearSearch value) clearSearch,
    required TResult Function(_LoadSubtasks value) loadSubtasks,
    required TResult Function(_CreateSubtask value) createSubtask,
    required TResult Function(_UpdateSubtaskStatus value) updateSubtaskStatus,
    required TResult Function(_ToggleSubtaskCompletion value)
    toggleSubtaskCompletion,
    required TResult Function(_DeleteSubtask value) deleteSubtask,
    required TResult Function(_ReorderSubtasks value) reorderSubtasks,
  }) {
    return reorderSubtasks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult? Function(_RefreshTodos value)? refreshTodos,
    TResult? Function(_CreateTodo value)? createTodo,
    TResult? Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult? Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult? Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult? Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult? Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult? Function(_UpdateTodo value)? updateTodo,
    TResult? Function(_DeleteTodo value)? deleteTodo,
    TResult? Function(_SearchTodos value)? searchTodos,
    TResult? Function(_ClearSearch value)? clearSearch,
    TResult? Function(_LoadSubtasks value)? loadSubtasks,
    TResult? Function(_CreateSubtask value)? createSubtask,
    TResult? Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult? Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult? Function(_DeleteSubtask value)? deleteSubtask,
    TResult? Function(_ReorderSubtasks value)? reorderSubtasks,
  }) {
    return reorderSubtasks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadProjectTodos value)? loadProjectTodos,
    TResult Function(_RefreshTodos value)? refreshTodos,
    TResult Function(_CreateTodo value)? createTodo,
    TResult Function(_UpdateTodoStatus value)? updateTodoStatus,
    TResult Function(_UpdateTodoSortOrder value)? updateTodoSortOrder,
    TResult Function(_UpdateTodoStatusAndSortOrder value)?
    updateTodoStatusAndSortOrder,
    TResult Function(_ToggleTodoCompletion value)? toggleTodoCompletion,
    TResult Function(_ToggleTodoPin value)? toggleTodoPin,
    TResult Function(_UpdateTodo value)? updateTodo,
    TResult Function(_DeleteTodo value)? deleteTodo,
    TResult Function(_SearchTodos value)? searchTodos,
    TResult Function(_ClearSearch value)? clearSearch,
    TResult Function(_LoadSubtasks value)? loadSubtasks,
    TResult Function(_CreateSubtask value)? createSubtask,
    TResult Function(_UpdateSubtaskStatus value)? updateSubtaskStatus,
    TResult Function(_ToggleSubtaskCompletion value)? toggleSubtaskCompletion,
    TResult Function(_DeleteSubtask value)? deleteSubtask,
    TResult Function(_ReorderSubtasks value)? reorderSubtasks,
    required TResult orElse(),
  }) {
    if (reorderSubtasks != null) {
      return reorderSubtasks(this);
    }
    return orElse();
  }
}

abstract class _ReorderSubtasks implements TodosEvent {
  const factory _ReorderSubtasks(
    final String todoId,
    final List<String> subtaskIds,
  ) = _$ReorderSubtasksImpl;

  String get todoId;
  List<String> get subtaskIds;

  /// Create a copy of TodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReorderSubtasksImplCopyWith<_$ReorderSubtasksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

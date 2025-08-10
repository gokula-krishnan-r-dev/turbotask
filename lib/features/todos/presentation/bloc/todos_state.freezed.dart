// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TodosState {
  TodosStatus get status => throw _privateConstructorUsedError;
  String? get currentProjectId => throw _privateConstructorUsedError;
  Map<TodoStatus, List<Todo>> get todosByStatus =>
      throw _privateConstructorUsedError;
  Map<String, List<Subtask>> get subtasksByTodoId =>
      throw _privateConstructorUsedError;
  List<Todo> get searchResults => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isRefreshing => throw _privateConstructorUsedError;
  bool get isCreatingTodo => throw _privateConstructorUsedError;
  bool get isCreatingSubtask => throw _privateConstructorUsedError;
  Map<String, bool> get isLoadingSubtasks => throw _privateConstructorUsedError;
  Map<String, bool> get isUpdatingTodos => throw _privateConstructorUsedError;
  Map<String, bool> get isUpdatingSubtasks =>
      throw _privateConstructorUsedError;

  /// Create a copy of TodosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodosStateCopyWith<TodosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodosStateCopyWith<$Res> {
  factory $TodosStateCopyWith(
    TodosState value,
    $Res Function(TodosState) then,
  ) = _$TodosStateCopyWithImpl<$Res, TodosState>;
  @useResult
  $Res call({
    TodosStatus status,
    String? currentProjectId,
    Map<TodoStatus, List<Todo>> todosByStatus,
    Map<String, List<Subtask>> subtasksByTodoId,
    List<Todo> searchResults,
    String? searchQuery,
    String? errorMessage,
    bool isRefreshing,
    bool isCreatingTodo,
    bool isCreatingSubtask,
    Map<String, bool> isLoadingSubtasks,
    Map<String, bool> isUpdatingTodos,
    Map<String, bool> isUpdatingSubtasks,
  });
}

/// @nodoc
class _$TodosStateCopyWithImpl<$Res, $Val extends TodosState>
    implements $TodosStateCopyWith<$Res> {
  _$TodosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentProjectId = freezed,
    Object? todosByStatus = null,
    Object? subtasksByTodoId = null,
    Object? searchResults = null,
    Object? searchQuery = freezed,
    Object? errorMessage = freezed,
    Object? isRefreshing = null,
    Object? isCreatingTodo = null,
    Object? isCreatingSubtask = null,
    Object? isLoadingSubtasks = null,
    Object? isUpdatingTodos = null,
    Object? isUpdatingSubtasks = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as TodosStatus,
            currentProjectId: freezed == currentProjectId
                ? _value.currentProjectId
                : currentProjectId // ignore: cast_nullable_to_non_nullable
                      as String?,
            todosByStatus: null == todosByStatus
                ? _value.todosByStatus
                : todosByStatus // ignore: cast_nullable_to_non_nullable
                      as Map<TodoStatus, List<Todo>>,
            subtasksByTodoId: null == subtasksByTodoId
                ? _value.subtasksByTodoId
                : subtasksByTodoId // ignore: cast_nullable_to_non_nullable
                      as Map<String, List<Subtask>>,
            searchResults: null == searchResults
                ? _value.searchResults
                : searchResults // ignore: cast_nullable_to_non_nullable
                      as List<Todo>,
            searchQuery: freezed == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRefreshing: null == isRefreshing
                ? _value.isRefreshing
                : isRefreshing // ignore: cast_nullable_to_non_nullable
                      as bool,
            isCreatingTodo: null == isCreatingTodo
                ? _value.isCreatingTodo
                : isCreatingTodo // ignore: cast_nullable_to_non_nullable
                      as bool,
            isCreatingSubtask: null == isCreatingSubtask
                ? _value.isCreatingSubtask
                : isCreatingSubtask // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLoadingSubtasks: null == isLoadingSubtasks
                ? _value.isLoadingSubtasks
                : isLoadingSubtasks // ignore: cast_nullable_to_non_nullable
                      as Map<String, bool>,
            isUpdatingTodos: null == isUpdatingTodos
                ? _value.isUpdatingTodos
                : isUpdatingTodos // ignore: cast_nullable_to_non_nullable
                      as Map<String, bool>,
            isUpdatingSubtasks: null == isUpdatingSubtasks
                ? _value.isUpdatingSubtasks
                : isUpdatingSubtasks // ignore: cast_nullable_to_non_nullable
                      as Map<String, bool>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodosStateImplCopyWith<$Res>
    implements $TodosStateCopyWith<$Res> {
  factory _$$TodosStateImplCopyWith(
    _$TodosStateImpl value,
    $Res Function(_$TodosStateImpl) then,
  ) = __$$TodosStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TodosStatus status,
    String? currentProjectId,
    Map<TodoStatus, List<Todo>> todosByStatus,
    Map<String, List<Subtask>> subtasksByTodoId,
    List<Todo> searchResults,
    String? searchQuery,
    String? errorMessage,
    bool isRefreshing,
    bool isCreatingTodo,
    bool isCreatingSubtask,
    Map<String, bool> isLoadingSubtasks,
    Map<String, bool> isUpdatingTodos,
    Map<String, bool> isUpdatingSubtasks,
  });
}

/// @nodoc
class __$$TodosStateImplCopyWithImpl<$Res>
    extends _$TodosStateCopyWithImpl<$Res, _$TodosStateImpl>
    implements _$$TodosStateImplCopyWith<$Res> {
  __$$TodosStateImplCopyWithImpl(
    _$TodosStateImpl _value,
    $Res Function(_$TodosStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentProjectId = freezed,
    Object? todosByStatus = null,
    Object? subtasksByTodoId = null,
    Object? searchResults = null,
    Object? searchQuery = freezed,
    Object? errorMessage = freezed,
    Object? isRefreshing = null,
    Object? isCreatingTodo = null,
    Object? isCreatingSubtask = null,
    Object? isLoadingSubtasks = null,
    Object? isUpdatingTodos = null,
    Object? isUpdatingSubtasks = null,
  }) {
    return _then(
      _$TodosStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TodosStatus,
        currentProjectId: freezed == currentProjectId
            ? _value.currentProjectId
            : currentProjectId // ignore: cast_nullable_to_non_nullable
                  as String?,
        todosByStatus: null == todosByStatus
            ? _value._todosByStatus
            : todosByStatus // ignore: cast_nullable_to_non_nullable
                  as Map<TodoStatus, List<Todo>>,
        subtasksByTodoId: null == subtasksByTodoId
            ? _value._subtasksByTodoId
            : subtasksByTodoId // ignore: cast_nullable_to_non_nullable
                  as Map<String, List<Subtask>>,
        searchResults: null == searchResults
            ? _value._searchResults
            : searchResults // ignore: cast_nullable_to_non_nullable
                  as List<Todo>,
        searchQuery: freezed == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRefreshing: null == isRefreshing
            ? _value.isRefreshing
            : isRefreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCreatingTodo: null == isCreatingTodo
            ? _value.isCreatingTodo
            : isCreatingTodo // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCreatingSubtask: null == isCreatingSubtask
            ? _value.isCreatingSubtask
            : isCreatingSubtask // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoadingSubtasks: null == isLoadingSubtasks
            ? _value._isLoadingSubtasks
            : isLoadingSubtasks // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>,
        isUpdatingTodos: null == isUpdatingTodos
            ? _value._isUpdatingTodos
            : isUpdatingTodos // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>,
        isUpdatingSubtasks: null == isUpdatingSubtasks
            ? _value._isUpdatingSubtasks
            : isUpdatingSubtasks // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>,
      ),
    );
  }
}

/// @nodoc

class _$TodosStateImpl implements _TodosState {
  const _$TodosStateImpl({
    this.status = TodosStatus.initial,
    this.currentProjectId,
    final Map<TodoStatus, List<Todo>> todosByStatus = const {},
    final Map<String, List<Subtask>> subtasksByTodoId = const {},
    final List<Todo> searchResults = const [],
    this.searchQuery,
    this.errorMessage,
    this.isRefreshing = false,
    this.isCreatingTodo = false,
    this.isCreatingSubtask = false,
    final Map<String, bool> isLoadingSubtasks = const {},
    final Map<String, bool> isUpdatingTodos = const {},
    final Map<String, bool> isUpdatingSubtasks = const {},
  }) : _todosByStatus = todosByStatus,
       _subtasksByTodoId = subtasksByTodoId,
       _searchResults = searchResults,
       _isLoadingSubtasks = isLoadingSubtasks,
       _isUpdatingTodos = isUpdatingTodos,
       _isUpdatingSubtasks = isUpdatingSubtasks;

  @override
  @JsonKey()
  final TodosStatus status;
  @override
  final String? currentProjectId;
  final Map<TodoStatus, List<Todo>> _todosByStatus;
  @override
  @JsonKey()
  Map<TodoStatus, List<Todo>> get todosByStatus {
    if (_todosByStatus is EqualUnmodifiableMapView) return _todosByStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_todosByStatus);
  }

  final Map<String, List<Subtask>> _subtasksByTodoId;
  @override
  @JsonKey()
  Map<String, List<Subtask>> get subtasksByTodoId {
    if (_subtasksByTodoId is EqualUnmodifiableMapView) return _subtasksByTodoId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_subtasksByTodoId);
  }

  final List<Todo> _searchResults;
  @override
  @JsonKey()
  List<Todo> get searchResults {
    if (_searchResults is EqualUnmodifiableListView) return _searchResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchResults);
  }

  @override
  final String? searchQuery;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isRefreshing;
  @override
  @JsonKey()
  final bool isCreatingTodo;
  @override
  @JsonKey()
  final bool isCreatingSubtask;
  final Map<String, bool> _isLoadingSubtasks;
  @override
  @JsonKey()
  Map<String, bool> get isLoadingSubtasks {
    if (_isLoadingSubtasks is EqualUnmodifiableMapView)
      return _isLoadingSubtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isLoadingSubtasks);
  }

  final Map<String, bool> _isUpdatingTodos;
  @override
  @JsonKey()
  Map<String, bool> get isUpdatingTodos {
    if (_isUpdatingTodos is EqualUnmodifiableMapView) return _isUpdatingTodos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isUpdatingTodos);
  }

  final Map<String, bool> _isUpdatingSubtasks;
  @override
  @JsonKey()
  Map<String, bool> get isUpdatingSubtasks {
    if (_isUpdatingSubtasks is EqualUnmodifiableMapView)
      return _isUpdatingSubtasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_isUpdatingSubtasks);
  }

  @override
  String toString() {
    return 'TodosState(status: $status, currentProjectId: $currentProjectId, todosByStatus: $todosByStatus, subtasksByTodoId: $subtasksByTodoId, searchResults: $searchResults, searchQuery: $searchQuery, errorMessage: $errorMessage, isRefreshing: $isRefreshing, isCreatingTodo: $isCreatingTodo, isCreatingSubtask: $isCreatingSubtask, isLoadingSubtasks: $isLoadingSubtasks, isUpdatingTodos: $isUpdatingTodos, isUpdatingSubtasks: $isUpdatingSubtasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodosStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentProjectId, currentProjectId) ||
                other.currentProjectId == currentProjectId) &&
            const DeepCollectionEquality().equals(
              other._todosByStatus,
              _todosByStatus,
            ) &&
            const DeepCollectionEquality().equals(
              other._subtasksByTodoId,
              _subtasksByTodoId,
            ) &&
            const DeepCollectionEquality().equals(
              other._searchResults,
              _searchResults,
            ) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.isCreatingTodo, isCreatingTodo) ||
                other.isCreatingTodo == isCreatingTodo) &&
            (identical(other.isCreatingSubtask, isCreatingSubtask) ||
                other.isCreatingSubtask == isCreatingSubtask) &&
            const DeepCollectionEquality().equals(
              other._isLoadingSubtasks,
              _isLoadingSubtasks,
            ) &&
            const DeepCollectionEquality().equals(
              other._isUpdatingTodos,
              _isUpdatingTodos,
            ) &&
            const DeepCollectionEquality().equals(
              other._isUpdatingSubtasks,
              _isUpdatingSubtasks,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    currentProjectId,
    const DeepCollectionEquality().hash(_todosByStatus),
    const DeepCollectionEquality().hash(_subtasksByTodoId),
    const DeepCollectionEquality().hash(_searchResults),
    searchQuery,
    errorMessage,
    isRefreshing,
    isCreatingTodo,
    isCreatingSubtask,
    const DeepCollectionEquality().hash(_isLoadingSubtasks),
    const DeepCollectionEquality().hash(_isUpdatingTodos),
    const DeepCollectionEquality().hash(_isUpdatingSubtasks),
  );

  /// Create a copy of TodosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodosStateImplCopyWith<_$TodosStateImpl> get copyWith =>
      __$$TodosStateImplCopyWithImpl<_$TodosStateImpl>(this, _$identity);
}

abstract class _TodosState implements TodosState {
  const factory _TodosState({
    final TodosStatus status,
    final String? currentProjectId,
    final Map<TodoStatus, List<Todo>> todosByStatus,
    final Map<String, List<Subtask>> subtasksByTodoId,
    final List<Todo> searchResults,
    final String? searchQuery,
    final String? errorMessage,
    final bool isRefreshing,
    final bool isCreatingTodo,
    final bool isCreatingSubtask,
    final Map<String, bool> isLoadingSubtasks,
    final Map<String, bool> isUpdatingTodos,
    final Map<String, bool> isUpdatingSubtasks,
  }) = _$TodosStateImpl;

  @override
  TodosStatus get status;
  @override
  String? get currentProjectId;
  @override
  Map<TodoStatus, List<Todo>> get todosByStatus;
  @override
  Map<String, List<Subtask>> get subtasksByTodoId;
  @override
  List<Todo> get searchResults;
  @override
  String? get searchQuery;
  @override
  String? get errorMessage;
  @override
  bool get isRefreshing;
  @override
  bool get isCreatingTodo;
  @override
  bool get isCreatingSubtask;
  @override
  Map<String, bool> get isLoadingSubtasks;
  @override
  Map<String, bool> get isUpdatingTodos;
  @override
  Map<String, bool> get isUpdatingSubtasks;

  /// Create a copy of TodosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodosStateImplCopyWith<_$TodosStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

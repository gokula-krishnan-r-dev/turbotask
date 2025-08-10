// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProjectsState {
  ProjectsStatus get status => throw _privateConstructorUsedError;
  List<Project> get projects => throw _privateConstructorUsedError;
  List<Project> get filteredProjects => throw _privateConstructorUsedError;
  ProjectStats? get stats => throw _privateConstructorUsedError;
  String? get searchQuery => throw _privateConstructorUsedError;
  String? get categoryFilter => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isRefreshing => throw _privateConstructorUsedError;
  bool get isCreating => throw _privateConstructorUsedError;

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectsStateCopyWith<ProjectsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsStateCopyWith<$Res> {
  factory $ProjectsStateCopyWith(
    ProjectsState value,
    $Res Function(ProjectsState) then,
  ) = _$ProjectsStateCopyWithImpl<$Res, ProjectsState>;
  @useResult
  $Res call({
    ProjectsStatus status,
    List<Project> projects,
    List<Project> filteredProjects,
    ProjectStats? stats,
    String? searchQuery,
    String? categoryFilter,
    String? errorMessage,
    bool isRefreshing,
    bool isCreating,
  });
}

/// @nodoc
class _$ProjectsStateCopyWithImpl<$Res, $Val extends ProjectsState>
    implements $ProjectsStateCopyWith<$Res> {
  _$ProjectsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? projects = null,
    Object? filteredProjects = null,
    Object? stats = freezed,
    Object? searchQuery = freezed,
    Object? categoryFilter = freezed,
    Object? errorMessage = freezed,
    Object? isRefreshing = null,
    Object? isCreating = null,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ProjectsStatus,
            projects: null == projects
                ? _value.projects
                : projects // ignore: cast_nullable_to_non_nullable
                      as List<Project>,
            filteredProjects: null == filteredProjects
                ? _value.filteredProjects
                : filteredProjects // ignore: cast_nullable_to_non_nullable
                      as List<Project>,
            stats: freezed == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as ProjectStats?,
            searchQuery: freezed == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryFilter: freezed == categoryFilter
                ? _value.categoryFilter
                : categoryFilter // ignore: cast_nullable_to_non_nullable
                      as String?,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            isRefreshing: null == isRefreshing
                ? _value.isRefreshing
                : isRefreshing // ignore: cast_nullable_to_non_nullable
                      as bool,
            isCreating: null == isCreating
                ? _value.isCreating
                : isCreating // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectsStateImplCopyWith<$Res>
    implements $ProjectsStateCopyWith<$Res> {
  factory _$$ProjectsStateImplCopyWith(
    _$ProjectsStateImpl value,
    $Res Function(_$ProjectsStateImpl) then,
  ) = __$$ProjectsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ProjectsStatus status,
    List<Project> projects,
    List<Project> filteredProjects,
    ProjectStats? stats,
    String? searchQuery,
    String? categoryFilter,
    String? errorMessage,
    bool isRefreshing,
    bool isCreating,
  });
}

/// @nodoc
class __$$ProjectsStateImplCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res, _$ProjectsStateImpl>
    implements _$$ProjectsStateImplCopyWith<$Res> {
  __$$ProjectsStateImplCopyWithImpl(
    _$ProjectsStateImpl _value,
    $Res Function(_$ProjectsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? projects = null,
    Object? filteredProjects = null,
    Object? stats = freezed,
    Object? searchQuery = freezed,
    Object? categoryFilter = freezed,
    Object? errorMessage = freezed,
    Object? isRefreshing = null,
    Object? isCreating = null,
  }) {
    return _then(
      _$ProjectsStateImpl(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ProjectsStatus,
        projects: null == projects
            ? _value._projects
            : projects // ignore: cast_nullable_to_non_nullable
                  as List<Project>,
        filteredProjects: null == filteredProjects
            ? _value._filteredProjects
            : filteredProjects // ignore: cast_nullable_to_non_nullable
                  as List<Project>,
        stats: freezed == stats
            ? _value.stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as ProjectStats?,
        searchQuery: freezed == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryFilter: freezed == categoryFilter
            ? _value.categoryFilter
            : categoryFilter // ignore: cast_nullable_to_non_nullable
                  as String?,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        isRefreshing: null == isRefreshing
            ? _value.isRefreshing
            : isRefreshing // ignore: cast_nullable_to_non_nullable
                  as bool,
        isCreating: null == isCreating
            ? _value.isCreating
            : isCreating // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ProjectsStateImpl implements _ProjectsState {
  const _$ProjectsStateImpl({
    this.status = ProjectsStatus.initial,
    final List<Project> projects = const [],
    final List<Project> filteredProjects = const [],
    this.stats,
    this.searchQuery,
    this.categoryFilter,
    this.errorMessage,
    this.isRefreshing = false,
    this.isCreating = false,
  }) : _projects = projects,
       _filteredProjects = filteredProjects;

  @override
  @JsonKey()
  final ProjectsStatus status;
  final List<Project> _projects;
  @override
  @JsonKey()
  List<Project> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  final List<Project> _filteredProjects;
  @override
  @JsonKey()
  List<Project> get filteredProjects {
    if (_filteredProjects is EqualUnmodifiableListView)
      return _filteredProjects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredProjects);
  }

  @override
  final ProjectStats? stats;
  @override
  final String? searchQuery;
  @override
  final String? categoryFilter;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isRefreshing;
  @override
  @JsonKey()
  final bool isCreating;

  @override
  String toString() {
    return 'ProjectsState(status: $status, projects: $projects, filteredProjects: $filteredProjects, stats: $stats, searchQuery: $searchQuery, categoryFilter: $categoryFilter, errorMessage: $errorMessage, isRefreshing: $isRefreshing, isCreating: $isCreating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            const DeepCollectionEquality().equals(
              other._filteredProjects,
              _filteredProjects,
            ) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.categoryFilter, categoryFilter) ||
                other.categoryFilter == categoryFilter) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing) &&
            (identical(other.isCreating, isCreating) ||
                other.isCreating == isCreating));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_projects),
    const DeepCollectionEquality().hash(_filteredProjects),
    stats,
    searchQuery,
    categoryFilter,
    errorMessage,
    isRefreshing,
    isCreating,
  );

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsStateImplCopyWith<_$ProjectsStateImpl> get copyWith =>
      __$$ProjectsStateImplCopyWithImpl<_$ProjectsStateImpl>(this, _$identity);
}

abstract class _ProjectsState implements ProjectsState {
  const factory _ProjectsState({
    final ProjectsStatus status,
    final List<Project> projects,
    final List<Project> filteredProjects,
    final ProjectStats? stats,
    final String? searchQuery,
    final String? categoryFilter,
    final String? errorMessage,
    final bool isRefreshing,
    final bool isCreating,
  }) = _$ProjectsStateImpl;

  @override
  ProjectsStatus get status;
  @override
  List<Project> get projects;
  @override
  List<Project> get filteredProjects;
  @override
  ProjectStats? get stats;
  @override
  String? get searchQuery;
  @override
  String? get categoryFilter;
  @override
  String? get errorMessage;
  @override
  bool get isRefreshing;
  @override
  bool get isCreating;

  /// Create a copy of ProjectsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectsStateImplCopyWith<_$ProjectsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

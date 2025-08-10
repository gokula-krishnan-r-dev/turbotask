// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProjectStatsModel _$ProjectStatsModelFromJson(Map<String, dynamic> json) {
  return _ProjectStatsModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectStatsModel {
  @JsonKey(name: 'total_projects')
  int get totalProjects => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_projects')
  int get activeProjects => throw _privateConstructorUsedError;
  @JsonKey(name: 'archived_projects')
  int get archivedProjects => throw _privateConstructorUsedError;
  @JsonKey(name: 'favorite_projects')
  int get favoriteProjects => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tasks')
  int get totalTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_tasks')
  int get completedTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'pending_tasks')
  int get pendingTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'completion_rate')
  double get completionRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_breakdown')
  Map<String, int> get categoryBreakdown => throw _privateConstructorUsedError;

  /// Serializes this ProjectStatsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectStatsModelCopyWith<ProjectStatsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStatsModelCopyWith<$Res> {
  factory $ProjectStatsModelCopyWith(
    ProjectStatsModel value,
    $Res Function(ProjectStatsModel) then,
  ) = _$ProjectStatsModelCopyWithImpl<$Res, ProjectStatsModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'total_projects') int totalProjects,
    @JsonKey(name: 'active_projects') int activeProjects,
    @JsonKey(name: 'archived_projects') int archivedProjects,
    @JsonKey(name: 'favorite_projects') int favoriteProjects,
    @JsonKey(name: 'total_tasks') int totalTasks,
    @JsonKey(name: 'completed_tasks') int completedTasks,
    @JsonKey(name: 'pending_tasks') int pendingTasks,
    @JsonKey(name: 'completion_rate') double completionRate,
    @JsonKey(name: 'category_breakdown') Map<String, int> categoryBreakdown,
  });
}

/// @nodoc
class _$ProjectStatsModelCopyWithImpl<$Res, $Val extends ProjectStatsModel>
    implements $ProjectStatsModelCopyWith<$Res> {
  _$ProjectStatsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProjects = null,
    Object? activeProjects = null,
    Object? archivedProjects = null,
    Object? favoriteProjects = null,
    Object? totalTasks = null,
    Object? completedTasks = null,
    Object? pendingTasks = null,
    Object? completionRate = null,
    Object? categoryBreakdown = null,
  }) {
    return _then(
      _value.copyWith(
            totalProjects: null == totalProjects
                ? _value.totalProjects
                : totalProjects // ignore: cast_nullable_to_non_nullable
                      as int,
            activeProjects: null == activeProjects
                ? _value.activeProjects
                : activeProjects // ignore: cast_nullable_to_non_nullable
                      as int,
            archivedProjects: null == archivedProjects
                ? _value.archivedProjects
                : archivedProjects // ignore: cast_nullable_to_non_nullable
                      as int,
            favoriteProjects: null == favoriteProjects
                ? _value.favoriteProjects
                : favoriteProjects // ignore: cast_nullable_to_non_nullable
                      as int,
            totalTasks: null == totalTasks
                ? _value.totalTasks
                : totalTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            completedTasks: null == completedTasks
                ? _value.completedTasks
                : completedTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            pendingTasks: null == pendingTasks
                ? _value.pendingTasks
                : pendingTasks // ignore: cast_nullable_to_non_nullable
                      as int,
            completionRate: null == completionRate
                ? _value.completionRate
                : completionRate // ignore: cast_nullable_to_non_nullable
                      as double,
            categoryBreakdown: null == categoryBreakdown
                ? _value.categoryBreakdown
                : categoryBreakdown // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectStatsModelImplCopyWith<$Res>
    implements $ProjectStatsModelCopyWith<$Res> {
  factory _$$ProjectStatsModelImplCopyWith(
    _$ProjectStatsModelImpl value,
    $Res Function(_$ProjectStatsModelImpl) then,
  ) = __$$ProjectStatsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'total_projects') int totalProjects,
    @JsonKey(name: 'active_projects') int activeProjects,
    @JsonKey(name: 'archived_projects') int archivedProjects,
    @JsonKey(name: 'favorite_projects') int favoriteProjects,
    @JsonKey(name: 'total_tasks') int totalTasks,
    @JsonKey(name: 'completed_tasks') int completedTasks,
    @JsonKey(name: 'pending_tasks') int pendingTasks,
    @JsonKey(name: 'completion_rate') double completionRate,
    @JsonKey(name: 'category_breakdown') Map<String, int> categoryBreakdown,
  });
}

/// @nodoc
class __$$ProjectStatsModelImplCopyWithImpl<$Res>
    extends _$ProjectStatsModelCopyWithImpl<$Res, _$ProjectStatsModelImpl>
    implements _$$ProjectStatsModelImplCopyWith<$Res> {
  __$$ProjectStatsModelImplCopyWithImpl(
    _$ProjectStatsModelImpl _value,
    $Res Function(_$ProjectStatsModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalProjects = null,
    Object? activeProjects = null,
    Object? archivedProjects = null,
    Object? favoriteProjects = null,
    Object? totalTasks = null,
    Object? completedTasks = null,
    Object? pendingTasks = null,
    Object? completionRate = null,
    Object? categoryBreakdown = null,
  }) {
    return _then(
      _$ProjectStatsModelImpl(
        totalProjects: null == totalProjects
            ? _value.totalProjects
            : totalProjects // ignore: cast_nullable_to_non_nullable
                  as int,
        activeProjects: null == activeProjects
            ? _value.activeProjects
            : activeProjects // ignore: cast_nullable_to_non_nullable
                  as int,
        archivedProjects: null == archivedProjects
            ? _value.archivedProjects
            : archivedProjects // ignore: cast_nullable_to_non_nullable
                  as int,
        favoriteProjects: null == favoriteProjects
            ? _value.favoriteProjects
            : favoriteProjects // ignore: cast_nullable_to_non_nullable
                  as int,
        totalTasks: null == totalTasks
            ? _value.totalTasks
            : totalTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        completedTasks: null == completedTasks
            ? _value.completedTasks
            : completedTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        pendingTasks: null == pendingTasks
            ? _value.pendingTasks
            : pendingTasks // ignore: cast_nullable_to_non_nullable
                  as int,
        completionRate: null == completionRate
            ? _value.completionRate
            : completionRate // ignore: cast_nullable_to_non_nullable
                  as double,
        categoryBreakdown: null == categoryBreakdown
            ? _value._categoryBreakdown
            : categoryBreakdown // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectStatsModelImpl extends _ProjectStatsModel {
  const _$ProjectStatsModelImpl({
    @JsonKey(name: 'total_projects') required this.totalProjects,
    @JsonKey(name: 'active_projects') required this.activeProjects,
    @JsonKey(name: 'archived_projects') required this.archivedProjects,
    @JsonKey(name: 'favorite_projects') required this.favoriteProjects,
    @JsonKey(name: 'total_tasks') required this.totalTasks,
    @JsonKey(name: 'completed_tasks') required this.completedTasks,
    @JsonKey(name: 'pending_tasks') required this.pendingTasks,
    @JsonKey(name: 'completion_rate') required this.completionRate,
    @JsonKey(name: 'category_breakdown')
    required final Map<String, int> categoryBreakdown,
  }) : _categoryBreakdown = categoryBreakdown,
       super._();

  factory _$ProjectStatsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectStatsModelImplFromJson(json);

  @override
  @JsonKey(name: 'total_projects')
  final int totalProjects;
  @override
  @JsonKey(name: 'active_projects')
  final int activeProjects;
  @override
  @JsonKey(name: 'archived_projects')
  final int archivedProjects;
  @override
  @JsonKey(name: 'favorite_projects')
  final int favoriteProjects;
  @override
  @JsonKey(name: 'total_tasks')
  final int totalTasks;
  @override
  @JsonKey(name: 'completed_tasks')
  final int completedTasks;
  @override
  @JsonKey(name: 'pending_tasks')
  final int pendingTasks;
  @override
  @JsonKey(name: 'completion_rate')
  final double completionRate;
  final Map<String, int> _categoryBreakdown;
  @override
  @JsonKey(name: 'category_breakdown')
  Map<String, int> get categoryBreakdown {
    if (_categoryBreakdown is EqualUnmodifiableMapView)
      return _categoryBreakdown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryBreakdown);
  }

  @override
  String toString() {
    return 'ProjectStatsModel(totalProjects: $totalProjects, activeProjects: $activeProjects, archivedProjects: $archivedProjects, favoriteProjects: $favoriteProjects, totalTasks: $totalTasks, completedTasks: $completedTasks, pendingTasks: $pendingTasks, completionRate: $completionRate, categoryBreakdown: $categoryBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStatsModelImpl &&
            (identical(other.totalProjects, totalProjects) ||
                other.totalProjects == totalProjects) &&
            (identical(other.activeProjects, activeProjects) ||
                other.activeProjects == activeProjects) &&
            (identical(other.archivedProjects, archivedProjects) ||
                other.archivedProjects == archivedProjects) &&
            (identical(other.favoriteProjects, favoriteProjects) ||
                other.favoriteProjects == favoriteProjects) &&
            (identical(other.totalTasks, totalTasks) ||
                other.totalTasks == totalTasks) &&
            (identical(other.completedTasks, completedTasks) ||
                other.completedTasks == completedTasks) &&
            (identical(other.pendingTasks, pendingTasks) ||
                other.pendingTasks == pendingTasks) &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            const DeepCollectionEquality().equals(
              other._categoryBreakdown,
              _categoryBreakdown,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    totalProjects,
    activeProjects,
    archivedProjects,
    favoriteProjects,
    totalTasks,
    completedTasks,
    pendingTasks,
    completionRate,
    const DeepCollectionEquality().hash(_categoryBreakdown),
  );

  /// Create a copy of ProjectStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectStatsModelImplCopyWith<_$ProjectStatsModelImpl> get copyWith =>
      __$$ProjectStatsModelImplCopyWithImpl<_$ProjectStatsModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectStatsModelImplToJson(this);
  }
}

abstract class _ProjectStatsModel extends ProjectStatsModel {
  const factory _ProjectStatsModel({
    @JsonKey(name: 'total_projects') required final int totalProjects,
    @JsonKey(name: 'active_projects') required final int activeProjects,
    @JsonKey(name: 'archived_projects') required final int archivedProjects,
    @JsonKey(name: 'favorite_projects') required final int favoriteProjects,
    @JsonKey(name: 'total_tasks') required final int totalTasks,
    @JsonKey(name: 'completed_tasks') required final int completedTasks,
    @JsonKey(name: 'pending_tasks') required final int pendingTasks,
    @JsonKey(name: 'completion_rate') required final double completionRate,
    @JsonKey(name: 'category_breakdown')
    required final Map<String, int> categoryBreakdown,
  }) = _$ProjectStatsModelImpl;
  const _ProjectStatsModel._() : super._();

  factory _ProjectStatsModel.fromJson(Map<String, dynamic> json) =
      _$ProjectStatsModelImpl.fromJson;

  @override
  @JsonKey(name: 'total_projects')
  int get totalProjects;
  @override
  @JsonKey(name: 'active_projects')
  int get activeProjects;
  @override
  @JsonKey(name: 'archived_projects')
  int get archivedProjects;
  @override
  @JsonKey(name: 'favorite_projects')
  int get favoriteProjects;
  @override
  @JsonKey(name: 'total_tasks')
  int get totalTasks;
  @override
  @JsonKey(name: 'completed_tasks')
  int get completedTasks;
  @override
  @JsonKey(name: 'pending_tasks')
  int get pendingTasks;
  @override
  @JsonKey(name: 'completion_rate')
  double get completionRate;
  @override
  @JsonKey(name: 'category_breakdown')
  Map<String, int> get categoryBreakdown;

  /// Create a copy of ProjectStatsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectStatsModelImplCopyWith<_$ProjectStatsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

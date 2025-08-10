// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ProjectResponseModel _$ProjectResponseModelFromJson(Map<String, dynamic> json) {
  return _ProjectResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectResponseModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ProjectModel? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'projects')
  List<ProjectModel>? get projects => throw _privateConstructorUsedError;
  @JsonKey(name: 'stats')
  ProjectStatsModel? get stats => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;

  /// Serializes this ProjectResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectResponseModelCopyWith<ProjectResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectResponseModelCopyWith<$Res> {
  factory $ProjectResponseModelCopyWith(
    ProjectResponseModel value,
    $Res Function(ProjectResponseModel) then,
  ) = _$ProjectResponseModelCopyWithImpl<$Res, ProjectResponseModel>;
  @useResult
  $Res call({
    bool success,
    String message,
    ProjectModel? data,
    @JsonKey(name: 'projects') List<ProjectModel>? projects,
    @JsonKey(name: 'stats') ProjectStatsModel? stats,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  });

  $ProjectModelCopyWith<$Res>? get data;
  $ProjectStatsModelCopyWith<$Res>? get stats;
}

/// @nodoc
class _$ProjectResponseModelCopyWithImpl<
  $Res,
  $Val extends ProjectResponseModel
>
    implements $ProjectResponseModelCopyWith<$Res> {
  _$ProjectResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
    Object? projects = freezed,
    Object? stats = freezed,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as ProjectModel?,
            projects: freezed == projects
                ? _value.projects
                : projects // ignore: cast_nullable_to_non_nullable
                      as List<ProjectModel>?,
            stats: freezed == stats
                ? _value.stats
                : stats // ignore: cast_nullable_to_non_nullable
                      as ProjectStatsModel?,
            totalCount: freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            currentPage: freezed == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int?,
            perPage: freezed == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                      as int?,
            lastPage: freezed == lastPage
                ? _value.lastPage
                : lastPage // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }

  /// Create a copy of ProjectResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectModelCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ProjectModelCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  /// Create a copy of ProjectResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectStatsModelCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $ProjectStatsModelCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectResponseModelImplCopyWith<$Res>
    implements $ProjectResponseModelCopyWith<$Res> {
  factory _$$ProjectResponseModelImplCopyWith(
    _$ProjectResponseModelImpl value,
    $Res Function(_$ProjectResponseModelImpl) then,
  ) = __$$ProjectResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String message,
    ProjectModel? data,
    @JsonKey(name: 'projects') List<ProjectModel>? projects,
    @JsonKey(name: 'stats') ProjectStatsModel? stats,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  });

  @override
  $ProjectModelCopyWith<$Res>? get data;
  @override
  $ProjectStatsModelCopyWith<$Res>? get stats;
}

/// @nodoc
class __$$ProjectResponseModelImplCopyWithImpl<$Res>
    extends _$ProjectResponseModelCopyWithImpl<$Res, _$ProjectResponseModelImpl>
    implements _$$ProjectResponseModelImplCopyWith<$Res> {
  __$$ProjectResponseModelImplCopyWithImpl(
    _$ProjectResponseModelImpl _value,
    $Res Function(_$ProjectResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = freezed,
    Object? projects = freezed,
    Object? stats = freezed,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(
      _$ProjectResponseModelImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as ProjectModel?,
        projects: freezed == projects
            ? _value._projects
            : projects // ignore: cast_nullable_to_non_nullable
                  as List<ProjectModel>?,
        stats: freezed == stats
            ? _value.stats
            : stats // ignore: cast_nullable_to_non_nullable
                  as ProjectStatsModel?,
        totalCount: freezed == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentPage: freezed == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        perPage: freezed == perPage
            ? _value.perPage
            : perPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        lastPage: freezed == lastPage
            ? _value.lastPage
            : lastPage // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectResponseModelImpl implements _ProjectResponseModel {
  const _$ProjectResponseModelImpl({
    required this.success,
    required this.message,
    this.data,
    @JsonKey(name: 'projects') final List<ProjectModel>? projects,
    @JsonKey(name: 'stats') this.stats,
    @JsonKey(name: 'total_count') this.totalCount,
    @JsonKey(name: 'current_page') this.currentPage,
    @JsonKey(name: 'per_page') this.perPage,
    @JsonKey(name: 'last_page') this.lastPage,
  }) : _projects = projects;

  factory _$ProjectResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final ProjectModel? data;
  final List<ProjectModel>? _projects;
  @override
  @JsonKey(name: 'projects')
  List<ProjectModel>? get projects {
    final value = _projects;
    if (value == null) return null;
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'stats')
  final ProjectStatsModel? stats;
  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'last_page')
  final int? lastPage;

  @override
  String toString() {
    return 'ProjectResponseModel(success: $success, message: $message, data: $data, projects: $projects, stats: $stats, totalCount: $totalCount, currentPage: $currentPage, perPage: $perPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    data,
    const DeepCollectionEquality().hash(_projects),
    stats,
    totalCount,
    currentPage,
    perPage,
    lastPage,
  );

  /// Create a copy of ProjectResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectResponseModelImplCopyWith<_$ProjectResponseModelImpl>
  get copyWith =>
      __$$ProjectResponseModelImplCopyWithImpl<_$ProjectResponseModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectResponseModelImplToJson(this);
  }
}

abstract class _ProjectResponseModel implements ProjectResponseModel {
  const factory _ProjectResponseModel({
    required final bool success,
    required final String message,
    final ProjectModel? data,
    @JsonKey(name: 'projects') final List<ProjectModel>? projects,
    @JsonKey(name: 'stats') final ProjectStatsModel? stats,
    @JsonKey(name: 'total_count') final int? totalCount,
    @JsonKey(name: 'current_page') final int? currentPage,
    @JsonKey(name: 'per_page') final int? perPage,
    @JsonKey(name: 'last_page') final int? lastPage,
  }) = _$ProjectResponseModelImpl;

  factory _ProjectResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProjectResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ProjectModel? get data;
  @override
  @JsonKey(name: 'projects')
  List<ProjectModel>? get projects;
  @override
  @JsonKey(name: 'stats')
  ProjectStatsModel? get stats;
  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;
  @override
  @JsonKey(name: 'current_page')
  int? get currentPage;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'last_page')
  int? get lastPage;

  /// Create a copy of ProjectResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectResponseModelImplCopyWith<_$ProjectResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ProjectListResponseModel _$ProjectListResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _ProjectListResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectListResponseModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<ProjectModel> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_count')
  int? get totalCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int? get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int? get lastPage => throw _privateConstructorUsedError;

  /// Serializes this ProjectListResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectListResponseModelCopyWith<ProjectListResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectListResponseModelCopyWith<$Res> {
  factory $ProjectListResponseModelCopyWith(
    ProjectListResponseModel value,
    $Res Function(ProjectListResponseModel) then,
  ) = _$ProjectListResponseModelCopyWithImpl<$Res, ProjectListResponseModel>;
  @useResult
  $Res call({
    bool success,
    String message,
    List<ProjectModel> data,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  });
}

/// @nodoc
class _$ProjectListResponseModelCopyWithImpl<
  $Res,
  $Val extends ProjectListResponseModel
>
    implements $ProjectListResponseModelCopyWith<$Res> {
  _$ProjectListResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<ProjectModel>,
            totalCount: freezed == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            currentPage: freezed == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int?,
            perPage: freezed == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                      as int?,
            lastPage: freezed == lastPage
                ? _value.lastPage
                : lastPage // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProjectListResponseModelImplCopyWith<$Res>
    implements $ProjectListResponseModelCopyWith<$Res> {
  factory _$$ProjectListResponseModelImplCopyWith(
    _$ProjectListResponseModelImpl value,
    $Res Function(_$ProjectListResponseModelImpl) then,
  ) = __$$ProjectListResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool success,
    String message,
    List<ProjectModel> data,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  });
}

/// @nodoc
class __$$ProjectListResponseModelImplCopyWithImpl<$Res>
    extends
        _$ProjectListResponseModelCopyWithImpl<
          $Res,
          _$ProjectListResponseModelImpl
        >
    implements _$$ProjectListResponseModelImplCopyWith<$Res> {
  __$$ProjectListResponseModelImplCopyWithImpl(
    _$ProjectListResponseModelImpl _value,
    $Res Function(_$ProjectListResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
    Object? totalCount = freezed,
    Object? currentPage = freezed,
    Object? perPage = freezed,
    Object? lastPage = freezed,
  }) {
    return _then(
      _$ProjectListResponseModelImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<ProjectModel>,
        totalCount: freezed == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        currentPage: freezed == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        perPage: freezed == perPage
            ? _value.perPage
            : perPage // ignore: cast_nullable_to_non_nullable
                  as int?,
        lastPage: freezed == lastPage
            ? _value.lastPage
            : lastPage // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectListResponseModelImpl implements _ProjectListResponseModel {
  const _$ProjectListResponseModelImpl({
    required this.success,
    required this.message,
    required final List<ProjectModel> data,
    @JsonKey(name: 'total_count') this.totalCount,
    @JsonKey(name: 'current_page') this.currentPage,
    @JsonKey(name: 'per_page') this.perPage,
    @JsonKey(name: 'last_page') this.lastPage,
  }) : _data = data;

  factory _$ProjectListResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectListResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  final List<ProjectModel> _data;
  @override
  List<ProjectModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: 'total_count')
  final int? totalCount;
  @override
  @JsonKey(name: 'current_page')
  final int? currentPage;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'last_page')
  final int? lastPage;

  @override
  String toString() {
    return 'ProjectListResponseModel(success: $success, message: $message, data: $data, totalCount: $totalCount, currentPage: $currentPage, perPage: $perPage, lastPage: $lastPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectListResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    success,
    message,
    const DeepCollectionEquality().hash(_data),
    totalCount,
    currentPage,
    perPage,
    lastPage,
  );

  /// Create a copy of ProjectListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectListResponseModelImplCopyWith<_$ProjectListResponseModelImpl>
  get copyWith =>
      __$$ProjectListResponseModelImplCopyWithImpl<
        _$ProjectListResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectListResponseModelImplToJson(this);
  }
}

abstract class _ProjectListResponseModel implements ProjectListResponseModel {
  const factory _ProjectListResponseModel({
    required final bool success,
    required final String message,
    required final List<ProjectModel> data,
    @JsonKey(name: 'total_count') final int? totalCount,
    @JsonKey(name: 'current_page') final int? currentPage,
    @JsonKey(name: 'per_page') final int? perPage,
    @JsonKey(name: 'last_page') final int? lastPage,
  }) = _$ProjectListResponseModelImpl;

  factory _ProjectListResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProjectListResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  List<ProjectModel> get data;
  @override
  @JsonKey(name: 'total_count')
  int? get totalCount;
  @override
  @JsonKey(name: 'current_page')
  int? get currentPage;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'last_page')
  int? get lastPage;

  /// Create a copy of ProjectListResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectListResponseModelImplCopyWith<_$ProjectListResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

ProjectStatsResponseModel _$ProjectStatsResponseModelFromJson(
  Map<String, dynamic> json,
) {
  return _ProjectStatsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectStatsResponseModel {
  bool get success => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ProjectStatsModel get data => throw _privateConstructorUsedError;

  /// Serializes this ProjectStatsResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectStatsResponseModelCopyWith<ProjectStatsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStatsResponseModelCopyWith<$Res> {
  factory $ProjectStatsResponseModelCopyWith(
    ProjectStatsResponseModel value,
    $Res Function(ProjectStatsResponseModel) then,
  ) = _$ProjectStatsResponseModelCopyWithImpl<$Res, ProjectStatsResponseModel>;
  @useResult
  $Res call({bool success, String message, ProjectStatsModel data});

  $ProjectStatsModelCopyWith<$Res> get data;
}

/// @nodoc
class _$ProjectStatsResponseModelCopyWithImpl<
  $Res,
  $Val extends ProjectStatsResponseModel
>
    implements $ProjectStatsResponseModelCopyWith<$Res> {
  _$ProjectStatsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(
      _value.copyWith(
            success: null == success
                ? _value.success
                : success // ignore: cast_nullable_to_non_nullable
                      as bool,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as ProjectStatsModel,
          )
          as $Val,
    );
  }

  /// Create a copy of ProjectStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectStatsModelCopyWith<$Res> get data {
    return $ProjectStatsModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectStatsResponseModelImplCopyWith<$Res>
    implements $ProjectStatsResponseModelCopyWith<$Res> {
  factory _$$ProjectStatsResponseModelImplCopyWith(
    _$ProjectStatsResponseModelImpl value,
    $Res Function(_$ProjectStatsResponseModelImpl) then,
  ) = __$$ProjectStatsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, ProjectStatsModel data});

  @override
  $ProjectStatsModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$ProjectStatsResponseModelImplCopyWithImpl<$Res>
    extends
        _$ProjectStatsResponseModelCopyWithImpl<
          $Res,
          _$ProjectStatsResponseModelImpl
        >
    implements _$$ProjectStatsResponseModelImplCopyWith<$Res> {
  __$$ProjectStatsResponseModelImplCopyWithImpl(
    _$ProjectStatsResponseModelImpl _value,
    $Res Function(_$ProjectStatsResponseModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProjectStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(
      _$ProjectStatsResponseModelImpl(
        success: null == success
            ? _value.success
            : success // ignore: cast_nullable_to_non_nullable
                  as bool,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        data: null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as ProjectStatsModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectStatsResponseModelImpl implements _ProjectStatsResponseModel {
  const _$ProjectStatsResponseModelImpl({
    required this.success,
    required this.message,
    required this.data,
  });

  factory _$ProjectStatsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectStatsResponseModelImplFromJson(json);

  @override
  final bool success;
  @override
  final String message;
  @override
  final ProjectStatsModel data;

  @override
  String toString() {
    return 'ProjectStatsResponseModel(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStatsResponseModelImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of ProjectStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectStatsResponseModelImplCopyWith<_$ProjectStatsResponseModelImpl>
  get copyWith =>
      __$$ProjectStatsResponseModelImplCopyWithImpl<
        _$ProjectStatsResponseModelImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectStatsResponseModelImplToJson(this);
  }
}

abstract class _ProjectStatsResponseModel implements ProjectStatsResponseModel {
  const factory _ProjectStatsResponseModel({
    required final bool success,
    required final String message,
    required final ProjectStatsModel data,
  }) = _$ProjectStatsResponseModelImpl;

  factory _ProjectStatsResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProjectStatsResponseModelImpl.fromJson;

  @override
  bool get success;
  @override
  String get message;
  @override
  ProjectStatsModel get data;

  /// Create a copy of ProjectStatsResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectStatsResponseModelImplCopyWith<_$ProjectStatsResponseModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

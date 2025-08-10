// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_todo_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CreateTodoRequestModel _$CreateTodoRequestModelFromJson(
  Map<String, dynamic> json,
) {
  return _CreateTodoRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateTodoRequestModel {
  @JsonKey(name: 'project_id')
  String get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_name')
  String get taskName => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_description')
  String get taskDescription => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_time')
  int? get estimatedTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_unit')
  String get timeUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  String? get dueDate => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_rating')
  int? get difficultyRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'energy_level_required')
  int? get energyLevelRequired => throw _privateConstructorUsedError;
  String? get context => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_user_id')
  String? get assignedUserId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this CreateTodoRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateTodoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateTodoRequestModelCopyWith<CreateTodoRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTodoRequestModelCopyWith<$Res> {
  factory $CreateTodoRequestModelCopyWith(
    CreateTodoRequestModel value,
    $Res Function(CreateTodoRequestModel) then,
  ) = _$CreateTodoRequestModelCopyWithImpl<$Res, CreateTodoRequestModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'project_id') String projectId,
    @JsonKey(name: 'task_name') String taskName,
    @JsonKey(name: 'task_description') String taskDescription,
    String priority,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'time_unit') String timeUnit,
    @JsonKey(name: 'due_date') String? dueDate,
    List<String> tags,
    @JsonKey(name: 'difficulty_rating') int? difficultyRating,
    @JsonKey(name: 'energy_level_required') int? energyLevelRequired,
    String? context,
    @JsonKey(name: 'assigned_user_id') String? assignedUserId,
    String status,
  });
}

/// @nodoc
class _$CreateTodoRequestModelCopyWithImpl<
  $Res,
  $Val extends CreateTodoRequestModel
>
    implements $CreateTodoRequestModelCopyWith<$Res> {
  _$CreateTodoRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateTodoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? taskName = null,
    Object? taskDescription = null,
    Object? priority = null,
    Object? estimatedTime = freezed,
    Object? timeUnit = null,
    Object? dueDate = freezed,
    Object? tags = null,
    Object? difficultyRating = freezed,
    Object? energyLevelRequired = freezed,
    Object? context = freezed,
    Object? assignedUserId = freezed,
    Object? status = null,
  }) {
    return _then(
      _value.copyWith(
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            taskName: null == taskName
                ? _value.taskName
                : taskName // ignore: cast_nullable_to_non_nullable
                      as String,
            taskDescription: null == taskDescription
                ? _value.taskDescription
                : taskDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            priority: null == priority
                ? _value.priority
                : priority // ignore: cast_nullable_to_non_nullable
                      as String,
            estimatedTime: freezed == estimatedTime
                ? _value.estimatedTime
                : estimatedTime // ignore: cast_nullable_to_non_nullable
                      as int?,
            timeUnit: null == timeUnit
                ? _value.timeUnit
                : timeUnit // ignore: cast_nullable_to_non_nullable
                      as String,
            dueDate: freezed == dueDate
                ? _value.dueDate
                : dueDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            tags: null == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            difficultyRating: freezed == difficultyRating
                ? _value.difficultyRating
                : difficultyRating // ignore: cast_nullable_to_non_nullable
                      as int?,
            energyLevelRequired: freezed == energyLevelRequired
                ? _value.energyLevelRequired
                : energyLevelRequired // ignore: cast_nullable_to_non_nullable
                      as int?,
            context: freezed == context
                ? _value.context
                : context // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedUserId: freezed == assignedUserId
                ? _value.assignedUserId
                : assignedUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CreateTodoRequestModelImplCopyWith<$Res>
    implements $CreateTodoRequestModelCopyWith<$Res> {
  factory _$$CreateTodoRequestModelImplCopyWith(
    _$CreateTodoRequestModelImpl value,
    $Res Function(_$CreateTodoRequestModelImpl) then,
  ) = __$$CreateTodoRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'project_id') String projectId,
    @JsonKey(name: 'task_name') String taskName,
    @JsonKey(name: 'task_description') String taskDescription,
    String priority,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'time_unit') String timeUnit,
    @JsonKey(name: 'due_date') String? dueDate,
    List<String> tags,
    @JsonKey(name: 'difficulty_rating') int? difficultyRating,
    @JsonKey(name: 'energy_level_required') int? energyLevelRequired,
    String? context,
    @JsonKey(name: 'assigned_user_id') String? assignedUserId,
    String status,
  });
}

/// @nodoc
class __$$CreateTodoRequestModelImplCopyWithImpl<$Res>
    extends
        _$CreateTodoRequestModelCopyWithImpl<$Res, _$CreateTodoRequestModelImpl>
    implements _$$CreateTodoRequestModelImplCopyWith<$Res> {
  __$$CreateTodoRequestModelImplCopyWithImpl(
    _$CreateTodoRequestModelImpl _value,
    $Res Function(_$CreateTodoRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateTodoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? taskName = null,
    Object? taskDescription = null,
    Object? priority = null,
    Object? estimatedTime = freezed,
    Object? timeUnit = null,
    Object? dueDate = freezed,
    Object? tags = null,
    Object? difficultyRating = freezed,
    Object? energyLevelRequired = freezed,
    Object? context = freezed,
    Object? assignedUserId = freezed,
    Object? status = null,
  }) {
    return _then(
      _$CreateTodoRequestModelImpl(
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        taskName: null == taskName
            ? _value.taskName
            : taskName // ignore: cast_nullable_to_non_nullable
                  as String,
        taskDescription: null == taskDescription
            ? _value.taskDescription
            : taskDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        priority: null == priority
            ? _value.priority
            : priority // ignore: cast_nullable_to_non_nullable
                  as String,
        estimatedTime: freezed == estimatedTime
            ? _value.estimatedTime
            : estimatedTime // ignore: cast_nullable_to_non_nullable
                  as int?,
        timeUnit: null == timeUnit
            ? _value.timeUnit
            : timeUnit // ignore: cast_nullable_to_non_nullable
                  as String,
        dueDate: freezed == dueDate
            ? _value.dueDate
            : dueDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        difficultyRating: freezed == difficultyRating
            ? _value.difficultyRating
            : difficultyRating // ignore: cast_nullable_to_non_nullable
                  as int?,
        energyLevelRequired: freezed == energyLevelRequired
            ? _value.energyLevelRequired
            : energyLevelRequired // ignore: cast_nullable_to_non_nullable
                  as int?,
        context: freezed == context
            ? _value.context
            : context // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedUserId: freezed == assignedUserId
            ? _value.assignedUserId
            : assignedUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateTodoRequestModelImpl implements _CreateTodoRequestModel {
  const _$CreateTodoRequestModelImpl({
    @JsonKey(name: 'project_id') required this.projectId,
    @JsonKey(name: 'task_name') required this.taskName,
    @JsonKey(name: 'task_description') required this.taskDescription,
    this.priority = 'medium',
    @JsonKey(name: 'estimated_time') this.estimatedTime,
    @JsonKey(name: 'time_unit') this.timeUnit = 'minutes',
    @JsonKey(name: 'due_date') this.dueDate,
    final List<String> tags = const [],
    @JsonKey(name: 'difficulty_rating') this.difficultyRating,
    @JsonKey(name: 'energy_level_required') this.energyLevelRequired,
    this.context,
    @JsonKey(name: 'assigned_user_id') this.assignedUserId,
    this.status = 'backlog',
  }) : _tags = tags;

  factory _$CreateTodoRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateTodoRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'project_id')
  final String projectId;
  @override
  @JsonKey(name: 'task_name')
  final String taskName;
  @override
  @JsonKey(name: 'task_description')
  final String taskDescription;
  @override
  @JsonKey()
  final String priority;
  @override
  @JsonKey(name: 'estimated_time')
  final int? estimatedTime;
  @override
  @JsonKey(name: 'time_unit')
  final String timeUnit;
  @override
  @JsonKey(name: 'due_date')
  final String? dueDate;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey(name: 'difficulty_rating')
  final int? difficultyRating;
  @override
  @JsonKey(name: 'energy_level_required')
  final int? energyLevelRequired;
  @override
  final String? context;
  @override
  @JsonKey(name: 'assigned_user_id')
  final String? assignedUserId;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'CreateTodoRequestModel(projectId: $projectId, taskName: $taskName, taskDescription: $taskDescription, priority: $priority, estimatedTime: $estimatedTime, timeUnit: $timeUnit, dueDate: $dueDate, tags: $tags, difficultyRating: $difficultyRating, energyLevelRequired: $energyLevelRequired, context: $context, assignedUserId: $assignedUserId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTodoRequestModelImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.taskDescription, taskDescription) ||
                other.taskDescription == taskDescription) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.timeUnit, timeUnit) ||
                other.timeUnit == timeUnit) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.difficultyRating, difficultyRating) ||
                other.difficultyRating == difficultyRating) &&
            (identical(other.energyLevelRequired, energyLevelRequired) ||
                other.energyLevelRequired == energyLevelRequired) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.assignedUserId, assignedUserId) ||
                other.assignedUserId == assignedUserId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    projectId,
    taskName,
    taskDescription,
    priority,
    estimatedTime,
    timeUnit,
    dueDate,
    const DeepCollectionEquality().hash(_tags),
    difficultyRating,
    energyLevelRequired,
    context,
    assignedUserId,
    status,
  );

  /// Create a copy of CreateTodoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTodoRequestModelImplCopyWith<_$CreateTodoRequestModelImpl>
  get copyWith =>
      __$$CreateTodoRequestModelImplCopyWithImpl<_$CreateTodoRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateTodoRequestModelImplToJson(this);
  }
}

abstract class _CreateTodoRequestModel implements CreateTodoRequestModel {
  const factory _CreateTodoRequestModel({
    @JsonKey(name: 'project_id') required final String projectId,
    @JsonKey(name: 'task_name') required final String taskName,
    @JsonKey(name: 'task_description') required final String taskDescription,
    final String priority,
    @JsonKey(name: 'estimated_time') final int? estimatedTime,
    @JsonKey(name: 'time_unit') final String timeUnit,
    @JsonKey(name: 'due_date') final String? dueDate,
    final List<String> tags,
    @JsonKey(name: 'difficulty_rating') final int? difficultyRating,
    @JsonKey(name: 'energy_level_required') final int? energyLevelRequired,
    final String? context,
    @JsonKey(name: 'assigned_user_id') final String? assignedUserId,
    final String status,
  }) = _$CreateTodoRequestModelImpl;

  factory _CreateTodoRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateTodoRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'project_id')
  String get projectId;
  @override
  @JsonKey(name: 'task_name')
  String get taskName;
  @override
  @JsonKey(name: 'task_description')
  String get taskDescription;
  @override
  String get priority;
  @override
  @JsonKey(name: 'estimated_time')
  int? get estimatedTime;
  @override
  @JsonKey(name: 'time_unit')
  String get timeUnit;
  @override
  @JsonKey(name: 'due_date')
  String? get dueDate;
  @override
  List<String> get tags;
  @override
  @JsonKey(name: 'difficulty_rating')
  int? get difficultyRating;
  @override
  @JsonKey(name: 'energy_level_required')
  int? get energyLevelRequired;
  @override
  String? get context;
  @override
  @JsonKey(name: 'assigned_user_id')
  String? get assignedUserId;
  @override
  String get status;

  /// Create a copy of CreateTodoRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTodoRequestModelImplCopyWith<_$CreateTodoRequestModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

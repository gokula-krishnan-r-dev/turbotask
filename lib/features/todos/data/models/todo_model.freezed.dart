// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodoModel _$TodoModelFromJson(Map<String, dynamic> json) {
  return _TodoModel.fromJson(json);
}

/// @nodoc
mixin _$TodoModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_id')
  String get projectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_name')
  String get taskName => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_description')
  String get taskDescription => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_time')
  int? get estimatedTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_unit')
  String get timeUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_time')
  int? get actualTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date')
  String? get dueDate => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'difficulty_rating')
  int? get difficultyRating => throw _privateConstructorUsedError;
  @JsonKey(name: 'energy_level_required')
  int? get energyLevelRequired => throw _privateConstructorUsedError;
  String? get context => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_pinned')
  bool get isPinned => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_archived')
  bool get isArchived => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_user_id')
  String? get assignedUserId => throw _privateConstructorUsedError;
  @JsonKey(name: 'parent_todo_id')
  String? get parentTodoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtask_count')
  int get subtaskCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_subtask_count')
  int get completedSubtaskCount => throw _privateConstructorUsedError;

  /// Serializes this TodoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoModelCopyWith<TodoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoModelCopyWith<$Res> {
  factory $TodoModelCopyWith(TodoModel value, $Res Function(TodoModel) then) =
      _$TodoModelCopyWithImpl<$Res, TodoModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'project_id') String projectId,
    @JsonKey(name: 'task_name') String taskName,
    @JsonKey(name: 'task_description') String taskDescription,
    String status,
    String priority,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'time_unit') String timeUnit,
    @JsonKey(name: 'actual_time') int? actualTime,
    @JsonKey(name: 'due_date') String? dueDate,
    List<String> tags,
    @JsonKey(name: 'difficulty_rating') int? difficultyRating,
    @JsonKey(name: 'energy_level_required') int? energyLevelRequired,
    String? context,
    @JsonKey(name: 'is_pinned') bool isPinned,
    @JsonKey(name: 'is_archived') bool isArchived,
    @JsonKey(name: 'sort_order') int sortOrder,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'assigned_user_id') String? assignedUserId,
    @JsonKey(name: 'parent_todo_id') String? parentTodoId,
    @JsonKey(name: 'subtask_count') int subtaskCount,
    @JsonKey(name: 'completed_subtask_count') int completedSubtaskCount,
  });
}

/// @nodoc
class _$TodoModelCopyWithImpl<$Res, $Val extends TodoModel>
    implements $TodoModelCopyWith<$Res> {
  _$TodoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? taskName = null,
    Object? taskDescription = null,
    Object? status = null,
    Object? priority = null,
    Object? estimatedTime = freezed,
    Object? timeUnit = null,
    Object? actualTime = freezed,
    Object? dueDate = freezed,
    Object? tags = null,
    Object? difficultyRating = freezed,
    Object? energyLevelRequired = freezed,
    Object? context = freezed,
    Object? isPinned = null,
    Object? isArchived = null,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? completedAt = freezed,
    Object? assignedUserId = freezed,
    Object? parentTodoId = freezed,
    Object? subtaskCount = null,
    Object? completedSubtaskCount = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
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
            actualTime: freezed == actualTime
                ? _value.actualTime
                : actualTime // ignore: cast_nullable_to_non_nullable
                      as int?,
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
            isPinned: null == isPinned
                ? _value.isPinned
                : isPinned // ignore: cast_nullable_to_non_nullable
                      as bool,
            isArchived: null == isArchived
                ? _value.isArchived
                : isArchived // ignore: cast_nullable_to_non_nullable
                      as bool,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
            completedAt: freezed == completedAt
                ? _value.completedAt
                : completedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            assignedUserId: freezed == assignedUserId
                ? _value.assignedUserId
                : assignedUserId // ignore: cast_nullable_to_non_nullable
                      as String?,
            parentTodoId: freezed == parentTodoId
                ? _value.parentTodoId
                : parentTodoId // ignore: cast_nullable_to_non_nullable
                      as String?,
            subtaskCount: null == subtaskCount
                ? _value.subtaskCount
                : subtaskCount // ignore: cast_nullable_to_non_nullable
                      as int,
            completedSubtaskCount: null == completedSubtaskCount
                ? _value.completedSubtaskCount
                : completedSubtaskCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodoModelImplCopyWith<$Res>
    implements $TodoModelCopyWith<$Res> {
  factory _$$TodoModelImplCopyWith(
    _$TodoModelImpl value,
    $Res Function(_$TodoModelImpl) then,
  ) = __$$TodoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'project_id') String projectId,
    @JsonKey(name: 'task_name') String taskName,
    @JsonKey(name: 'task_description') String taskDescription,
    String status,
    String priority,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'time_unit') String timeUnit,
    @JsonKey(name: 'actual_time') int? actualTime,
    @JsonKey(name: 'due_date') String? dueDate,
    List<String> tags,
    @JsonKey(name: 'difficulty_rating') int? difficultyRating,
    @JsonKey(name: 'energy_level_required') int? energyLevelRequired,
    String? context,
    @JsonKey(name: 'is_pinned') bool isPinned,
    @JsonKey(name: 'is_archived') bool isArchived,
    @JsonKey(name: 'sort_order') int sortOrder,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'assigned_user_id') String? assignedUserId,
    @JsonKey(name: 'parent_todo_id') String? parentTodoId,
    @JsonKey(name: 'subtask_count') int subtaskCount,
    @JsonKey(name: 'completed_subtask_count') int completedSubtaskCount,
  });
}

/// @nodoc
class __$$TodoModelImplCopyWithImpl<$Res>
    extends _$TodoModelCopyWithImpl<$Res, _$TodoModelImpl>
    implements _$$TodoModelImplCopyWith<$Res> {
  __$$TodoModelImplCopyWithImpl(
    _$TodoModelImpl _value,
    $Res Function(_$TodoModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? projectId = null,
    Object? taskName = null,
    Object? taskDescription = null,
    Object? status = null,
    Object? priority = null,
    Object? estimatedTime = freezed,
    Object? timeUnit = null,
    Object? actualTime = freezed,
    Object? dueDate = freezed,
    Object? tags = null,
    Object? difficultyRating = freezed,
    Object? energyLevelRequired = freezed,
    Object? context = freezed,
    Object? isPinned = null,
    Object? isArchived = null,
    Object? sortOrder = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? completedAt = freezed,
    Object? assignedUserId = freezed,
    Object? parentTodoId = freezed,
    Object? subtaskCount = null,
    Object? completedSubtaskCount = null,
  }) {
    return _then(
      _$TodoModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
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
        actualTime: freezed == actualTime
            ? _value.actualTime
            : actualTime // ignore: cast_nullable_to_non_nullable
                  as int?,
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
        isPinned: null == isPinned
            ? _value.isPinned
            : isPinned // ignore: cast_nullable_to_non_nullable
                  as bool,
        isArchived: null == isArchived
            ? _value.isArchived
            : isArchived // ignore: cast_nullable_to_non_nullable
                  as bool,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        completedAt: freezed == completedAt
            ? _value.completedAt
            : completedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        assignedUserId: freezed == assignedUserId
            ? _value.assignedUserId
            : assignedUserId // ignore: cast_nullable_to_non_nullable
                  as String?,
        parentTodoId: freezed == parentTodoId
            ? _value.parentTodoId
            : parentTodoId // ignore: cast_nullable_to_non_nullable
                  as String?,
        subtaskCount: null == subtaskCount
            ? _value.subtaskCount
            : subtaskCount // ignore: cast_nullable_to_non_nullable
                  as int,
        completedSubtaskCount: null == completedSubtaskCount
            ? _value.completedSubtaskCount
            : completedSubtaskCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoModelImpl extends _TodoModel {
  const _$TodoModelImpl({
    required this.id,
    @JsonKey(name: 'project_id') required this.projectId,
    @JsonKey(name: 'task_name') required this.taskName,
    @JsonKey(name: 'task_description') required this.taskDescription,
    this.status = 'todo',
    this.priority = 'medium',
    @JsonKey(name: 'estimated_time') this.estimatedTime,
    @JsonKey(name: 'time_unit') this.timeUnit = 'minutes',
    @JsonKey(name: 'actual_time') this.actualTime,
    @JsonKey(name: 'due_date') this.dueDate,
    final List<String> tags = const [],
    @JsonKey(name: 'difficulty_rating') this.difficultyRating,
    @JsonKey(name: 'energy_level_required') this.energyLevelRequired,
    this.context,
    @JsonKey(name: 'is_pinned') this.isPinned = false,
    @JsonKey(name: 'is_archived') this.isArchived = false,
    @JsonKey(name: 'sort_order') this.sortOrder = 0,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    @JsonKey(name: 'completed_at') this.completedAt,
    @JsonKey(name: 'assigned_user_id') this.assignedUserId,
    @JsonKey(name: 'parent_todo_id') this.parentTodoId,
    @JsonKey(name: 'subtask_count') this.subtaskCount = 0,
    @JsonKey(name: 'completed_subtask_count') this.completedSubtaskCount = 0,
  }) : _tags = tags,
       super._();

  factory _$TodoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoModelImplFromJson(json);

  @override
  final String id;
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
  final String status;
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
  @JsonKey(name: 'actual_time')
  final int? actualTime;
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
  @JsonKey(name: 'is_pinned')
  final bool isPinned;
  @override
  @JsonKey(name: 'is_archived')
  final bool isArchived;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'completed_at')
  final String? completedAt;
  @override
  @JsonKey(name: 'assigned_user_id')
  final String? assignedUserId;
  @override
  @JsonKey(name: 'parent_todo_id')
  final String? parentTodoId;
  @override
  @JsonKey(name: 'subtask_count')
  final int subtaskCount;
  @override
  @JsonKey(name: 'completed_subtask_count')
  final int completedSubtaskCount;

  @override
  String toString() {
    return 'TodoModel(id: $id, projectId: $projectId, taskName: $taskName, taskDescription: $taskDescription, status: $status, priority: $priority, estimatedTime: $estimatedTime, timeUnit: $timeUnit, actualTime: $actualTime, dueDate: $dueDate, tags: $tags, difficultyRating: $difficultyRating, energyLevelRequired: $energyLevelRequired, context: $context, isPinned: $isPinned, isArchived: $isArchived, sortOrder: $sortOrder, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt, assignedUserId: $assignedUserId, parentTodoId: $parentTodoId, subtaskCount: $subtaskCount, completedSubtaskCount: $completedSubtaskCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.taskName, taskName) ||
                other.taskName == taskName) &&
            (identical(other.taskDescription, taskDescription) ||
                other.taskDescription == taskDescription) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.timeUnit, timeUnit) ||
                other.timeUnit == timeUnit) &&
            (identical(other.actualTime, actualTime) ||
                other.actualTime == actualTime) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.difficultyRating, difficultyRating) ||
                other.difficultyRating == difficultyRating) &&
            (identical(other.energyLevelRequired, energyLevelRequired) ||
                other.energyLevelRequired == energyLevelRequired) &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.isPinned, isPinned) ||
                other.isPinned == isPinned) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.assignedUserId, assignedUserId) ||
                other.assignedUserId == assignedUserId) &&
            (identical(other.parentTodoId, parentTodoId) ||
                other.parentTodoId == parentTodoId) &&
            (identical(other.subtaskCount, subtaskCount) ||
                other.subtaskCount == subtaskCount) &&
            (identical(other.completedSubtaskCount, completedSubtaskCount) ||
                other.completedSubtaskCount == completedSubtaskCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    projectId,
    taskName,
    taskDescription,
    status,
    priority,
    estimatedTime,
    timeUnit,
    actualTime,
    dueDate,
    const DeepCollectionEquality().hash(_tags),
    difficultyRating,
    energyLevelRequired,
    context,
    isPinned,
    isArchived,
    sortOrder,
    createdAt,
    updatedAt,
    completedAt,
    assignedUserId,
    parentTodoId,
    subtaskCount,
    completedSubtaskCount,
  ]);

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoModelImplCopyWith<_$TodoModelImpl> get copyWith =>
      __$$TodoModelImplCopyWithImpl<_$TodoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoModelImplToJson(this);
  }
}

abstract class _TodoModel extends TodoModel {
  const factory _TodoModel({
    required final String id,
    @JsonKey(name: 'project_id') required final String projectId,
    @JsonKey(name: 'task_name') required final String taskName,
    @JsonKey(name: 'task_description') required final String taskDescription,
    final String status,
    final String priority,
    @JsonKey(name: 'estimated_time') final int? estimatedTime,
    @JsonKey(name: 'time_unit') final String timeUnit,
    @JsonKey(name: 'actual_time') final int? actualTime,
    @JsonKey(name: 'due_date') final String? dueDate,
    final List<String> tags,
    @JsonKey(name: 'difficulty_rating') final int? difficultyRating,
    @JsonKey(name: 'energy_level_required') final int? energyLevelRequired,
    final String? context,
    @JsonKey(name: 'is_pinned') final bool isPinned,
    @JsonKey(name: 'is_archived') final bool isArchived,
    @JsonKey(name: 'sort_order') final int sortOrder,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
    @JsonKey(name: 'completed_at') final String? completedAt,
    @JsonKey(name: 'assigned_user_id') final String? assignedUserId,
    @JsonKey(name: 'parent_todo_id') final String? parentTodoId,
    @JsonKey(name: 'subtask_count') final int subtaskCount,
    @JsonKey(name: 'completed_subtask_count') final int completedSubtaskCount,
  }) = _$TodoModelImpl;
  const _TodoModel._() : super._();

  factory _TodoModel.fromJson(Map<String, dynamic> json) =
      _$TodoModelImpl.fromJson;

  @override
  String get id;
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
  String get status;
  @override
  String get priority;
  @override
  @JsonKey(name: 'estimated_time')
  int? get estimatedTime;
  @override
  @JsonKey(name: 'time_unit')
  String get timeUnit;
  @override
  @JsonKey(name: 'actual_time')
  int? get actualTime;
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
  @JsonKey(name: 'is_pinned')
  bool get isPinned;
  @override
  @JsonKey(name: 'is_archived')
  bool get isArchived;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'completed_at')
  String? get completedAt;
  @override
  @JsonKey(name: 'assigned_user_id')
  String? get assignedUserId;
  @override
  @JsonKey(name: 'parent_todo_id')
  String? get parentTodoId;
  @override
  @JsonKey(name: 'subtask_count')
  int get subtaskCount;
  @override
  @JsonKey(name: 'completed_subtask_count')
  int get completedSubtaskCount;

  /// Create a copy of TodoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoModelImplCopyWith<_$TodoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

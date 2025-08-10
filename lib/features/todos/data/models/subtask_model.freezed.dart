// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subtask_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SubtaskModel _$SubtaskModelFromJson(Map<String, dynamic> json) {
  return _SubtaskModel.fromJson(json);
}

/// @nodoc
mixin _$SubtaskModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'todo_id')
  String get todoId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_time')
  int? get estimatedTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_time')
  int? get actualTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'sort_order')
  int get sortOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_archived')
  bool get isArchived => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'assigned_user_id')
  String? get assignedUserId => throw _privateConstructorUsedError;

  /// Serializes this SubtaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubtaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubtaskModelCopyWith<SubtaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubtaskModelCopyWith<$Res> {
  factory $SubtaskModelCopyWith(
    SubtaskModel value,
    $Res Function(SubtaskModel) then,
  ) = _$SubtaskModelCopyWithImpl<$Res, SubtaskModel>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'todo_id') String todoId,
    String name,
    String description,
    String status,
    String priority,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'actual_time') int? actualTime,
    @JsonKey(name: 'sort_order') int sortOrder,
    @JsonKey(name: 'is_archived') bool isArchived,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'assigned_user_id') String? assignedUserId,
  });
}

/// @nodoc
class _$SubtaskModelCopyWithImpl<$Res, $Val extends SubtaskModel>
    implements $SubtaskModelCopyWith<$Res> {
  _$SubtaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubtaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? todoId = null,
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? priority = null,
    Object? estimatedTime = freezed,
    Object? actualTime = freezed,
    Object? sortOrder = null,
    Object? isArchived = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? completedAt = freezed,
    Object? assignedUserId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            todoId: null == todoId
                ? _value.todoId
                : todoId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
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
            actualTime: freezed == actualTime
                ? _value.actualTime
                : actualTime // ignore: cast_nullable_to_non_nullable
                      as int?,
            sortOrder: null == sortOrder
                ? _value.sortOrder
                : sortOrder // ignore: cast_nullable_to_non_nullable
                      as int,
            isArchived: null == isArchived
                ? _value.isArchived
                : isArchived // ignore: cast_nullable_to_non_nullable
                      as bool,
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
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SubtaskModelImplCopyWith<$Res>
    implements $SubtaskModelCopyWith<$Res> {
  factory _$$SubtaskModelImplCopyWith(
    _$SubtaskModelImpl value,
    $Res Function(_$SubtaskModelImpl) then,
  ) = __$$SubtaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'todo_id') String todoId,
    String name,
    String description,
    String status,
    String priority,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'actual_time') int? actualTime,
    @JsonKey(name: 'sort_order') int sortOrder,
    @JsonKey(name: 'is_archived') bool isArchived,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'updated_at') String updatedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'assigned_user_id') String? assignedUserId,
  });
}

/// @nodoc
class __$$SubtaskModelImplCopyWithImpl<$Res>
    extends _$SubtaskModelCopyWithImpl<$Res, _$SubtaskModelImpl>
    implements _$$SubtaskModelImplCopyWith<$Res> {
  __$$SubtaskModelImplCopyWithImpl(
    _$SubtaskModelImpl _value,
    $Res Function(_$SubtaskModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SubtaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? todoId = null,
    Object? name = null,
    Object? description = null,
    Object? status = null,
    Object? priority = null,
    Object? estimatedTime = freezed,
    Object? actualTime = freezed,
    Object? sortOrder = null,
    Object? isArchived = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? completedAt = freezed,
    Object? assignedUserId = freezed,
  }) {
    return _then(
      _$SubtaskModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        todoId: null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
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
        actualTime: freezed == actualTime
            ? _value.actualTime
            : actualTime // ignore: cast_nullable_to_non_nullable
                  as int?,
        sortOrder: null == sortOrder
            ? _value.sortOrder
            : sortOrder // ignore: cast_nullable_to_non_nullable
                  as int,
        isArchived: null == isArchived
            ? _value.isArchived
            : isArchived // ignore: cast_nullable_to_non_nullable
                  as bool,
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
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SubtaskModelImpl extends _SubtaskModel {
  const _$SubtaskModelImpl({
    required this.id,
    @JsonKey(name: 'todo_id') required this.todoId,
    required this.name,
    required this.description,
    this.status = 'todo',
    this.priority = 'medium',
    @JsonKey(name: 'estimated_time') this.estimatedTime,
    @JsonKey(name: 'actual_time') this.actualTime,
    @JsonKey(name: 'sort_order') this.sortOrder = 0,
    @JsonKey(name: 'is_archived') this.isArchived = false,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
    @JsonKey(name: 'completed_at') this.completedAt,
    @JsonKey(name: 'assigned_user_id') this.assignedUserId,
  }) : super._();

  factory _$SubtaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubtaskModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'todo_id')
  final String todoId;
  @override
  final String name;
  @override
  final String description;
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
  @JsonKey(name: 'actual_time')
  final int? actualTime;
  @override
  @JsonKey(name: 'sort_order')
  final int sortOrder;
  @override
  @JsonKey(name: 'is_archived')
  final bool isArchived;
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
  String toString() {
    return 'SubtaskModel(id: $id, todoId: $todoId, name: $name, description: $description, status: $status, priority: $priority, estimatedTime: $estimatedTime, actualTime: $actualTime, sortOrder: $sortOrder, isArchived: $isArchived, createdAt: $createdAt, updatedAt: $updatedAt, completedAt: $completedAt, assignedUserId: $assignedUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubtaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.actualTime, actualTime) ||
                other.actualTime == actualTime) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.assignedUserId, assignedUserId) ||
                other.assignedUserId == assignedUserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    todoId,
    name,
    description,
    status,
    priority,
    estimatedTime,
    actualTime,
    sortOrder,
    isArchived,
    createdAt,
    updatedAt,
    completedAt,
    assignedUserId,
  );

  /// Create a copy of SubtaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubtaskModelImplCopyWith<_$SubtaskModelImpl> get copyWith =>
      __$$SubtaskModelImplCopyWithImpl<_$SubtaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubtaskModelImplToJson(this);
  }
}

abstract class _SubtaskModel extends SubtaskModel {
  const factory _SubtaskModel({
    required final String id,
    @JsonKey(name: 'todo_id') required final String todoId,
    required final String name,
    required final String description,
    final String status,
    final String priority,
    @JsonKey(name: 'estimated_time') final int? estimatedTime,
    @JsonKey(name: 'actual_time') final int? actualTime,
    @JsonKey(name: 'sort_order') final int sortOrder,
    @JsonKey(name: 'is_archived') final bool isArchived,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'updated_at') required final String updatedAt,
    @JsonKey(name: 'completed_at') final String? completedAt,
    @JsonKey(name: 'assigned_user_id') final String? assignedUserId,
  }) = _$SubtaskModelImpl;
  const _SubtaskModel._() : super._();

  factory _SubtaskModel.fromJson(Map<String, dynamic> json) =
      _$SubtaskModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'todo_id')
  String get todoId;
  @override
  String get name;
  @override
  String get description;
  @override
  String get status;
  @override
  String get priority;
  @override
  @JsonKey(name: 'estimated_time')
  int? get estimatedTime;
  @override
  @JsonKey(name: 'actual_time')
  int? get actualTime;
  @override
  @JsonKey(name: 'sort_order')
  int get sortOrder;
  @override
  @JsonKey(name: 'is_archived')
  bool get isArchived;
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

  /// Create a copy of SubtaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubtaskModelImplCopyWith<_$SubtaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

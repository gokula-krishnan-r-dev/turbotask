// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'break_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BreakSession _$BreakSessionFromJson(Map<String, dynamic> json) {
  return _BreakSession.fromJson(json);
}

/// @nodoc
mixin _$BreakSession {
  String get id => throw _privateConstructorUsedError;
  String get todoId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError; // Duration in seconds
  String get breakType => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Todo? get todo => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Project? get project => throw _privateConstructorUsedError;

  /// Serializes this BreakSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreakSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreakSessionCopyWith<BreakSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakSessionCopyWith<$Res> {
  factory $BreakSessionCopyWith(
    BreakSession value,
    $Res Function(BreakSession) then,
  ) = _$BreakSessionCopyWithImpl<$Res, BreakSession>;
  @useResult
  $Res call({
    String id,
    String todoId,
    String projectId,
    String userId,
    DateTime startTime,
    DateTime? endTime,
    int duration,
    String breakType,
    String notes,
    DateTime createdAt,
    DateTime updatedAt,
    @JsonKey(includeFromJson: false, includeToJson: false) Todo? todo,
    @JsonKey(includeFromJson: false, includeToJson: false) Project? project,
  });
}

/// @nodoc
class _$BreakSessionCopyWithImpl<$Res, $Val extends BreakSession>
    implements $BreakSessionCopyWith<$Res> {
  _$BreakSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreakSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? todoId = null,
    Object? projectId = null,
    Object? userId = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? duration = null,
    Object? breakType = null,
    Object? notes = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? todo = freezed,
    Object? project = freezed,
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
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            startTime: null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endTime: freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            duration: null == duration
                ? _value.duration
                : duration // ignore: cast_nullable_to_non_nullable
                      as int,
            breakType: null == breakType
                ? _value.breakType
                : breakType // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            todo: freezed == todo
                ? _value.todo
                : todo // ignore: cast_nullable_to_non_nullable
                      as Todo?,
            project: freezed == project
                ? _value.project
                : project // ignore: cast_nullable_to_non_nullable
                      as Project?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BreakSessionImplCopyWith<$Res>
    implements $BreakSessionCopyWith<$Res> {
  factory _$$BreakSessionImplCopyWith(
    _$BreakSessionImpl value,
    $Res Function(_$BreakSessionImpl) then,
  ) = __$$BreakSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String todoId,
    String projectId,
    String userId,
    DateTime startTime,
    DateTime? endTime,
    int duration,
    String breakType,
    String notes,
    DateTime createdAt,
    DateTime updatedAt,
    @JsonKey(includeFromJson: false, includeToJson: false) Todo? todo,
    @JsonKey(includeFromJson: false, includeToJson: false) Project? project,
  });
}

/// @nodoc
class __$$BreakSessionImplCopyWithImpl<$Res>
    extends _$BreakSessionCopyWithImpl<$Res, _$BreakSessionImpl>
    implements _$$BreakSessionImplCopyWith<$Res> {
  __$$BreakSessionImplCopyWithImpl(
    _$BreakSessionImpl _value,
    $Res Function(_$BreakSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? todoId = null,
    Object? projectId = null,
    Object? userId = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? duration = null,
    Object? breakType = null,
    Object? notes = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? todo = freezed,
    Object? project = freezed,
  }) {
    return _then(
      _$BreakSessionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        todoId: null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        startTime: null == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endTime: freezed == endTime
            ? _value.endTime
            : endTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
        breakType: null == breakType
            ? _value.breakType
            : breakType // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        todo: freezed == todo
            ? _value.todo
            : todo // ignore: cast_nullable_to_non_nullable
                  as Todo?,
        project: freezed == project
            ? _value.project
            : project // ignore: cast_nullable_to_non_nullable
                  as Project?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BreakSessionImpl implements _BreakSession {
  const _$BreakSessionImpl({
    required this.id,
    required this.todoId,
    required this.projectId,
    required this.userId,
    required this.startTime,
    this.endTime,
    required this.duration,
    this.breakType = 'manual',
    this.notes = '',
    required this.createdAt,
    required this.updatedAt,
    @JsonKey(includeFromJson: false, includeToJson: false) this.todo,
    @JsonKey(includeFromJson: false, includeToJson: false) this.project,
  });

  factory _$BreakSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreakSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String todoId;
  @override
  final String projectId;
  @override
  final String userId;
  @override
  final DateTime startTime;
  @override
  final DateTime? endTime;
  @override
  final int duration;
  // Duration in seconds
  @override
  @JsonKey()
  final String breakType;
  @override
  @JsonKey()
  final String notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Todo? todo;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Project? project;

  @override
  String toString() {
    return 'BreakSession(id: $id, todoId: $todoId, projectId: $projectId, userId: $userId, startTime: $startTime, endTime: $endTime, duration: $duration, breakType: $breakType, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, todo: $todo, project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.breakType, breakType) ||
                other.breakType == breakType) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.todo, todo) || other.todo == todo) &&
            (identical(other.project, project) || other.project == project));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    todoId,
    projectId,
    userId,
    startTime,
    endTime,
    duration,
    breakType,
    notes,
    createdAt,
    updatedAt,
    todo,
    project,
  );

  /// Create a copy of BreakSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakSessionImplCopyWith<_$BreakSessionImpl> get copyWith =>
      __$$BreakSessionImplCopyWithImpl<_$BreakSessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BreakSessionImplToJson(this);
  }
}

abstract class _BreakSession implements BreakSession {
  const factory _BreakSession({
    required final String id,
    required final String todoId,
    required final String projectId,
    required final String userId,
    required final DateTime startTime,
    final DateTime? endTime,
    required final int duration,
    final String breakType,
    final String notes,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    @JsonKey(includeFromJson: false, includeToJson: false) final Todo? todo,
    @JsonKey(includeFromJson: false, includeToJson: false)
    final Project? project,
  }) = _$BreakSessionImpl;

  factory _BreakSession.fromJson(Map<String, dynamic> json) =
      _$BreakSessionImpl.fromJson;

  @override
  String get id;
  @override
  String get todoId;
  @override
  String get projectId;
  @override
  String get userId;
  @override
  DateTime get startTime;
  @override
  DateTime? get endTime;
  @override
  int get duration; // Duration in seconds
  @override
  String get breakType;
  @override
  String get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Todo? get todo;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Project? get project;

  /// Create a copy of BreakSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreakSessionImplCopyWith<_$BreakSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

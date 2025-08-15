// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'break_request_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StartBreakRequest _$StartBreakRequestFromJson(Map<String, dynamic> json) {
  return _StartBreakRequest.fromJson(json);
}

/// @nodoc
mixin _$StartBreakRequest {
  String get todoId => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get breakType => throw _privateConstructorUsedError;
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this StartBreakRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StartBreakRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StartBreakRequestCopyWith<StartBreakRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartBreakRequestCopyWith<$Res> {
  factory $StartBreakRequestCopyWith(
    StartBreakRequest value,
    $Res Function(StartBreakRequest) then,
  ) = _$StartBreakRequestCopyWithImpl<$Res, StartBreakRequest>;
  @useResult
  $Res call({String todoId, String projectId, String breakType, String notes});
}

/// @nodoc
class _$StartBreakRequestCopyWithImpl<$Res, $Val extends StartBreakRequest>
    implements $StartBreakRequestCopyWith<$Res> {
  _$StartBreakRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StartBreakRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
    Object? projectId = null,
    Object? breakType = null,
    Object? notes = null,
  }) {
    return _then(
      _value.copyWith(
            todoId: null == todoId
                ? _value.todoId
                : todoId // ignore: cast_nullable_to_non_nullable
                      as String,
            projectId: null == projectId
                ? _value.projectId
                : projectId // ignore: cast_nullable_to_non_nullable
                      as String,
            breakType: null == breakType
                ? _value.breakType
                : breakType // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StartBreakRequestImplCopyWith<$Res>
    implements $StartBreakRequestCopyWith<$Res> {
  factory _$$StartBreakRequestImplCopyWith(
    _$StartBreakRequestImpl value,
    $Res Function(_$StartBreakRequestImpl) then,
  ) = __$$StartBreakRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String todoId, String projectId, String breakType, String notes});
}

/// @nodoc
class __$$StartBreakRequestImplCopyWithImpl<$Res>
    extends _$StartBreakRequestCopyWithImpl<$Res, _$StartBreakRequestImpl>
    implements _$$StartBreakRequestImplCopyWith<$Res> {
  __$$StartBreakRequestImplCopyWithImpl(
    _$StartBreakRequestImpl _value,
    $Res Function(_$StartBreakRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StartBreakRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
    Object? projectId = null,
    Object? breakType = null,
    Object? notes = null,
  }) {
    return _then(
      _$StartBreakRequestImpl(
        todoId: null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
        projectId: null == projectId
            ? _value.projectId
            : projectId // ignore: cast_nullable_to_non_nullable
                  as String,
        breakType: null == breakType
            ? _value.breakType
            : breakType // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StartBreakRequestImpl implements _StartBreakRequest {
  const _$StartBreakRequestImpl({
    required this.todoId,
    required this.projectId,
    this.breakType = 'manual',
    this.notes = '',
  });

  factory _$StartBreakRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$StartBreakRequestImplFromJson(json);

  @override
  final String todoId;
  @override
  final String projectId;
  @override
  @JsonKey()
  final String breakType;
  @override
  @JsonKey()
  final String notes;

  @override
  String toString() {
    return 'StartBreakRequest(todoId: $todoId, projectId: $projectId, breakType: $breakType, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartBreakRequestImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.breakType, breakType) ||
                other.breakType == breakType) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, todoId, projectId, breakType, notes);

  /// Create a copy of StartBreakRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartBreakRequestImplCopyWith<_$StartBreakRequestImpl> get copyWith =>
      __$$StartBreakRequestImplCopyWithImpl<_$StartBreakRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StartBreakRequestImplToJson(this);
  }
}

abstract class _StartBreakRequest implements StartBreakRequest {
  const factory _StartBreakRequest({
    required final String todoId,
    required final String projectId,
    final String breakType,
    final String notes,
  }) = _$StartBreakRequestImpl;

  factory _StartBreakRequest.fromJson(Map<String, dynamic> json) =
      _$StartBreakRequestImpl.fromJson;

  @override
  String get todoId;
  @override
  String get projectId;
  @override
  String get breakType;
  @override
  String get notes;

  /// Create a copy of StartBreakRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartBreakRequestImplCopyWith<_$StartBreakRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StopBreakRequest _$StopBreakRequestFromJson(Map<String, dynamic> json) {
  return _StopBreakRequest.fromJson(json);
}

/// @nodoc
mixin _$StopBreakRequest {
  String get notes => throw _privateConstructorUsedError;

  /// Serializes this StopBreakRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StopBreakRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StopBreakRequestCopyWith<StopBreakRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StopBreakRequestCopyWith<$Res> {
  factory $StopBreakRequestCopyWith(
    StopBreakRequest value,
    $Res Function(StopBreakRequest) then,
  ) = _$StopBreakRequestCopyWithImpl<$Res, StopBreakRequest>;
  @useResult
  $Res call({String notes});
}

/// @nodoc
class _$StopBreakRequestCopyWithImpl<$Res, $Val extends StopBreakRequest>
    implements $StopBreakRequestCopyWith<$Res> {
  _$StopBreakRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StopBreakRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notes = null}) {
    return _then(
      _value.copyWith(
            notes: null == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StopBreakRequestImplCopyWith<$Res>
    implements $StopBreakRequestCopyWith<$Res> {
  factory _$$StopBreakRequestImplCopyWith(
    _$StopBreakRequestImpl value,
    $Res Function(_$StopBreakRequestImpl) then,
  ) = __$$StopBreakRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String notes});
}

/// @nodoc
class __$$StopBreakRequestImplCopyWithImpl<$Res>
    extends _$StopBreakRequestCopyWithImpl<$Res, _$StopBreakRequestImpl>
    implements _$$StopBreakRequestImplCopyWith<$Res> {
  __$$StopBreakRequestImplCopyWithImpl(
    _$StopBreakRequestImpl _value,
    $Res Function(_$StopBreakRequestImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StopBreakRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? notes = null}) {
    return _then(
      _$StopBreakRequestImpl(
        notes: null == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StopBreakRequestImpl implements _StopBreakRequest {
  const _$StopBreakRequestImpl({this.notes = ''});

  factory _$StopBreakRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$StopBreakRequestImplFromJson(json);

  @override
  @JsonKey()
  final String notes;

  @override
  String toString() {
    return 'StopBreakRequest(notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StopBreakRequestImpl &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, notes);

  /// Create a copy of StopBreakRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StopBreakRequestImplCopyWith<_$StopBreakRequestImpl> get copyWith =>
      __$$StopBreakRequestImplCopyWithImpl<_$StopBreakRequestImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StopBreakRequestImplToJson(this);
  }
}

abstract class _StopBreakRequest implements StopBreakRequest {
  const factory _StopBreakRequest({final String notes}) =
      _$StopBreakRequestImpl;

  factory _StopBreakRequest.fromJson(Map<String, dynamic> json) =
      _$StopBreakRequestImpl.fromJson;

  @override
  String get notes;

  /// Create a copy of StopBreakRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StopBreakRequestImplCopyWith<_$StopBreakRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BreakApiResponse _$BreakApiResponseFromJson(Map<String, dynamic> json) {
  return _BreakApiResponse.fromJson(json);
}

/// @nodoc
mixin _$BreakApiResponse {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this BreakApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreakApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreakApiResponseCopyWith<BreakApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakApiResponseCopyWith<$Res> {
  factory $BreakApiResponseCopyWith(
    BreakApiResponse value,
    $Res Function(BreakApiResponse) then,
  ) = _$BreakApiResponseCopyWithImpl<$Res, BreakApiResponse>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class _$BreakApiResponseCopyWithImpl<$Res, $Val extends BreakApiResponse>
    implements $BreakApiResponseCopyWith<$Res> {
  _$BreakApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreakApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BreakApiResponseImplCopyWith<$Res>
    implements $BreakApiResponseCopyWith<$Res> {
  factory _$$BreakApiResponseImplCopyWith(
    _$BreakApiResponseImpl value,
    $Res Function(_$BreakApiResponseImpl) then,
  ) = __$$BreakApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$BreakApiResponseImplCopyWithImpl<$Res>
    extends _$BreakApiResponseCopyWithImpl<$Res, _$BreakApiResponseImpl>
    implements _$$BreakApiResponseImplCopyWith<$Res> {
  __$$BreakApiResponseImplCopyWithImpl(
    _$BreakApiResponseImpl _value,
    $Res Function(_$BreakApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$BreakApiResponseImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BreakApiResponseImpl implements _BreakApiResponse {
  const _$BreakApiResponseImpl({required final Map<String, dynamic> data})
    : _data = data;

  factory _$BreakApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreakApiResponseImplFromJson(json);

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'BreakApiResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakApiResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of BreakApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakApiResponseImplCopyWith<_$BreakApiResponseImpl> get copyWith =>
      __$$BreakApiResponseImplCopyWithImpl<_$BreakApiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BreakApiResponseImplToJson(this);
  }
}

abstract class _BreakApiResponse implements BreakApiResponse {
  const factory _BreakApiResponse({required final Map<String, dynamic> data}) =
      _$BreakApiResponseImpl;

  factory _BreakApiResponse.fromJson(Map<String, dynamic> json) =
      _$BreakApiResponseImpl.fromJson;

  @override
  Map<String, dynamic> get data;

  /// Create a copy of BreakApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreakApiResponseImplCopyWith<_$BreakApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BreakListApiResponse _$BreakListApiResponseFromJson(Map<String, dynamic> json) {
  return _BreakListApiResponse.fromJson(json);
}

/// @nodoc
mixin _$BreakListApiResponse {
  List<Map<String, dynamic>> get data => throw _privateConstructorUsedError;

  /// Serializes this BreakListApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreakListApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreakListApiResponseCopyWith<BreakListApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakListApiResponseCopyWith<$Res> {
  factory $BreakListApiResponseCopyWith(
    BreakListApiResponse value,
    $Res Function(BreakListApiResponse) then,
  ) = _$BreakListApiResponseCopyWithImpl<$Res, BreakListApiResponse>;
  @useResult
  $Res call({List<Map<String, dynamic>> data});
}

/// @nodoc
class _$BreakListApiResponseCopyWithImpl<
  $Res,
  $Val extends BreakListApiResponse
>
    implements $BreakListApiResponseCopyWith<$Res> {
  _$BreakListApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreakListApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as List<Map<String, dynamic>>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BreakListApiResponseImplCopyWith<$Res>
    implements $BreakListApiResponseCopyWith<$Res> {
  factory _$$BreakListApiResponseImplCopyWith(
    _$BreakListApiResponseImpl value,
    $Res Function(_$BreakListApiResponseImpl) then,
  ) = __$$BreakListApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Map<String, dynamic>> data});
}

/// @nodoc
class __$$BreakListApiResponseImplCopyWithImpl<$Res>
    extends _$BreakListApiResponseCopyWithImpl<$Res, _$BreakListApiResponseImpl>
    implements _$$BreakListApiResponseImplCopyWith<$Res> {
  __$$BreakListApiResponseImplCopyWithImpl(
    _$BreakListApiResponseImpl _value,
    $Res Function(_$BreakListApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakListApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$BreakListApiResponseImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as List<Map<String, dynamic>>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BreakListApiResponseImpl implements _BreakListApiResponse {
  const _$BreakListApiResponseImpl({
    required final List<Map<String, dynamic>> data,
  }) : _data = data;

  factory _$BreakListApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreakListApiResponseImplFromJson(json);

  final List<Map<String, dynamic>> _data;
  @override
  List<Map<String, dynamic>> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BreakListApiResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakListApiResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of BreakListApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakListApiResponseImplCopyWith<_$BreakListApiResponseImpl>
  get copyWith =>
      __$$BreakListApiResponseImplCopyWithImpl<_$BreakListApiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BreakListApiResponseImplToJson(this);
  }
}

abstract class _BreakListApiResponse implements BreakListApiResponse {
  const factory _BreakListApiResponse({
    required final List<Map<String, dynamic>> data,
  }) = _$BreakListApiResponseImpl;

  factory _BreakListApiResponse.fromJson(Map<String, dynamic> json) =
      _$BreakListApiResponseImpl.fromJson;

  @override
  List<Map<String, dynamic>> get data;

  /// Create a copy of BreakListApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreakListApiResponseImplCopyWith<_$BreakListApiResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

BreakStatsApiResponse _$BreakStatsApiResponseFromJson(
  Map<String, dynamic> json,
) {
  return _BreakStatsApiResponse.fromJson(json);
}

/// @nodoc
mixin _$BreakStatsApiResponse {
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this BreakStatsApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BreakStatsApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BreakStatsApiResponseCopyWith<BreakStatsApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BreakStatsApiResponseCopyWith<$Res> {
  factory $BreakStatsApiResponseCopyWith(
    BreakStatsApiResponse value,
    $Res Function(BreakStatsApiResponse) then,
  ) = _$BreakStatsApiResponseCopyWithImpl<$Res, BreakStatsApiResponse>;
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class _$BreakStatsApiResponseCopyWithImpl<
  $Res,
  $Val extends BreakStatsApiResponse
>
    implements $BreakStatsApiResponseCopyWith<$Res> {
  _$BreakStatsApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BreakStatsApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _value.copyWith(
            data: null == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as Map<String, dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BreakStatsApiResponseImplCopyWith<$Res>
    implements $BreakStatsApiResponseCopyWith<$Res> {
  factory _$$BreakStatsApiResponseImplCopyWith(
    _$BreakStatsApiResponseImpl value,
    $Res Function(_$BreakStatsApiResponseImpl) then,
  ) = __$$BreakStatsApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, dynamic> data});
}

/// @nodoc
class __$$BreakStatsApiResponseImplCopyWithImpl<$Res>
    extends
        _$BreakStatsApiResponseCopyWithImpl<$Res, _$BreakStatsApiResponseImpl>
    implements _$$BreakStatsApiResponseImplCopyWith<$Res> {
  __$$BreakStatsApiResponseImplCopyWithImpl(
    _$BreakStatsApiResponseImpl _value,
    $Res Function(_$BreakStatsApiResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BreakStatsApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$BreakStatsApiResponseImpl(
        data: null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BreakStatsApiResponseImpl implements _BreakStatsApiResponse {
  const _$BreakStatsApiResponseImpl({required final Map<String, dynamic> data})
    : _data = data;

  factory _$BreakStatsApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BreakStatsApiResponseImplFromJson(json);

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'BreakStatsApiResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BreakStatsApiResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of BreakStatsApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BreakStatsApiResponseImplCopyWith<_$BreakStatsApiResponseImpl>
  get copyWith =>
      __$$BreakStatsApiResponseImplCopyWithImpl<_$BreakStatsApiResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$BreakStatsApiResponseImplToJson(this);
  }
}

abstract class _BreakStatsApiResponse implements BreakStatsApiResponse {
  const factory _BreakStatsApiResponse({
    required final Map<String, dynamic> data,
  }) = _$BreakStatsApiResponseImpl;

  factory _BreakStatsApiResponse.fromJson(Map<String, dynamic> json) =
      _$BreakStatsApiResponseImpl.fromJson;

  @override
  Map<String, dynamic> get data;

  /// Create a copy of BreakStatsApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BreakStatsApiResponseImplCopyWith<_$BreakStatsApiResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OtpRequestModel _$OtpRequestModelFromJson(Map<String, dynamic> json) {
  return _OtpRequestModel.fromJson(json);
}

/// @nodoc
mixin _$OtpRequestModel {
  String get email => throw _privateConstructorUsedError;

  /// Serializes this OtpRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpRequestModelCopyWith<OtpRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpRequestModelCopyWith<$Res> {
  factory $OtpRequestModelCopyWith(
    OtpRequestModel value,
    $Res Function(OtpRequestModel) then,
  ) = _$OtpRequestModelCopyWithImpl<$Res, OtpRequestModel>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$OtpRequestModelCopyWithImpl<$Res, $Val extends OtpRequestModel>
    implements $OtpRequestModelCopyWith<$Res> {
  _$OtpRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OtpRequestModelImplCopyWith<$Res>
    implements $OtpRequestModelCopyWith<$Res> {
  factory _$$OtpRequestModelImplCopyWith(
    _$OtpRequestModelImpl value,
    $Res Function(_$OtpRequestModelImpl) then,
  ) = __$$OtpRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$OtpRequestModelImplCopyWithImpl<$Res>
    extends _$OtpRequestModelCopyWithImpl<$Res, _$OtpRequestModelImpl>
    implements _$$OtpRequestModelImplCopyWith<$Res> {
  __$$OtpRequestModelImplCopyWithImpl(
    _$OtpRequestModelImpl _value,
    $Res Function(_$OtpRequestModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$OtpRequestModelImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpRequestModelImpl extends _OtpRequestModel {
  const _$OtpRequestModelImpl({required this.email}) : super._();

  factory _$OtpRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpRequestModelImplFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'OtpRequestModel(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpRequestModelImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of OtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpRequestModelImplCopyWith<_$OtpRequestModelImpl> get copyWith =>
      __$$OtpRequestModelImplCopyWithImpl<_$OtpRequestModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpRequestModelImplToJson(this);
  }
}

abstract class _OtpRequestModel extends OtpRequestModel {
  const factory _OtpRequestModel({required final String email}) =
      _$OtpRequestModelImpl;
  const _OtpRequestModel._() : super._();

  factory _OtpRequestModel.fromJson(Map<String, dynamic> json) =
      _$OtpRequestModelImpl.fromJson;

  @override
  String get email;

  /// Create a copy of OtpRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpRequestModelImplCopyWith<_$OtpRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

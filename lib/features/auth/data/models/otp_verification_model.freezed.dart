// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_verification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OtpVerificationModel _$OtpVerificationModelFromJson(Map<String, dynamic> json) {
  return _OtpVerificationModel.fromJson(json);
}

/// @nodoc
mixin _$OtpVerificationModel {
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Serializes this OtpVerificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpVerificationModelCopyWith<OtpVerificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpVerificationModelCopyWith<$Res> {
  factory $OtpVerificationModelCopyWith(
    OtpVerificationModel value,
    $Res Function(OtpVerificationModel) then,
  ) = _$OtpVerificationModelCopyWithImpl<$Res, OtpVerificationModel>;
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class _$OtpVerificationModelCopyWithImpl<
  $Res,
  $Val extends OtpVerificationModel
>
    implements $OtpVerificationModelCopyWith<$Res> {
  _$OtpVerificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? code = null}) {
    return _then(
      _value.copyWith(
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            code: null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OtpVerificationModelImplCopyWith<$Res>
    implements $OtpVerificationModelCopyWith<$Res> {
  factory _$$OtpVerificationModelImplCopyWith(
    _$OtpVerificationModelImpl value,
    $Res Function(_$OtpVerificationModelImpl) then,
  ) = __$$OtpVerificationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String code});
}

/// @nodoc
class __$$OtpVerificationModelImplCopyWithImpl<$Res>
    extends _$OtpVerificationModelCopyWithImpl<$Res, _$OtpVerificationModelImpl>
    implements _$$OtpVerificationModelImplCopyWith<$Res> {
  __$$OtpVerificationModelImplCopyWithImpl(
    _$OtpVerificationModelImpl _value,
    $Res Function(_$OtpVerificationModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? code = null}) {
    return _then(
      _$OtpVerificationModelImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpVerificationModelImpl extends _OtpVerificationModel {
  const _$OtpVerificationModelImpl({required this.email, required this.code})
    : super._();

  factory _$OtpVerificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpVerificationModelImplFromJson(json);

  @override
  final String email;
  @override
  final String code;

  @override
  String toString() {
    return 'OtpVerificationModel(email: $email, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpVerificationModelImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, code);

  /// Create a copy of OtpVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpVerificationModelImplCopyWith<_$OtpVerificationModelImpl>
  get copyWith =>
      __$$OtpVerificationModelImplCopyWithImpl<_$OtpVerificationModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpVerificationModelImplToJson(this);
  }
}

abstract class _OtpVerificationModel extends OtpVerificationModel {
  const factory _OtpVerificationModel({
    required final String email,
    required final String code,
  }) = _$OtpVerificationModelImpl;
  const _OtpVerificationModel._() : super._();

  factory _OtpVerificationModel.fromJson(Map<String, dynamic> json) =
      _$OtpVerificationModelImpl.fromJson;

  @override
  String get email;
  @override
  String get code;

  /// Create a copy of OtpVerificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpVerificationModelImplCopyWith<_$OtpVerificationModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}

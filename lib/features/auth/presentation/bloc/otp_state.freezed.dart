// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OtpState {
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  OtpStatus get status => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isCodeComplete => throw _privateConstructorUsedError;
  bool get canResend => throw _privateConstructorUsedError;
  int get resendCountdown => throw _privateConstructorUsedError;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpStateCopyWith<OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res, OtpState>;
  @useResult
  $Res call({
    String email,
    String code,
    OtpStatus status,
    String? errorMessage,
    bool isCodeComplete,
    bool canResend,
    int resendCountdown,
  });
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res, $Val extends OtpState>
    implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? status = null,
    Object? errorMessage = freezed,
    Object? isCodeComplete = null,
    Object? canResend = null,
    Object? resendCountdown = null,
  }) {
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
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as OtpStatus,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            isCodeComplete: null == isCodeComplete
                ? _value.isCodeComplete
                : isCodeComplete // ignore: cast_nullable_to_non_nullable
                      as bool,
            canResend: null == canResend
                ? _value.canResend
                : canResend // ignore: cast_nullable_to_non_nullable
                      as bool,
            resendCountdown: null == resendCountdown
                ? _value.resendCountdown
                : resendCountdown // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OtpStateImplCopyWith<$Res>
    implements $OtpStateCopyWith<$Res> {
  factory _$$OtpStateImplCopyWith(
    _$OtpStateImpl value,
    $Res Function(_$OtpStateImpl) then,
  ) = __$$OtpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String email,
    String code,
    OtpStatus status,
    String? errorMessage,
    bool isCodeComplete,
    bool canResend,
    int resendCountdown,
  });
}

/// @nodoc
class __$$OtpStateImplCopyWithImpl<$Res>
    extends _$OtpStateCopyWithImpl<$Res, _$OtpStateImpl>
    implements _$$OtpStateImplCopyWith<$Res> {
  __$$OtpStateImplCopyWithImpl(
    _$OtpStateImpl _value,
    $Res Function(_$OtpStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? status = null,
    Object? errorMessage = freezed,
    Object? isCodeComplete = null,
    Object? canResend = null,
    Object? resendCountdown = null,
  }) {
    return _then(
      _$OtpStateImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as OtpStatus,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        isCodeComplete: null == isCodeComplete
            ? _value.isCodeComplete
            : isCodeComplete // ignore: cast_nullable_to_non_nullable
                  as bool,
        canResend: null == canResend
            ? _value.canResend
            : canResend // ignore: cast_nullable_to_non_nullable
                  as bool,
        resendCountdown: null == resendCountdown
            ? _value.resendCountdown
            : resendCountdown // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$OtpStateImpl extends _OtpState {
  const _$OtpStateImpl({
    required this.email,
    this.code = '',
    this.status = OtpStatus.initial,
    this.errorMessage,
    this.isCodeComplete = false,
    this.canResend = false,
    this.resendCountdown = 60,
  }) : super._();

  @override
  final String email;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final OtpStatus status;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isCodeComplete;
  @override
  @JsonKey()
  final bool canResend;
  @override
  @JsonKey()
  final int resendCountdown;

  @override
  String toString() {
    return 'OtpState(email: $email, code: $code, status: $status, errorMessage: $errorMessage, isCodeComplete: $isCodeComplete, canResend: $canResend, resendCountdown: $resendCountdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isCodeComplete, isCodeComplete) ||
                other.isCodeComplete == isCodeComplete) &&
            (identical(other.canResend, canResend) ||
                other.canResend == canResend) &&
            (identical(other.resendCountdown, resendCountdown) ||
                other.resendCountdown == resendCountdown));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    email,
    code,
    status,
    errorMessage,
    isCodeComplete,
    canResend,
    resendCountdown,
  );

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      __$$OtpStateImplCopyWithImpl<_$OtpStateImpl>(this, _$identity);
}

abstract class _OtpState extends OtpState {
  const factory _OtpState({
    required final String email,
    final String code,
    final OtpStatus status,
    final String? errorMessage,
    final bool isCodeComplete,
    final bool canResend,
    final int resendCountdown,
  }) = _$OtpStateImpl;
  const _OtpState._() : super._();

  @override
  String get email;
  @override
  String get code;
  @override
  OtpStatus get status;
  @override
  String? get errorMessage;
  @override
  bool get isCodeComplete;
  @override
  bool get canResend;
  @override
  int get resendCountdown;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpStateImplCopyWith<_$OtpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

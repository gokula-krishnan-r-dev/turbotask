// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OtpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) initialized,
    required TResult Function(String code) codeChanged,
    required TResult Function() verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function() clearError,
    required TResult Function() backToLogin,
    required TResult Function() autoVerify,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? initialized,
    TResult? Function(String code)? codeChanged,
    TResult? Function()? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? clearError,
    TResult? Function()? backToLogin,
    TResult? Function()? autoVerify,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? initialized,
    TResult Function(String code)? codeChanged,
    TResult Function()? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function()? clearError,
    TResult Function()? backToLogin,
    TResult Function()? autoVerify,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_ClearError value) clearError,
    required TResult Function(_BackToLogin value) backToLogin,
    required TResult Function(_AutoVerify value) autoVerify,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CodeChanged value)? codeChanged,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_ClearError value)? clearError,
    TResult? Function(_BackToLogin value)? backToLogin,
    TResult? Function(_AutoVerify value)? autoVerify,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_ClearError value)? clearError,
    TResult Function(_BackToLogin value)? backToLogin,
    TResult Function(_AutoVerify value)? autoVerify,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpEventCopyWith<$Res> {
  factory $OtpEventCopyWith(OtpEvent value, $Res Function(OtpEvent) then) =
      _$OtpEventCopyWithImpl<$Res, OtpEvent>;
}

/// @nodoc
class _$OtpEventCopyWithImpl<$Res, $Val extends OtpEvent>
    implements $OtpEventCopyWith<$Res> {
  _$OtpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializedImplCopyWith<$Res> {
  factory _$$InitializedImplCopyWith(
    _$InitializedImpl value,
    $Res Function(_$InitializedImpl) then,
  ) = __$$InitializedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$InitializedImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$InitializedImpl>
    implements _$$InitializedImplCopyWith<$Res> {
  __$$InitializedImplCopyWithImpl(
    _$InitializedImpl _value,
    $Res Function(_$InitializedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$InitializedImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$InitializedImpl implements _Initialized {
  const _$InitializedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'OtpEvent.initialized(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      __$$InitializedImplCopyWithImpl<_$InitializedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) initialized,
    required TResult Function(String code) codeChanged,
    required TResult Function() verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function() clearError,
    required TResult Function() backToLogin,
    required TResult Function() autoVerify,
  }) {
    return initialized(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? initialized,
    TResult? Function(String code)? codeChanged,
    TResult? Function()? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? clearError,
    TResult? Function()? backToLogin,
    TResult? Function()? autoVerify,
  }) {
    return initialized?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? initialized,
    TResult Function(String code)? codeChanged,
    TResult Function()? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function()? clearError,
    TResult Function()? backToLogin,
    TResult Function()? autoVerify,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_ClearError value) clearError,
    required TResult Function(_BackToLogin value) backToLogin,
    required TResult Function(_AutoVerify value) autoVerify,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CodeChanged value)? codeChanged,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_ClearError value)? clearError,
    TResult? Function(_BackToLogin value)? backToLogin,
    TResult? Function(_AutoVerify value)? autoVerify,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_ClearError value)? clearError,
    TResult Function(_BackToLogin value)? backToLogin,
    TResult Function(_AutoVerify value)? autoVerify,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements OtpEvent {
  const factory _Initialized(final String email) = _$InitializedImpl;

  String get email;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializedImplCopyWith<_$InitializedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CodeChangedImplCopyWith<$Res> {
  factory _$$CodeChangedImplCopyWith(
    _$CodeChangedImpl value,
    $Res Function(_$CodeChangedImpl) then,
  ) = __$$CodeChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$CodeChangedImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$CodeChangedImpl>
    implements _$$CodeChangedImplCopyWith<$Res> {
  __$$CodeChangedImplCopyWithImpl(
    _$CodeChangedImpl _value,
    $Res Function(_$CodeChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? code = null}) {
    return _then(
      _$CodeChangedImpl(
        null == code
            ? _value.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CodeChangedImpl implements _CodeChanged {
  const _$CodeChangedImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'OtpEvent.codeChanged(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeChangedImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeChangedImplCopyWith<_$CodeChangedImpl> get copyWith =>
      __$$CodeChangedImplCopyWithImpl<_$CodeChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) initialized,
    required TResult Function(String code) codeChanged,
    required TResult Function() verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function() clearError,
    required TResult Function() backToLogin,
    required TResult Function() autoVerify,
  }) {
    return codeChanged(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? initialized,
    TResult? Function(String code)? codeChanged,
    TResult? Function()? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? clearError,
    TResult? Function()? backToLogin,
    TResult? Function()? autoVerify,
  }) {
    return codeChanged?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? initialized,
    TResult Function(String code)? codeChanged,
    TResult Function()? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function()? clearError,
    TResult Function()? backToLogin,
    TResult Function()? autoVerify,
    required TResult orElse(),
  }) {
    if (codeChanged != null) {
      return codeChanged(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_ClearError value) clearError,
    required TResult Function(_BackToLogin value) backToLogin,
    required TResult Function(_AutoVerify value) autoVerify,
  }) {
    return codeChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CodeChanged value)? codeChanged,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_ClearError value)? clearError,
    TResult? Function(_BackToLogin value)? backToLogin,
    TResult? Function(_AutoVerify value)? autoVerify,
  }) {
    return codeChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_ClearError value)? clearError,
    TResult Function(_BackToLogin value)? backToLogin,
    TResult Function(_AutoVerify value)? autoVerify,
    required TResult orElse(),
  }) {
    if (codeChanged != null) {
      return codeChanged(this);
    }
    return orElse();
  }
}

abstract class _CodeChanged implements OtpEvent {
  const factory _CodeChanged(final String code) = _$CodeChangedImpl;

  String get code;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CodeChangedImplCopyWith<_$CodeChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOtpImplCopyWith<$Res> {
  factory _$$VerifyOtpImplCopyWith(
    _$VerifyOtpImpl value,
    $Res Function(_$VerifyOtpImpl) then,
  ) = __$$VerifyOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyOtpImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$VerifyOtpImpl>
    implements _$$VerifyOtpImplCopyWith<$Res> {
  __$$VerifyOtpImplCopyWithImpl(
    _$VerifyOtpImpl _value,
    $Res Function(_$VerifyOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifyOtpImpl implements _VerifyOtp {
  const _$VerifyOtpImpl();

  @override
  String toString() {
    return 'OtpEvent.verifyOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) initialized,
    required TResult Function(String code) codeChanged,
    required TResult Function() verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function() clearError,
    required TResult Function() backToLogin,
    required TResult Function() autoVerify,
  }) {
    return verifyOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? initialized,
    TResult? Function(String code)? codeChanged,
    TResult? Function()? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? clearError,
    TResult? Function()? backToLogin,
    TResult? Function()? autoVerify,
  }) {
    return verifyOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? initialized,
    TResult Function(String code)? codeChanged,
    TResult Function()? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function()? clearError,
    TResult Function()? backToLogin,
    TResult Function()? autoVerify,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_ClearError value) clearError,
    required TResult Function(_BackToLogin value) backToLogin,
    required TResult Function(_AutoVerify value) autoVerify,
  }) {
    return verifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CodeChanged value)? codeChanged,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_ClearError value)? clearError,
    TResult? Function(_BackToLogin value)? backToLogin,
    TResult? Function(_AutoVerify value)? autoVerify,
  }) {
    return verifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_ClearError value)? clearError,
    TResult Function(_BackToLogin value)? backToLogin,
    TResult Function(_AutoVerify value)? autoVerify,
    required TResult orElse(),
  }) {
    if (verifyOtp != null) {
      return verifyOtp(this);
    }
    return orElse();
  }
}

abstract class _VerifyOtp implements OtpEvent {
  const factory _VerifyOtp() = _$VerifyOtpImpl;
}

/// @nodoc
abstract class _$$ResendOtpImplCopyWith<$Res> {
  factory _$$ResendOtpImplCopyWith(
    _$ResendOtpImpl value,
    $Res Function(_$ResendOtpImpl) then,
  ) = __$$ResendOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendOtpImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$ResendOtpImpl>
    implements _$$ResendOtpImplCopyWith<$Res> {
  __$$ResendOtpImplCopyWithImpl(
    _$ResendOtpImpl _value,
    $Res Function(_$ResendOtpImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResendOtpImpl implements _ResendOtp {
  const _$ResendOtpImpl();

  @override
  String toString() {
    return 'OtpEvent.resendOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResendOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) initialized,
    required TResult Function(String code) codeChanged,
    required TResult Function() verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function() clearError,
    required TResult Function() backToLogin,
    required TResult Function() autoVerify,
  }) {
    return resendOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? initialized,
    TResult? Function(String code)? codeChanged,
    TResult? Function()? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? clearError,
    TResult? Function()? backToLogin,
    TResult? Function()? autoVerify,
  }) {
    return resendOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? initialized,
    TResult Function(String code)? codeChanged,
    TResult Function()? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function()? clearError,
    TResult Function()? backToLogin,
    TResult Function()? autoVerify,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_ClearError value) clearError,
    required TResult Function(_BackToLogin value) backToLogin,
    required TResult Function(_AutoVerify value) autoVerify,
  }) {
    return resendOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CodeChanged value)? codeChanged,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_ClearError value)? clearError,
    TResult? Function(_BackToLogin value)? backToLogin,
    TResult? Function(_AutoVerify value)? autoVerify,
  }) {
    return resendOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_ClearError value)? clearError,
    TResult Function(_BackToLogin value)? backToLogin,
    TResult Function(_AutoVerify value)? autoVerify,
    required TResult orElse(),
  }) {
    if (resendOtp != null) {
      return resendOtp(this);
    }
    return orElse();
  }
}

abstract class _ResendOtp implements OtpEvent {
  const factory _ResendOtp() = _$ResendOtpImpl;
}

/// @nodoc
abstract class _$$ClearErrorImplCopyWith<$Res> {
  factory _$$ClearErrorImplCopyWith(
    _$ClearErrorImpl value,
    $Res Function(_$ClearErrorImpl) then,
  ) = __$$ClearErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearErrorImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$ClearErrorImpl>
    implements _$$ClearErrorImplCopyWith<$Res> {
  __$$ClearErrorImplCopyWithImpl(
    _$ClearErrorImpl _value,
    $Res Function(_$ClearErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearErrorImpl implements _ClearError {
  const _$ClearErrorImpl();

  @override
  String toString() {
    return 'OtpEvent.clearError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) initialized,
    required TResult Function(String code) codeChanged,
    required TResult Function() verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function() clearError,
    required TResult Function() backToLogin,
    required TResult Function() autoVerify,
  }) {
    return clearError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? initialized,
    TResult? Function(String code)? codeChanged,
    TResult? Function()? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? clearError,
    TResult? Function()? backToLogin,
    TResult? Function()? autoVerify,
  }) {
    return clearError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? initialized,
    TResult Function(String code)? codeChanged,
    TResult Function()? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function()? clearError,
    TResult Function()? backToLogin,
    TResult Function()? autoVerify,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_ClearError value) clearError,
    required TResult Function(_BackToLogin value) backToLogin,
    required TResult Function(_AutoVerify value) autoVerify,
  }) {
    return clearError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CodeChanged value)? codeChanged,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_ClearError value)? clearError,
    TResult? Function(_BackToLogin value)? backToLogin,
    TResult? Function(_AutoVerify value)? autoVerify,
  }) {
    return clearError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_ClearError value)? clearError,
    TResult Function(_BackToLogin value)? backToLogin,
    TResult Function(_AutoVerify value)? autoVerify,
    required TResult orElse(),
  }) {
    if (clearError != null) {
      return clearError(this);
    }
    return orElse();
  }
}

abstract class _ClearError implements OtpEvent {
  const factory _ClearError() = _$ClearErrorImpl;
}

/// @nodoc
abstract class _$$BackToLoginImplCopyWith<$Res> {
  factory _$$BackToLoginImplCopyWith(
    _$BackToLoginImpl value,
    $Res Function(_$BackToLoginImpl) then,
  ) = __$$BackToLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BackToLoginImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$BackToLoginImpl>
    implements _$$BackToLoginImplCopyWith<$Res> {
  __$$BackToLoginImplCopyWithImpl(
    _$BackToLoginImpl _value,
    $Res Function(_$BackToLoginImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BackToLoginImpl implements _BackToLogin {
  const _$BackToLoginImpl();

  @override
  String toString() {
    return 'OtpEvent.backToLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BackToLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) initialized,
    required TResult Function(String code) codeChanged,
    required TResult Function() verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function() clearError,
    required TResult Function() backToLogin,
    required TResult Function() autoVerify,
  }) {
    return backToLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? initialized,
    TResult? Function(String code)? codeChanged,
    TResult? Function()? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? clearError,
    TResult? Function()? backToLogin,
    TResult? Function()? autoVerify,
  }) {
    return backToLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? initialized,
    TResult Function(String code)? codeChanged,
    TResult Function()? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function()? clearError,
    TResult Function()? backToLogin,
    TResult Function()? autoVerify,
    required TResult orElse(),
  }) {
    if (backToLogin != null) {
      return backToLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_ClearError value) clearError,
    required TResult Function(_BackToLogin value) backToLogin,
    required TResult Function(_AutoVerify value) autoVerify,
  }) {
    return backToLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CodeChanged value)? codeChanged,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_ClearError value)? clearError,
    TResult? Function(_BackToLogin value)? backToLogin,
    TResult? Function(_AutoVerify value)? autoVerify,
  }) {
    return backToLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_ClearError value)? clearError,
    TResult Function(_BackToLogin value)? backToLogin,
    TResult Function(_AutoVerify value)? autoVerify,
    required TResult orElse(),
  }) {
    if (backToLogin != null) {
      return backToLogin(this);
    }
    return orElse();
  }
}

abstract class _BackToLogin implements OtpEvent {
  const factory _BackToLogin() = _$BackToLoginImpl;
}

/// @nodoc
abstract class _$$AutoVerifyImplCopyWith<$Res> {
  factory _$$AutoVerifyImplCopyWith(
    _$AutoVerifyImpl value,
    $Res Function(_$AutoVerifyImpl) then,
  ) = __$$AutoVerifyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AutoVerifyImplCopyWithImpl<$Res>
    extends _$OtpEventCopyWithImpl<$Res, _$AutoVerifyImpl>
    implements _$$AutoVerifyImplCopyWith<$Res> {
  __$$AutoVerifyImplCopyWithImpl(
    _$AutoVerifyImpl _value,
    $Res Function(_$AutoVerifyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AutoVerifyImpl implements _AutoVerify {
  const _$AutoVerifyImpl();

  @override
  String toString() {
    return 'OtpEvent.autoVerify()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AutoVerifyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) initialized,
    required TResult Function(String code) codeChanged,
    required TResult Function() verifyOtp,
    required TResult Function() resendOtp,
    required TResult Function() clearError,
    required TResult Function() backToLogin,
    required TResult Function() autoVerify,
  }) {
    return autoVerify();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? initialized,
    TResult? Function(String code)? codeChanged,
    TResult? Function()? verifyOtp,
    TResult? Function()? resendOtp,
    TResult? Function()? clearError,
    TResult? Function()? backToLogin,
    TResult? Function()? autoVerify,
  }) {
    return autoVerify?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? initialized,
    TResult Function(String code)? codeChanged,
    TResult Function()? verifyOtp,
    TResult Function()? resendOtp,
    TResult Function()? clearError,
    TResult Function()? backToLogin,
    TResult Function()? autoVerify,
    required TResult orElse(),
  }) {
    if (autoVerify != null) {
      return autoVerify();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_CodeChanged value) codeChanged,
    required TResult Function(_VerifyOtp value) verifyOtp,
    required TResult Function(_ResendOtp value) resendOtp,
    required TResult Function(_ClearError value) clearError,
    required TResult Function(_BackToLogin value) backToLogin,
    required TResult Function(_AutoVerify value) autoVerify,
  }) {
    return autoVerify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_CodeChanged value)? codeChanged,
    TResult? Function(_VerifyOtp value)? verifyOtp,
    TResult? Function(_ResendOtp value)? resendOtp,
    TResult? Function(_ClearError value)? clearError,
    TResult? Function(_BackToLogin value)? backToLogin,
    TResult? Function(_AutoVerify value)? autoVerify,
  }) {
    return autoVerify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_CodeChanged value)? codeChanged,
    TResult Function(_VerifyOtp value)? verifyOtp,
    TResult Function(_ResendOtp value)? resendOtp,
    TResult Function(_ClearError value)? clearError,
    TResult Function(_BackToLogin value)? backToLogin,
    TResult Function(_AutoVerify value)? autoVerify,
    required TResult orElse(),
  }) {
    if (autoVerify != null) {
      return autoVerify(this);
    }
    return orElse();
  }
}

abstract class _AutoVerify implements OtpEvent {
  const factory _AutoVerify() = _$AutoVerifyImpl;
}

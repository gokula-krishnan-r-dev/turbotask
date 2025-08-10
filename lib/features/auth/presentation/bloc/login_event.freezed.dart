// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() loginSubmitted,
    required TResult Function() resetForm,
    required TResult Function() registerTapped,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? loginSubmitted,
    TResult? Function()? resetForm,
    TResult? Function()? registerTapped,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? loginSubmitted,
    TResult Function()? resetForm,
    TResult Function()? registerTapped,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_LoginSubmitted value) loginSubmitted,
    required TResult Function(_ResetForm value) resetForm,
    required TResult Function(_RegisterTapped value) registerTapped,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_LoginSubmitted value)? loginSubmitted,
    TResult? Function(_ResetForm value)? resetForm,
    TResult? Function(_RegisterTapped value)? registerTapped,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_LoginSubmitted value)? loginSubmitted,
    TResult Function(_ResetForm value)? resetForm,
    TResult Function(_RegisterTapped value)? registerTapped,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
    LoginEvent value,
    $Res Function(LoginEvent) then,
  ) = _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EmailChangedImplCopyWith<$Res> {
  factory _$$EmailChangedImplCopyWith(
    _$EmailChangedImpl value,
    $Res Function(_$EmailChangedImpl) then,
  ) = __$$EmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailChangedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$EmailChangedImpl>
    implements _$$EmailChangedImplCopyWith<$Res> {
  __$$EmailChangedImplCopyWithImpl(
    _$EmailChangedImpl _value,
    $Res Function(_$EmailChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$EmailChangedImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$EmailChangedImpl implements _EmailChanged {
  const _$EmailChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'LoginEvent.emailChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      __$$EmailChangedImplCopyWithImpl<_$EmailChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() loginSubmitted,
    required TResult Function() resetForm,
    required TResult Function() registerTapped,
  }) {
    return emailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? loginSubmitted,
    TResult? Function()? resetForm,
    TResult? Function()? registerTapped,
  }) {
    return emailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? loginSubmitted,
    TResult Function()? resetForm,
    TResult Function()? registerTapped,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_LoginSubmitted value) loginSubmitted,
    required TResult Function(_ResetForm value) resetForm,
    required TResult Function(_RegisterTapped value) registerTapped,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_LoginSubmitted value)? loginSubmitted,
    TResult? Function(_ResetForm value)? resetForm,
    TResult? Function(_RegisterTapped value)? registerTapped,
  }) {
    return emailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_LoginSubmitted value)? loginSubmitted,
    TResult Function(_ResetForm value)? resetForm,
    TResult Function(_RegisterTapped value)? registerTapped,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailChanged implements LoginEvent {
  const factory _EmailChanged(final String email) = _$EmailChangedImpl;

  String get email;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailChangedImplCopyWith<_$EmailChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginSubmittedImplCopyWith<$Res> {
  factory _$$LoginSubmittedImplCopyWith(
    _$LoginSubmittedImpl value,
    $Res Function(_$LoginSubmittedImpl) then,
  ) = __$$LoginSubmittedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginSubmittedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginSubmittedImpl>
    implements _$$LoginSubmittedImplCopyWith<$Res> {
  __$$LoginSubmittedImplCopyWithImpl(
    _$LoginSubmittedImpl _value,
    $Res Function(_$LoginSubmittedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginSubmittedImpl implements _LoginSubmitted {
  const _$LoginSubmittedImpl();

  @override
  String toString() {
    return 'LoginEvent.loginSubmitted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginSubmittedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() loginSubmitted,
    required TResult Function() resetForm,
    required TResult Function() registerTapped,
  }) {
    return loginSubmitted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? loginSubmitted,
    TResult? Function()? resetForm,
    TResult? Function()? registerTapped,
  }) {
    return loginSubmitted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? loginSubmitted,
    TResult Function()? resetForm,
    TResult Function()? registerTapped,
    required TResult orElse(),
  }) {
    if (loginSubmitted != null) {
      return loginSubmitted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_LoginSubmitted value) loginSubmitted,
    required TResult Function(_ResetForm value) resetForm,
    required TResult Function(_RegisterTapped value) registerTapped,
  }) {
    return loginSubmitted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_LoginSubmitted value)? loginSubmitted,
    TResult? Function(_ResetForm value)? resetForm,
    TResult? Function(_RegisterTapped value)? registerTapped,
  }) {
    return loginSubmitted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_LoginSubmitted value)? loginSubmitted,
    TResult Function(_ResetForm value)? resetForm,
    TResult Function(_RegisterTapped value)? registerTapped,
    required TResult orElse(),
  }) {
    if (loginSubmitted != null) {
      return loginSubmitted(this);
    }
    return orElse();
  }
}

abstract class _LoginSubmitted implements LoginEvent {
  const factory _LoginSubmitted() = _$LoginSubmittedImpl;
}

/// @nodoc
abstract class _$$ResetFormImplCopyWith<$Res> {
  factory _$$ResetFormImplCopyWith(
    _$ResetFormImpl value,
    $Res Function(_$ResetFormImpl) then,
  ) = __$$ResetFormImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetFormImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$ResetFormImpl>
    implements _$$ResetFormImplCopyWith<$Res> {
  __$$ResetFormImplCopyWithImpl(
    _$ResetFormImpl _value,
    $Res Function(_$ResetFormImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetFormImpl implements _ResetForm {
  const _$ResetFormImpl();

  @override
  String toString() {
    return 'LoginEvent.resetForm()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetFormImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() loginSubmitted,
    required TResult Function() resetForm,
    required TResult Function() registerTapped,
  }) {
    return resetForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? loginSubmitted,
    TResult? Function()? resetForm,
    TResult? Function()? registerTapped,
  }) {
    return resetForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? loginSubmitted,
    TResult Function()? resetForm,
    TResult Function()? registerTapped,
    required TResult orElse(),
  }) {
    if (resetForm != null) {
      return resetForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_LoginSubmitted value) loginSubmitted,
    required TResult Function(_ResetForm value) resetForm,
    required TResult Function(_RegisterTapped value) registerTapped,
  }) {
    return resetForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_LoginSubmitted value)? loginSubmitted,
    TResult? Function(_ResetForm value)? resetForm,
    TResult? Function(_RegisterTapped value)? registerTapped,
  }) {
    return resetForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_LoginSubmitted value)? loginSubmitted,
    TResult Function(_ResetForm value)? resetForm,
    TResult Function(_RegisterTapped value)? registerTapped,
    required TResult orElse(),
  }) {
    if (resetForm != null) {
      return resetForm(this);
    }
    return orElse();
  }
}

abstract class _ResetForm implements LoginEvent {
  const factory _ResetForm() = _$ResetFormImpl;
}

/// @nodoc
abstract class _$$RegisterTappedImplCopyWith<$Res> {
  factory _$$RegisterTappedImplCopyWith(
    _$RegisterTappedImpl value,
    $Res Function(_$RegisterTappedImpl) then,
  ) = __$$RegisterTappedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterTappedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$RegisterTappedImpl>
    implements _$$RegisterTappedImplCopyWith<$Res> {
  __$$RegisterTappedImplCopyWithImpl(
    _$RegisterTappedImpl _value,
    $Res Function(_$RegisterTappedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterTappedImpl implements _RegisterTapped {
  const _$RegisterTappedImpl();

  @override
  String toString() {
    return 'LoginEvent.registerTapped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterTappedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailChanged,
    required TResult Function() loginSubmitted,
    required TResult Function() resetForm,
    required TResult Function() registerTapped,
  }) {
    return registerTapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailChanged,
    TResult? Function()? loginSubmitted,
    TResult? Function()? resetForm,
    TResult? Function()? registerTapped,
  }) {
    return registerTapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailChanged,
    TResult Function()? loginSubmitted,
    TResult Function()? resetForm,
    TResult Function()? registerTapped,
    required TResult orElse(),
  }) {
    if (registerTapped != null) {
      return registerTapped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailChanged value) emailChanged,
    required TResult Function(_LoginSubmitted value) loginSubmitted,
    required TResult Function(_ResetForm value) resetForm,
    required TResult Function(_RegisterTapped value) registerTapped,
  }) {
    return registerTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailChanged value)? emailChanged,
    TResult? Function(_LoginSubmitted value)? loginSubmitted,
    TResult? Function(_ResetForm value)? resetForm,
    TResult? Function(_RegisterTapped value)? registerTapped,
  }) {
    return registerTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailChanged value)? emailChanged,
    TResult Function(_LoginSubmitted value)? loginSubmitted,
    TResult Function(_ResetForm value)? resetForm,
    TResult Function(_RegisterTapped value)? registerTapped,
    required TResult orElse(),
  }) {
    if (registerTapped != null) {
      return registerTapped(this);
    }
    return orElse();
  }
}

abstract class _RegisterTapped implements LoginEvent {
  const factory _RegisterTapped() = _$RegisterTappedImpl;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthStateEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuthenticated, User? user)
    authStateChanged,
    required TResult Function(User user) userUpdated,
    required TResult Function() logout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAuthenticated, User? user)? authStateChanged,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? logout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuthenticated, User? user)? authStateChanged,
    TResult Function(User user)? userUpdated,
    TResult Function()? logout,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateChanged value) authStateChanged,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Logout value) logout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateChanged value)? authStateChanged,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Logout value)? logout,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateChanged value)? authStateChanged,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateEventCopyWith<$Res> {
  factory $AuthStateEventCopyWith(
    AuthStateEvent value,
    $Res Function(AuthStateEvent) then,
  ) = _$AuthStateEventCopyWithImpl<$Res, AuthStateEvent>;
}

/// @nodoc
class _$AuthStateEventCopyWithImpl<$Res, $Val extends AuthStateEvent>
    implements $AuthStateEventCopyWith<$Res> {
  _$AuthStateEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStateEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthStateChangedImplCopyWith<$Res> {
  factory _$$AuthStateChangedImplCopyWith(
    _$AuthStateChangedImpl value,
    $Res Function(_$AuthStateChangedImpl) then,
  ) = __$$AuthStateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isAuthenticated, User? user});
}

/// @nodoc
class __$$AuthStateChangedImplCopyWithImpl<$Res>
    extends _$AuthStateEventCopyWithImpl<$Res, _$AuthStateChangedImpl>
    implements _$$AuthStateChangedImplCopyWith<$Res> {
  __$$AuthStateChangedImplCopyWithImpl(
    _$AuthStateChangedImpl _value,
    $Res Function(_$AuthStateChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthStateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isAuthenticated = null, Object? user = freezed}) {
    return _then(
      _$AuthStateChangedImpl(
        isAuthenticated: null == isAuthenticated
            ? _value.isAuthenticated
            : isAuthenticated // ignore: cast_nullable_to_non_nullable
                  as bool,
        user: freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as User?,
      ),
    );
  }
}

/// @nodoc

class _$AuthStateChangedImpl implements _AuthStateChanged {
  const _$AuthStateChangedImpl({required this.isAuthenticated, this.user});

  @override
  final bool isAuthenticated;
  @override
  final User? user;

  @override
  String toString() {
    return 'AuthStateEvent.authStateChanged(isAuthenticated: $isAuthenticated, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateChangedImpl &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                other.isAuthenticated == isAuthenticated) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuthenticated, user);

  /// Create a copy of AuthStateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateChangedImplCopyWith<_$AuthStateChangedImpl> get copyWith =>
      __$$AuthStateChangedImplCopyWithImpl<_$AuthStateChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuthenticated, User? user)
    authStateChanged,
    required TResult Function(User user) userUpdated,
    required TResult Function() logout,
  }) {
    return authStateChanged(isAuthenticated, user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAuthenticated, User? user)? authStateChanged,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? logout,
  }) {
    return authStateChanged?.call(isAuthenticated, user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuthenticated, User? user)? authStateChanged,
    TResult Function(User user)? userUpdated,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(isAuthenticated, user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateChanged value) authStateChanged,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Logout value) logout,
  }) {
    return authStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateChanged value)? authStateChanged,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Logout value)? logout,
  }) {
    return authStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateChanged value)? authStateChanged,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(this);
    }
    return orElse();
  }
}

abstract class _AuthStateChanged implements AuthStateEvent {
  const factory _AuthStateChanged({
    required final bool isAuthenticated,
    final User? user,
  }) = _$AuthStateChangedImpl;

  bool get isAuthenticated;
  User? get user;

  /// Create a copy of AuthStateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateChangedImplCopyWith<_$AuthStateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserUpdatedImplCopyWith<$Res> {
  factory _$$UserUpdatedImplCopyWith(
    _$UserUpdatedImpl value,
    $Res Function(_$UserUpdatedImpl) then,
  ) = __$$UserUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$UserUpdatedImplCopyWithImpl<$Res>
    extends _$AuthStateEventCopyWithImpl<$Res, _$UserUpdatedImpl>
    implements _$$UserUpdatedImplCopyWith<$Res> {
  __$$UserUpdatedImplCopyWithImpl(
    _$UserUpdatedImpl _value,
    $Res Function(_$UserUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthStateEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$UserUpdatedImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as User,
      ),
    );
  }
}

/// @nodoc

class _$UserUpdatedImpl implements _UserUpdated {
  const _$UserUpdatedImpl({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'AuthStateEvent.userUpdated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthStateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdatedImplCopyWith<_$UserUpdatedImpl> get copyWith =>
      __$$UserUpdatedImplCopyWithImpl<_$UserUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuthenticated, User? user)
    authStateChanged,
    required TResult Function(User user) userUpdated,
    required TResult Function() logout,
  }) {
    return userUpdated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAuthenticated, User? user)? authStateChanged,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? logout,
  }) {
    return userUpdated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuthenticated, User? user)? authStateChanged,
    TResult Function(User user)? userUpdated,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (userUpdated != null) {
      return userUpdated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateChanged value) authStateChanged,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Logout value) logout,
  }) {
    return userUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateChanged value)? authStateChanged,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Logout value)? logout,
  }) {
    return userUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateChanged value)? authStateChanged,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (userUpdated != null) {
      return userUpdated(this);
    }
    return orElse();
  }
}

abstract class _UserUpdated implements AuthStateEvent {
  const factory _UserUpdated({required final User user}) = _$UserUpdatedImpl;

  User get user;

  /// Create a copy of AuthStateEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserUpdatedImplCopyWith<_$UserUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
    _$LogoutImpl value,
    $Res Function(_$LogoutImpl) then,
  ) = __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthStateEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
    _$LogoutImpl _value,
    $Res Function(_$LogoutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthStateEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthStateEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuthenticated, User? user)
    authStateChanged,
    required TResult Function(User user) userUpdated,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAuthenticated, User? user)? authStateChanged,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuthenticated, User? user)? authStateChanged,
    TResult Function(User user)? userUpdated,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AuthStateChanged value) authStateChanged,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AuthStateChanged value)? authStateChanged,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AuthStateChanged value)? authStateChanged,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthStateEvent {
  const factory _Logout() = _$LogoutImpl;
}

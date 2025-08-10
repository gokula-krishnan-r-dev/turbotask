// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_tokens_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AuthTokensModel _$AuthTokensModelFromJson(Map<String, dynamic> json) {
  return _AuthTokensModel.fromJson(json);
}

/// @nodoc
mixin _$AuthTokensModel {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'refresh_token')
  String get refreshToken => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in')
  int? get expiresIn => throw _privateConstructorUsedError;

  /// Serializes this AuthTokensModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthTokensModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthTokensModelCopyWith<AuthTokensModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokensModelCopyWith<$Res> {
  factory $AuthTokensModelCopyWith(
    AuthTokensModel value,
    $Res Function(AuthTokensModel) then,
  ) = _$AuthTokensModelCopyWithImpl<$Res, AuthTokensModel>;
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'refresh_token') String refreshToken,
    @JsonKey(name: 'token_type') String tokenType,
    @JsonKey(name: 'expires_in') int? expiresIn,
  });
}

/// @nodoc
class _$AuthTokensModelCopyWithImpl<$Res, $Val extends AuthTokensModel>
    implements $AuthTokensModelCopyWith<$Res> {
  _$AuthTokensModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthTokensModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? tokenType = null,
    Object? expiresIn = freezed,
  }) {
    return _then(
      _value.copyWith(
            accessToken: null == accessToken
                ? _value.accessToken
                : accessToken // ignore: cast_nullable_to_non_nullable
                      as String,
            refreshToken: null == refreshToken
                ? _value.refreshToken
                : refreshToken // ignore: cast_nullable_to_non_nullable
                      as String,
            tokenType: null == tokenType
                ? _value.tokenType
                : tokenType // ignore: cast_nullable_to_non_nullable
                      as String,
            expiresIn: freezed == expiresIn
                ? _value.expiresIn
                : expiresIn // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AuthTokensModelImplCopyWith<$Res>
    implements $AuthTokensModelCopyWith<$Res> {
  factory _$$AuthTokensModelImplCopyWith(
    _$AuthTokensModelImpl value,
    $Res Function(_$AuthTokensModelImpl) then,
  ) = __$$AuthTokensModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'access_token') String accessToken,
    @JsonKey(name: 'refresh_token') String refreshToken,
    @JsonKey(name: 'token_type') String tokenType,
    @JsonKey(name: 'expires_in') int? expiresIn,
  });
}

/// @nodoc
class __$$AuthTokensModelImplCopyWithImpl<$Res>
    extends _$AuthTokensModelCopyWithImpl<$Res, _$AuthTokensModelImpl>
    implements _$$AuthTokensModelImplCopyWith<$Res> {
  __$$AuthTokensModelImplCopyWithImpl(
    _$AuthTokensModelImpl _value,
    $Res Function(_$AuthTokensModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthTokensModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? tokenType = null,
    Object? expiresIn = freezed,
  }) {
    return _then(
      _$AuthTokensModelImpl(
        accessToken: null == accessToken
            ? _value.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        refreshToken: null == refreshToken
            ? _value.refreshToken
            : refreshToken // ignore: cast_nullable_to_non_nullable
                  as String,
        tokenType: null == tokenType
            ? _value.tokenType
            : tokenType // ignore: cast_nullable_to_non_nullable
                  as String,
        expiresIn: freezed == expiresIn
            ? _value.expiresIn
            : expiresIn // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthTokensModelImpl extends _AuthTokensModel {
  const _$AuthTokensModelImpl({
    @JsonKey(name: 'access_token') required this.accessToken,
    @JsonKey(name: 'refresh_token') required this.refreshToken,
    @JsonKey(name: 'token_type') this.tokenType = 'Bearer',
    @JsonKey(name: 'expires_in') this.expiresIn,
  }) : super._();

  factory _$AuthTokensModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthTokensModelImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  @JsonKey(name: 'expires_in')
  final int? expiresIn;

  @override
  String toString() {
    return 'AuthTokensModel(accessToken: $accessToken, refreshToken: $refreshToken, tokenType: $tokenType, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthTokensModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, refreshToken, tokenType, expiresIn);

  /// Create a copy of AuthTokensModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthTokensModelImplCopyWith<_$AuthTokensModelImpl> get copyWith =>
      __$$AuthTokensModelImplCopyWithImpl<_$AuthTokensModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthTokensModelImplToJson(this);
  }
}

abstract class _AuthTokensModel extends AuthTokensModel {
  const factory _AuthTokensModel({
    @JsonKey(name: 'access_token') required final String accessToken,
    @JsonKey(name: 'refresh_token') required final String refreshToken,
    @JsonKey(name: 'token_type') final String tokenType,
    @JsonKey(name: 'expires_in') final int? expiresIn,
  }) = _$AuthTokensModelImpl;
  const _AuthTokensModel._() : super._();

  factory _AuthTokensModel.fromJson(Map<String, dynamic> json) =
      _$AuthTokensModelImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(name: 'refresh_token')
  String get refreshToken;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType;
  @override
  @JsonKey(name: 'expires_in')
  int? get expiresIn;

  /// Create a copy of AuthTokensModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthTokensModelImplCopyWith<_$AuthTokensModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/auth_tokens.dart';

part 'auth_tokens_model.freezed.dart';
part 'auth_tokens_model.g.dart';

/// Data model for AuthTokens entity with JSON serialization.
/// Handles API response structure for authentication tokens.
@freezed
class AuthTokensModel with _$AuthTokensModel {
  const factory AuthTokensModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
    @JsonKey(name: 'expires_in') int? expiresIn,
  }) = _AuthTokensModel;

  const AuthTokensModel._();

  /// Create AuthTokensModel from JSON
  factory AuthTokensModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensModelFromJson(json);

  /// Convert to domain entity
  AuthTokens toDomain() {
    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      expiresIn: expiresIn,
    );
  }

  /// Create from domain entity
  factory AuthTokensModel.fromDomain(AuthTokens tokens) {
    return AuthTokensModel(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
      tokenType: tokens.tokenType,
      expiresIn: tokens.expiresIn,
    );
  }
}

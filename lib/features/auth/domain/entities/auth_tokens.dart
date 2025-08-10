import 'package:equatable/equatable.dart';

/// Authentication tokens entity.
/// Contains access and refresh tokens returned from login/refresh operations.
class AuthTokens extends Equatable {
  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    this.tokenType = 'Bearer',
    this.expiresIn,
  });

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int? expiresIn; // seconds until expiry (optional)

  /// Create a copy with updated fields
  AuthTokens copyWith({
    String? accessToken,
    String? refreshToken,
    String? tokenType,
    int? expiresIn,
  }) {
    return AuthTokens(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      tokenType: tokenType ?? this.tokenType,
      expiresIn: expiresIn ?? this.expiresIn,
    );
  }

  @override
  List<Object?> get props => [accessToken, refreshToken, tokenType, expiresIn];

  @override
  String toString() {
    return 'AuthTokens(tokenType: $tokenType, expiresIn: $expiresIn)';
  }
}

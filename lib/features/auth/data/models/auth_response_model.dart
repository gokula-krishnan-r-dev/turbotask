import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_tokens_model.dart';
import 'user_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

/// Data model for authentication response containing user and tokens.
/// Used for login/register API responses.
@freezed
class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    required bool success,
    required String message,
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    required UserModel user,
    @JsonKey(name: 'is_new_user') required bool isNewUser,
  }) = _AuthResponseModel;

  const AuthResponseModel._();

  /// Create AuthResponseModel from JSON
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  /// Get tokens as AuthTokensModel
  AuthTokensModel get tokens => AuthTokensModel(
    accessToken: accessToken,
    refreshToken: refreshToken,
    tokenType: 'Bearer',
    expiresIn: 3600,
  );
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Data model for User entity with JSON serialization.
/// Converts between API responses and domain entities.
@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String email,
    required String username,
    @JsonKey(name: 'email_verified') @Default(false) bool emailVerified,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'full_name') required String fullName,
    required String timezone,
    required String locale,
    required String status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _UserModel;

  const UserModel._();

  /// Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Convert to domain entity
  User toDomain() {
    return User(
      id: id,
      email: email,
      username: username,
      emailVerified: emailVerified,
      firstName: firstName,
      lastName: lastName,
      fullName: fullName,
      timezone: timezone,
      locale: locale,
      status: status,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
    );
  }

  /// Create from domain entity
  factory UserModel.fromDomain(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      username: user.username,
      emailVerified: user.emailVerified,
      firstName: user.firstName,
      lastName: user.lastName,
      fullName: user.fullName,
      timezone: user.timezone,
      locale: user.locale,
      status: user.status,
      createdAt: user.createdAt.toIso8601String(),
      updatedAt: user.updatedAt.toIso8601String(),
    );
  }
}

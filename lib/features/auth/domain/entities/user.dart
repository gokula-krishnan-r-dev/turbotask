import 'package:equatable/equatable.dart';

/// User entity representing an authenticated user.
/// This is the core domain model for user data.
class User extends Equatable {
  const User({
    required this.id,
    required this.email,
    required this.username,
    this.emailVerified = false,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.timezone,
    required this.locale,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String email;
  final String username;
  final bool emailVerified;
  final String firstName;
  final String lastName;
  final String fullName;
  final String timezone;
  final String locale;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Create a copy of user with updated fields
  User copyWith({
    String? id,
    String? email,
    String? username,
    bool? emailVerified,
    String? firstName,
    String? lastName,
    String? fullName,
    String? timezone,
    String? locale,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      username: username ?? this.username,
      emailVerified: emailVerified ?? this.emailVerified,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      fullName: fullName ?? this.fullName,
      timezone: timezone ?? this.timezone,
      locale: locale ?? this.locale,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    email,
    username,
    emailVerified,
    firstName,
    lastName,
    fullName,
    timezone,
    locale,
    status,
    createdAt,
    updatedAt,
  ];

  @override
  String toString() {
    return 'User(id: $id, email: $email, username: $username, fullName: $fullName, emailVerified: $emailVerified)';
  }
}

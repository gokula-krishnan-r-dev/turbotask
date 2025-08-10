import 'package:injectable/injectable.dart';

import '../entities/auth_tokens.dart';
import '../repositories/auth_repository.dart';

/// Use case for user login operation.
/// Encapsulates business logic for authentication.
@injectable
class LoginUseCase {
  const LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  /// Execute login with email and password
  /// Returns authentication tokens on success
  Future<AuthTokens> call({
    required String email,
    required String password,
  }) async {
    // Input validation
    if (email.isEmpty) {
      throw ArgumentError('Email cannot be empty');
    }

    if (password.isEmpty) {
      throw ArgumentError('Password cannot be empty');
    }

    // Basic email format validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw ArgumentError('Invalid email format');
    }

    // Password length validation
    if (password.length < 6) {
      throw ArgumentError('Password must be at least 6 characters');
    }

    // Execute login through repository
    return await _authRepository.login(
      email: email.trim().toLowerCase(),
      password: password,
    );
  }
}

import '../entities/auth_tokens.dart';
import '../entities/user.dart';

/// Abstract repository defining authentication operations.
/// This is implemented in the data layer following Clean Architecture.
abstract class AuthRepository {
  /// Login with email and password
  Future<AuthTokens> login({required String email, required String password});

  /// Register a new user account
  Future<AuthTokens> register({
    required String email,
    required String password,
    required String name,
  });

  /// Logout the current user
  Future<void> logout();

  /// Get current user information
  Future<User?> getCurrentUser();

  /// Refresh authentication tokens
  Future<AuthTokens> refreshTokens();

  /// Check if user is currently authenticated
  Future<bool> isAuthenticated();

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email);

  /// Reset password with token
  Future<void> resetPassword({
    required String token,
    required String newPassword,
  });

  /// Verify email with token
  Future<void> verifyEmail(String token);

  /// Resend email verification
  Future<void> resendEmailVerification();

  /// Update user profile
  Future<User> updateProfile({String? name, String? avatarUrl});

  /// Change password
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });

  /// Delete user account
  Future<void> deleteAccount();

  /// Initiate OTP verification by sending code to email
  Future<void> initiateOtp(String email);

  /// Verify OTP code and return authenticated user
  Future<User> verifyOtp({required String email, required String code});
}

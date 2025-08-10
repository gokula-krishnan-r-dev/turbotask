import 'package:injectable/injectable.dart';

import '../entities/user.dart';
import '../entities/otp_verification.dart';
import '../repositories/auth_repository.dart';

/// Use case for verifying OTP code.
/// Verifies the OTP and returns authenticated user on success.
@injectable
class VerifyOtpUseCase {
  const VerifyOtpUseCase(this._authRepository);

  final AuthRepository _authRepository;

  /// Execute OTP verification
  /// Returns authenticated user on successful verification
  Future<User> call({required String email, required String code}) async {
    // Input validation
    if (email.isEmpty) {
      throw ArgumentError('Email cannot be empty');
    }

    if (code.isEmpty) {
      throw ArgumentError('OTP code cannot be empty');
    }

    // Basic email format validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw ArgumentError('Invalid email format');
    }

    // OTP code format validation (6 digits)
    if (code.length != 6 || !RegExp(r'^\d{6}$').hasMatch(code)) {
      throw ArgumentError('OTP code must be 6 digits');
    }

    // Execute OTP verification through repository
    return await _authRepository.verifyOtp(
      email: email.trim().toLowerCase(),
      code: code.trim(),
    );
  }
}

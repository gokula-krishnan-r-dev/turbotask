import 'package:injectable/injectable.dart';

import '../entities/otp_request.dart';
import '../repositories/auth_repository.dart';

/// Use case for initiating OTP verification.
/// Sends OTP to user's email address.
@injectable
class InitiateOtpUseCase {
  const InitiateOtpUseCase(this._authRepository);

  final AuthRepository _authRepository;

  /// Execute OTP initiation
  /// Sends OTP code to the provided email
  Future<void> call(String email) async {
    // Input validation
    if (email.isEmpty) {
      throw ArgumentError('Email cannot be empty');
    }

    // Basic email format validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      throw ArgumentError('Invalid email format');
    }

    // Execute OTP initiation through repository
    await _authRepository.initiateOtp(email.trim().toLowerCase());
  }
}

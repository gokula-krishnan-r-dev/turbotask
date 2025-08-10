import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_event.freezed.dart';

/// OTP verification events using freezed for type safety and code generation.
@freezed
class OtpEvent with _$OtpEvent {
  /// Initialize OTP verification with email
  const factory OtpEvent.initialized(String email) = _Initialized;

  /// OTP code field changed
  const factory OtpEvent.codeChanged(String code) = _CodeChanged;

  /// Verify OTP code
  const factory OtpEvent.verifyOtp() = _VerifyOtp;

  /// Resend OTP code
  const factory OtpEvent.resendOtp() = _ResendOtp;

  /// Clear any errors
  const factory OtpEvent.clearError() = _ClearError;

  /// Navigate back to login
  const factory OtpEvent.backToLogin() = _BackToLogin;

  /// Auto verify when code is complete
  const factory OtpEvent.autoVerify() = _AutoVerify;
}

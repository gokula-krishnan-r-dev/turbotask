import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

/// OTP verification states using freezed for immutability and code generation.
@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    required String email,
    @Default('') String code,
    @Default(OtpStatus.initial) OtpStatus status,
    String? errorMessage,
    @Default(false) bool isCodeComplete,
    @Default(false) bool canResend,
    @Default(60) int resendCountdown,
  }) = _OtpState;

  const OtpState._();

  /// Check if the verify button should be enabled
  bool get canVerify => isCodeComplete && status != OtpStatus.verifying;

  /// Check if we should show loading indicator
  bool get isLoading =>
      status == OtpStatus.verifying || status == OtpStatus.resending;

  /// Check if verification was successful
  bool get isSuccess => status == OtpStatus.success;

  /// Check if there's an error
  bool get hasError => status == OtpStatus.failure && errorMessage != null;

  /// Check if currently verifying
  bool get isVerifying => status == OtpStatus.verifying;

  /// Check if currently resending
  bool get isResending => status == OtpStatus.resending;
}

/// Status enum for OTP verification process
enum OtpStatus {
  /// Initial state
  initial,

  /// OTP verification in progress
  verifying,

  /// OTP verification successful
  success,

  /// OTP verification failed
  failure,

  /// Resending OTP code
  resending,

  /// OTP code resent successfully
  resent,
}

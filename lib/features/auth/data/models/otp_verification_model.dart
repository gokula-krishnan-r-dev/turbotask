import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/otp_verification.dart';

part 'otp_verification_model.freezed.dart';
part 'otp_verification_model.g.dart';

/// Data model for OTP verification with JSON serialization.
@freezed
class OtpVerificationModel with _$OtpVerificationModel {
  const factory OtpVerificationModel({
    required String email,
    required String code,
  }) = _OtpVerificationModel;

  const OtpVerificationModel._();

  /// Create OtpVerificationModel from JSON
  factory OtpVerificationModel.fromJson(Map<String, dynamic> json) =>
      _$OtpVerificationModelFromJson(json);

  /// Convert to domain entity
  OtpVerification toDomain() {
    return OtpVerification(email: email, code: code);
  }

  /// Create from domain entity
  factory OtpVerificationModel.fromDomain(OtpVerification otpVerification) {
    return OtpVerificationModel(
      email: otpVerification.email,
      code: otpVerification.code,
    );
  }
}

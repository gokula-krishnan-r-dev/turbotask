import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/otp_request.dart';

part 'otp_request_model.freezed.dart';
part 'otp_request_model.g.dart';

/// Data model for OTP request with JSON serialization.
@freezed
class OtpRequestModel with _$OtpRequestModel {
  const factory OtpRequestModel({required String email}) = _OtpRequestModel;

  const OtpRequestModel._();

  /// Create OtpRequestModel from JSON
  factory OtpRequestModel.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestModelFromJson(json);

  /// Convert to domain entity
  OtpRequest toDomain() {
    return OtpRequest(email: email);
  }

  /// Create from domain entity
  factory OtpRequestModel.fromDomain(OtpRequest otpRequest) {
    return OtpRequestModel(email: otpRequest.email);
  }
}

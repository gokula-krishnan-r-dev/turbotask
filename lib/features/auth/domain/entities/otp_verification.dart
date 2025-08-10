import 'package:equatable/equatable.dart';

/// OTP verification entity for verifying OTP code.
class OtpVerification extends Equatable {
  const OtpVerification({required this.email, required this.code});

  final String email;
  final String code;

  /// Create a copy with updated fields
  OtpVerification copyWith({String? email, String? code}) {
    return OtpVerification(email: email ?? this.email, code: code ?? this.code);
  }

  @override
  List<Object?> get props => [email, code];

  @override
  String toString() {
    return 'OtpVerification(email: $email, code: $code)';
  }
}

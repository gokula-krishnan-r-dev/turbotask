import 'package:equatable/equatable.dart';

/// OTP request entity for initiating OTP verification.
class OtpRequest extends Equatable {
  const OtpRequest({required this.email});

  final String email;

  /// Create a copy with updated fields
  OtpRequest copyWith({String? email}) {
    return OtpRequest(email: email ?? this.email);
  }

  @override
  List<Object?> get props => [email];

  @override
  String toString() {
    return 'OtpRequest(email: $email)';
  }
}

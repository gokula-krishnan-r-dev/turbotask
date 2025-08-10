import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_event.freezed.dart';

/// Login events using freezed for type safety and code generation.
@freezed
class LoginEvent with _$LoginEvent {
  /// Email field changed
  const factory LoginEvent.emailChanged(String email) = _EmailChanged;

  /// Submit login form (initiate OTP)
  const factory LoginEvent.loginSubmitted() = _LoginSubmitted;

  /// Reset form and clear any errors
  const factory LoginEvent.resetForm() = _ResetForm;

  /// Navigate to register
  const factory LoginEvent.registerTapped() = _RegisterTapped;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

/// Login states using freezed for immutability and code generation.
@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default(LoginStatus.initial) LoginStatus status,
    String? errorMessage,
    @Default(false) bool isEmailValid,
    @Default(false) bool isFormValid,
  }) = _LoginState;

  const LoginState._();

  /// Check if the submit button should be enabled
  bool get canSubmit => isFormValid && status != LoginStatus.loading;

  /// Check if we should show loading indicator
  bool get isLoading => status == LoginStatus.loading;

  /// Check if login was successful
  bool get isSuccess => status == LoginStatus.success;

  /// Check if there's an error
  bool get hasError => status == LoginStatus.failure && errorMessage != null;
}

/// Status enum for login process
enum LoginStatus {
  /// Initial state
  initial,

  /// Login in progress
  loading,

  /// Login successful
  success,

  /// Login failed
  failure,
}

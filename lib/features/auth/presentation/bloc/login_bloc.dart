import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../domain/usecases/initiate_otp_usecase.dart';
import 'login_event.dart';
import 'login_state.dart';

/// BLoC for handling login form state and authentication logic.
/// Now initiates OTP instead of direct login.
@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this._initiateOtpUseCase) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        emailChanged: (email) async => _onEmailChanged(email, emit),
        loginSubmitted: () async => await _onLoginSubmitted(emit),
        resetForm: () async => _onResetForm(emit),
        registerTapped: () async => _onRegisterTapped(emit),
      );
    });
  }

  final InitiateOtpUseCase _initiateOtpUseCase;

  /// Handle email input changes
  void _onEmailChanged(String email, Emitter<LoginState> emit) {
    final trimmedEmail = email.trim();
    final isEmailValid = _isValidEmail(trimmedEmail);

    emit(
      state.copyWith(
        email: trimmedEmail,
        isEmailValid: isEmailValid,
        isFormValid: isEmailValid,
        status: LoginStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Handle login form submission (initiate OTP)
  Future<void> _onLoginSubmitted(Emitter<LoginState> emit) async {
    if (!state.canSubmit) return;

    emit(state.copyWith(status: LoginStatus.loading, errorMessage: null));

    try {
      await _initiateOtpUseCase(state.email);

      emit(state.copyWith(status: LoginStatus.success));
    } on NetworkExceptions catch (e) {
      emit(
        state.copyWith(
          status: LoginStatus.failure,
          errorMessage: NetworkExceptions.getErrorMessage(e),
        ),
      );
    } catch (e) {
      String errorMessage = 'Failed to send OTP';

      // Handle specific validation errors from use case
      if (e is ArgumentError) {
        errorMessage = e.message;
      }

      emit(
        state.copyWith(status: LoginStatus.failure, errorMessage: errorMessage),
      );
    }
  }

  /// Reset form to initial state
  void _onResetForm(Emitter<LoginState> emit) {
    emit(const LoginState());
  }

  /// Handle register tap (for navigation)
  void _onRegisterTapped(Emitter<LoginState> emit) {
    // This would typically trigger navigation
    // The UI layer should listen for this event
  }

  /// Validate email format
  bool _isValidEmail(String email) {
    if (email.isEmpty) return false;

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }

  /// Get email validation error message
  String? getEmailError() {
    if (state.email.isEmpty) return null;
    if (!state.isEmailValid) return 'Please enter a valid email address';
    return null;
  }
}

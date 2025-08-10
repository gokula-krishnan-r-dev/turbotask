import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/network_exceptions.dart';
import '../../domain/usecases/initiate_otp_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
import 'otp_event.dart';
import 'otp_state.dart';

/// BLoC for handling OTP verification flow.
/// Manages OTP code input, verification, and resend functionality.
@injectable
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc(this._verifyOtpUseCase, this._initiateOtpUseCase)
    : super(const OtpState(email: '')) {
    on<OtpEvent>((event, emit) async {
      await event.when(
        initialized: (email) async => _onInitialized(email, emit),
        codeChanged: (code) async => _onCodeChanged(code, emit),
        verifyOtp: () async => await _onVerifyOtp(emit),
        resendOtp: () async => await _onResendOtp(emit),
        clearError: () async => _onClearError(emit),
        backToLogin: () async => _onBackToLogin(emit),
        autoVerify: () async => await _onAutoVerify(emit),
      );
    });
  }

  final VerifyOtpUseCase _verifyOtpUseCase;
  final InitiateOtpUseCase _initiateOtpUseCase;
  Timer? _resendTimer;

  /// Initialize with email and start resend countdown
  void _onInitialized(String email, Emitter<OtpState> emit) {
    emit(OtpState(email: email));
    _startResendCountdown(emit);
  }

  /// Handle OTP code input changes
  void _onCodeChanged(String code, Emitter<OtpState> emit) {
    // Only allow digits and limit to 6 characters
    final cleanCode = code.replaceAll(RegExp(r'[^0-9]'), '');
    final limitedCode = cleanCode.length > 6
        ? cleanCode.substring(0, 6)
        : cleanCode;

    emit(
      state.copyWith(
        code: limitedCode,
        isCodeComplete: limitedCode.length == 6,
        status: OtpStatus.initial,
        errorMessage: null,
      ),
    );
  }

  /// Handle OTP verification
  Future<void> _onVerifyOtp(Emitter<OtpState> emit) async {
    if (!state.canVerify) return;

    print('🔐 OTP Verification: Starting verification for ${state.email}');
    emit(state.copyWith(status: OtpStatus.verifying, errorMessage: null));

    try {
      final user = await _verifyOtpUseCase(
        email: state.email,
        code: state.code,
      );
      print('🔐 OTP Verification: Success! User: ${user.email}');

      emit(state.copyWith(status: OtpStatus.success));
    } on NetworkExceptions catch (e) {
      print(
        '🔐 OTP Verification: Network error - ${NetworkExceptions.getErrorMessage(e)}',
      );
      emit(
        state.copyWith(
          status: OtpStatus.failure,
          errorMessage: NetworkExceptions.getErrorMessage(e),
        ),
      );
    } catch (e) {
      String errorMessage = 'An unexpected error occurred';

      // Handle specific validation errors from use case
      if (e is ArgumentError) {
        errorMessage = e.message;
      }

      print('🔐 OTP Verification: Error - $errorMessage');
      emit(
        state.copyWith(status: OtpStatus.failure, errorMessage: errorMessage),
      );
    }
  }

  /// Handle OTP resend
  Future<void> _onResendOtp(Emitter<OtpState> emit) async {
    if (!state.canResend) return;

    emit(state.copyWith(status: OtpStatus.resending, errorMessage: null));

    try {
      await _initiateOtpUseCase(state.email);

      emit(
        state.copyWith(
          status: OtpStatus.resent,
          code: '', // Clear current code
          isCodeComplete: false,
          canResend: false,
          resendCountdown: 60,
        ),
      );

      // Start countdown again
      _startResendCountdown(emit);
    } on NetworkExceptions catch (e) {
      emit(
        state.copyWith(
          status: OtpStatus.failure,
          errorMessage: NetworkExceptions.getErrorMessage(e),
        ),
      );
    } catch (e) {
      String errorMessage = 'Failed to resend OTP';

      if (e is ArgumentError) {
        errorMessage = e.message;
      }

      emit(
        state.copyWith(status: OtpStatus.failure, errorMessage: errorMessage),
      );
    }
  }

  /// Clear any error messages
  void _onClearError(Emitter<OtpState> emit) {
    emit(state.copyWith(status: OtpStatus.initial, errorMessage: null));
  }

  /// Handle back to login navigation
  void _onBackToLogin(Emitter<OtpState> emit) {
    // This would typically trigger navigation
    // The UI layer should listen for this event
  }

  /// Auto verify when code is complete
  Future<void> _onAutoVerify(Emitter<OtpState> emit) async {
    if (state.isCodeComplete && state.status != OtpStatus.verifying) {
      await _onVerifyOtp(emit);
    }
  }

  /// Start resend countdown timer
  void _startResendCountdown(Emitter<OtpState> emit) {
    _resendTimer?.cancel();

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.resendCountdown > 0) {
        emit(state.copyWith(resendCountdown: state.resendCountdown - 1));
      } else {
        emit(state.copyWith(canResend: true));
        timer.cancel();
      }
    });
  }

  /// Get formatted time for resend countdown
  String getResendCountdownText() {
    if (state.canResend) {
      return 'Resend OTP';
    }
    return 'Resend in ${state.resendCountdown}s';
  }

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }
}

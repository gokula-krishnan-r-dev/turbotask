import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/auth/auth_bloc.dart';
import '../../../../core/auth/auth_state.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_gradients.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../bloc/otp_bloc.dart';
import '../bloc/otp_event.dart';
import '../bloc/otp_state.dart';
import '../widgets/gradient_button.dart';
import '../widgets/logo_widget.dart';

/// OTP verification page with beautiful UI and animations.
/// Features auto-focus, auto-verification, and loading states.
class OtpVerificationPage extends StatelessWidget {
  const OtpVerificationPage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OtpBloc>()..add(OtpEvent.initialized(email)),
      child: const _OtpVerificationView(),
    );
  }
}

class _OtpVerificationView extends StatelessWidget {
  const _OtpVerificationView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<OtpBloc, OtpState>(
          listener: (context, state) {
            if (state.hasError) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage!),
                  backgroundColor: AppColors.error,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            print(
              '🏠 OTP Page: AuthBloc state changed - isAuthenticated: ${state.isAuthenticated}',
            );
            // Navigate to home when globally authenticated
            if (state.isAuthenticated) {
              print('🏠 OTP Page: User is authenticated, navigating to home');
              _handleVerificationSuccess(context);
            }
          },
        ),
      ],
      child: ResponsiveUtils.isDesktop(context)
          ? ResponsiveUtils.getResponsiveFormLayout(context, [
              SizedBox(height: ResponsiveUtils.isMobile(context) ? 20 : 40),

              // Logo with gradient background - adaptive size
              LogoWidget(
                size: ResponsiveUtils.getLogoSize(context) * 0.9,
                iconSize: ResponsiveUtils.getLogoSize(context) * 0.4,
              ),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 32),
              ),

              // Title - responsive
              Text(
                'Verify Your Email',
                style:
                    (ResponsiveUtils.isTablet(context) ||
                                ResponsiveUtils.isIPad(context)
                            ? theme.textTheme.headlineLarge
                            : theme.textTheme.headlineMedium)
                        ?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onSurface,
                          fontSize:
                              ResponsiveUtils.isTablet(context) ||
                                  ResponsiveUtils.isIPad(context)
                              ? 30
                              : ResponsiveUtils.isMobile(context)
                              ? 22
                              : 26,
                        ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 12),
              ),

              // Subtitle with email
              BlocBuilder<OtpBloc, OtpState>(
                buildWhen: (previous, current) =>
                    previous.email != current.email,
                builder: (context, state) {
                  return RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.7,
                        ),
                        height: 1.5,
                        fontSize:
                            ResponsiveUtils.isTablet(context) ||
                                ResponsiveUtils.isIPad(context)
                            ? 17
                            : ResponsiveUtils.isMobile(context)
                            ? 15
                            : 16,
                      ),
                      children: [
                        const TextSpan(text: 'We sent a 6-digit code to\n'),
                        TextSpan(
                          text: state.email,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.mint,
                            fontSize:
                                ResponsiveUtils.isTablet(context) ||
                                    ResponsiveUtils.isIPad(context)
                                ? 17
                                : ResponsiveUtils.isMobile(context)
                                ? 15
                                : 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 40),
              ),

              // OTP Input Fields
              const _OtpInputFields(),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 32),
              ),

              // Verify Button
              const _VerifyButton(),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 24),
              ),

              // Resend OTP
              const _ResendOtpSection(),

              SizedBox(height: ResponsiveUtils.isMobile(context) ? 20 : 40),
            ])
          : Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: theme.colorScheme.onSurface,
                  ),
                  onPressed: () {
                    context.read<OtpBloc>().add(const OtpEvent.backToLogin());
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: ResponsiveUtils.getResponsiveFormLayout(context, [
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 20 : 40),

                // Logo with gradient background - adaptive size
                LogoWidget(
                  size: ResponsiveUtils.getLogoSize(context) * 0.9,
                  iconSize: ResponsiveUtils.getLogoSize(context) * 0.4,
                ),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 32),
                ),

                // Title - responsive
                Text(
                  'Verify Your Email',
                  style:
                      (ResponsiveUtils.isTablet(context) ||
                                  ResponsiveUtils.isIPad(context)
                              ? theme.textTheme.headlineLarge
                              : theme.textTheme.headlineMedium)
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onSurface,
                            fontSize:
                                ResponsiveUtils.isTablet(context) ||
                                    ResponsiveUtils.isIPad(context)
                                ? 30
                                : ResponsiveUtils.isMobile(context)
                                ? 22
                                : 26,
                          ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 12),
                ),

                // Subtitle with email
                BlocBuilder<OtpBloc, OtpState>(
                  buildWhen: (previous, current) =>
                      previous.email != current.email,
                  builder: (context, state) {
                    return RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.7,
                          ),
                          height: 1.5,
                          fontSize:
                              ResponsiveUtils.isTablet(context) ||
                                  ResponsiveUtils.isIPad(context)
                              ? 17
                              : ResponsiveUtils.isMobile(context)
                              ? 15
                              : 16,
                        ),
                        children: [
                          const TextSpan(text: 'We sent a 6-digit code to\n'),
                          TextSpan(
                            text: state.email,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: AppColors.mint,
                              fontSize:
                                  ResponsiveUtils.isTablet(context) ||
                                      ResponsiveUtils.isIPad(context)
                                  ? 17
                                  : ResponsiveUtils.isMobile(context)
                                  ? 15
                                  : 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 40),
                ),

                // OTP Input Fields
                const _OtpInputFields(),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 32),
                ),

                // Verify Button
                const _VerifyButton(),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 24),
                ),

                // Resend OTP
                const _ResendOtpSection(),

                SizedBox(height: ResponsiveUtils.isMobile(context) ? 20 : 40),
              ]),
            ),
    );
  }

  void _handleVerificationSuccess(BuildContext context) {
    print(
      '🏠 Navigation: _handleVerificationSuccess called, navigating to /home',
    );
    // Navigate to main app
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }
}

/// Custom OTP input fields with auto-focus and styling
class _OtpInputFields extends StatefulWidget {
  const _OtpInputFields();

  @override
  State<_OtpInputFields> createState() => _OtpInputFieldsState();
}

class _OtpInputFieldsState extends State<_OtpInputFields> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(6, (index) => TextEditingController());
    focusNodes = List.generate(6, (index) => FocusNode());

    // Auto-focus first field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<OtpBloc, OtpState>(
      listenWhen: (previous, current) => previous.code != current.code,
      listener: (context, state) {
        // Update controllers when code changes (e.g., from paste)
        final code = state.code.padRight(6, ' ');
        for (int i = 0; i < 6; i++) {
          if (i < code.length && code[i] != ' ') {
            controllers[i].text = code[i];
          } else {
            controllers[i].clear();
          }
        }

        // Auto-verify when complete
        if (state.isCodeComplete && !state.isLoading) {
          context.read<OtpBloc>().add(const OtpEvent.autoVerify());
        }
      },
      child: ResponsiveUtils.isMobile(context)
          ? Wrap(
              alignment: WrapAlignment.center,
              spacing: ResponsiveUtils.getOtpFieldSpacing(context),
              runSpacing: 8,
              children: List.generate(
                6,
                (index) => _buildOtpField(context, theme, index),
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => _buildOtpField(context, theme, index),
              ),
            ),
    );
  }

  Widget _buildOtpField(BuildContext context, ThemeData theme, int index) {
    final fieldSize = ResponsiveUtils.getOtpFieldSize(context);

    return Container(
      width: fieldSize,
      height: fieldSize * 1.2,
      margin: ResponsiveUtils.isMobile(context)
          ? null
          : EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.getOtpFieldSpacing(context) / 2,
            ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          ResponsiveUtils.getResponsiveBorderRadius(context, 12),
        ),
        border: Border.all(
          color: _getBorderColor(context, index),
          width:
              ResponsiveUtils.isTablet(context) ||
                  ResponsiveUtils.isIPad(context)
              ? 2.5
              : 2,
        ),
        color: theme.brightness == Brightness.dark
            ? AppColors.gray800
            : AppColors.gray100,
      ),
      child: TextField(
        controller: controllers[index],
        focusNode: focusNodes[index],
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.colorScheme.onSurface,
          fontSize:
              ResponsiveUtils.isTablet(context) ||
                  ResponsiveUtils.isIPad(context)
              ? 24
              : ResponsiveUtils.isMobile(context)
              ? 18
              : 20,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (value) => _onDigitChanged(index, value),
        decoration: const InputDecoration(
          border: InputBorder.none,
          counterText: '',
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }

  Color _getBorderColor(BuildContext context, int index) {
    final theme = Theme.of(context);
    final bloc = context.read<OtpBloc>();
    final state = bloc.state;

    if (state.hasError) {
      return AppColors.error;
    }

    if (focusNodes[index].hasFocus) {
      return AppColors.mint;
    }

    if (controllers[index].text.isNotEmpty) {
      return AppColors.mint.withValues(alpha: 0.6);
    }

    return theme.brightness == Brightness.dark
        ? AppColors.gray600
        : AppColors.gray300;
  }

  void _onDigitChanged(int index, String value) {
    if (value.isNotEmpty) {
      // Move to next field
      if (index < 5) {
        focusNodes[index + 1].requestFocus();
      } else {
        // Last field, remove focus
        focusNodes[index].unfocus();
      }
    } else {
      // Move to previous field on backspace
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }

    // Update bloc with current code
    final code = controllers.map((c) => c.text).join();
    context.read<OtpBloc>().add(OtpEvent.codeChanged(code));
  }
}

/// Verify button with loading state
class _VerifyButton extends StatelessWidget {
  const _VerifyButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpBloc, OtpState>(
      buildWhen: (previous, current) =>
          previous.canVerify != current.canVerify ||
          previous.isVerifying != current.isVerifying,
      builder: (context, state) {
        return GradientButton(
          onPressed: state.canVerify
              ? () => context.read<OtpBloc>().add(const OtpEvent.verifyOtp())
              : null,
          isLoading: state.isVerifying,
          gradient: AppGradients.primary,
          height: ResponsiveUtils.getButtonHeight(context),
          borderRadius: ResponsiveUtils.getResponsiveBorderRadius(context, 27),
          child: Text(
            'VERIFY',
            style: TextStyle(
              fontSize:
                  ResponsiveUtils.isTablet(context) ||
                      ResponsiveUtils.isIPad(context)
                  ? 17
                  : ResponsiveUtils.isMobile(context)
                  ? 15
                  : 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        );
      },
    );
  }
}

/// Resend OTP section with countdown
class _ResendOtpSection extends StatelessWidget {
  const _ResendOtpSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<OtpBloc, OtpState>(
      buildWhen: (previous, current) =>
          previous.canResend != current.canResend ||
          previous.resendCountdown != current.resendCountdown ||
          previous.isResending != current.isResending,
      builder: (context, state) {
        return Column(
          children: [
            Text(
              "Didn't receive the code?",
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                fontSize:
                    ResponsiveUtils.isTablet(context) ||
                        ResponsiveUtils.isIPad(context)
                    ? 16
                    : ResponsiveUtils.isMobile(context)
                    ? 14
                    : 15,
              ),
            ),
            const SizedBox(height: 8),
            if (state.isResending)
              SizedBox(
                width:
                    ResponsiveUtils.isTablet(context) ||
                        ResponsiveUtils.isIPad(context)
                    ? 24
                    : 20,
                height:
                    ResponsiveUtils.isTablet(context) ||
                        ResponsiveUtils.isIPad(context)
                    ? 24
                    : 20,
                child: CircularProgressIndicator(
                  strokeWidth:
                      ResponsiveUtils.isTablet(context) ||
                          ResponsiveUtils.isIPad(context)
                      ? 2.5
                      : 2,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.mint,
                  ),
                ),
              )
            else
              TextButton(
                onPressed: state.canResend
                    ? () => context.read<OtpBloc>().add(
                        const OtpEvent.resendOtp(),
                      )
                    : null,
                child: Text(
                  context.read<OtpBloc>().getResendCountdownText(),
                  style: TextStyle(
                    color: state.canResend ? AppColors.mint : AppColors.gray500,
                    fontWeight: FontWeight.w600,
                    fontSize:
                        ResponsiveUtils.isTablet(context) ||
                            ResponsiveUtils.isIPad(context)
                        ? 16
                        : ResponsiveUtils.isMobile(context)
                        ? 14
                        : 15,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

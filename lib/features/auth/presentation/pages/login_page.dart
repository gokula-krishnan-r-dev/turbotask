import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_gradients.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../widgets/gradient_button.dart';
import '../widgets/logo_widget.dart';

/// Login page with responsive design matching the mockup.
/// Features centered layout, gradient logo, input field, and gradient button.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          // Handle successful OTP initiation - navigate to OTP page
          _handleOtpInitiated(context, state.email);
        } else if (state.hasError) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      child: ResponsiveUtils.isDesktop(context)
          ? ResponsiveUtils.getResponsiveFormLayout(context, [
              SizedBox(height: ResponsiveUtils.isMobile(context) ? 40 : 60),

              // Logo with gradient background - adaptive size
              LogoWidget(
                size: ResponsiveUtils.getLogoSize(context),
                iconSize: ResponsiveUtils.getLogoSize(context) * 0.45,
              ),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 24),
              ),

              // Welcome text - responsive
              Text(
                'Welcome to TurboTask',
                style:
                    (ResponsiveUtils.isTablet(context) ||
                                ResponsiveUtils.isIPad(context)
                            ? theme.textTheme.headlineLarge
                            : theme.textTheme.headlineMedium)
                        ?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: theme.colorScheme.onBackground,
                          fontSize:
                              ResponsiveUtils.isTablet(context) ||
                                  ResponsiveUtils.isIPad(context)
                              ? 32
                              : ResponsiveUtils.isMobile(context)
                              ? 24
                              : 28,
                        ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 8),
              ),

              // Subtitle - responsive
              Text(
                'Enter your email to receive a verification code.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onBackground.withValues(alpha: 0.7),
                  fontSize:
                      ResponsiveUtils.isTablet(context) ||
                          ResponsiveUtils.isIPad(context)
                      ? 17
                      : ResponsiveUtils.isMobile(context)
                      ? 15
                      : 16,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 32),
              ),

              // Email input field
              const _EmailInput(),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 16),
              ),

              // Continue button
              const _ContinueButton(),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 16),
              ),

              // Info text - responsive
              Text(
                'We\'ll send a 6-digit verification code to your email.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onBackground.withValues(alpha: 0.6),
                  fontSize:
                      ResponsiveUtils.isTablet(context) ||
                          ResponsiveUtils.isIPad(context)
                      ? 15
                      : ResponsiveUtils.isMobile(context)
                      ? 13
                      : 14,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(
                height: ResponsiveUtils.getResponsiveSpacing(context, 24),
              ),

              // Legal text - responsive
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveUtils.isTablet(context) ||
                          ResponsiveUtils.isIPad(context)
                      ? 24
                      : 16,
                ),
                child: Text(
                  'By continuing, you acknowledge that you have read and understood, and agree to TurboTask\'s Terms & Conditions and Privacy Policy.',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onBackground.withValues(
                      alpha: 0.5,
                    ),
                    height: 1.4,
                    fontSize:
                        ResponsiveUtils.isTablet(context) ||
                            ResponsiveUtils.isIPad(context)
                        ? 13
                        : ResponsiveUtils.isMobile(context)
                        ? 11
                        : 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: ResponsiveUtils.isMobile(context) ? 40 : 60),
            ])
          : Scaffold(
              backgroundColor: theme.scaffoldBackgroundColor,
              body: ResponsiveUtils.getResponsiveFormLayout(context, [
                SizedBox(height: ResponsiveUtils.isMobile(context) ? 40 : 60),

                // Logo with gradient background - adaptive size
                LogoWidget(
                  size: ResponsiveUtils.getLogoSize(context),
                  iconSize: ResponsiveUtils.getLogoSize(context) * 0.45,
                ),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 24),
                ),

                // Welcome text - responsive
                Text(
                  'Welcome to TurboTask',
                  style:
                      (ResponsiveUtils.isTablet(context) ||
                                  ResponsiveUtils.isIPad(context)
                              ? theme.textTheme.headlineLarge
                              : theme.textTheme.headlineMedium)
                          ?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.colorScheme.onBackground,
                            fontSize:
                                ResponsiveUtils.isTablet(context) ||
                                    ResponsiveUtils.isIPad(context)
                                ? 32
                                : ResponsiveUtils.isMobile(context)
                                ? 24
                                : 28,
                          ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 8),
                ),

                // Subtitle - responsive
                Text(
                  'Enter your email to receive a verification code.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onBackground.withValues(
                      alpha: 0.7,
                    ),
                    fontSize:
                        ResponsiveUtils.isTablet(context) ||
                            ResponsiveUtils.isIPad(context)
                        ? 17
                        : ResponsiveUtils.isMobile(context)
                        ? 15
                        : 16,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 32),
                ),

                // Email input field
                const _EmailInput(),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 16),
                ),

                // Continue button
                const _ContinueButton(),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 16),
                ),

                // Info text - responsive
                Text(
                  'We\'ll send a 6-digit verification code to your email.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onBackground.withValues(
                      alpha: 0.6,
                    ),
                    fontSize:
                        ResponsiveUtils.isTablet(context) ||
                            ResponsiveUtils.isIPad(context)
                        ? 15
                        : ResponsiveUtils.isMobile(context)
                        ? 13
                        : 14,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(
                  height: ResponsiveUtils.getResponsiveSpacing(context, 24),
                ),

                // Legal text - responsive
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveUtils.isTablet(context) ||
                            ResponsiveUtils.isIPad(context)
                        ? 24
                        : 16,
                  ),
                  child: Text(
                    'By continuing, you acknowledge that you have read and understood, and agree to TurboTask\'s Terms & Conditions and Privacy Policy.',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onBackground.withValues(
                        alpha: 0.5,
                      ),
                      height: 1.4,
                      fontSize:
                          ResponsiveUtils.isTablet(context) ||
                              ResponsiveUtils.isIPad(context)
                          ? 13
                          : ResponsiveUtils.isMobile(context)
                          ? 11
                          : 12,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: ResponsiveUtils.isMobile(context) ? 40 : 60),
              ]),
            ),
    );
  }

  void _handleOtpInitiated(BuildContext context, String email) {
    // Navigate to OTP verification page
    Navigator.of(context).pushNamed('/otp-verification', arguments: email);
  }
}

/// Email input field with validation
class _EmailInput extends StatefulWidget {
  const _EmailInput();

  @override
  State<_EmailInput> createState() => _EmailInputState();
}

class _EmailInputState extends State<_EmailInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.email != current.email || previous.status != current.status,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              enabled: !state.isLoading,
              decoration: InputDecoration(
                hintText: 'Enter your email address',
                hintStyle: TextStyle(
                  fontSize:
                      ResponsiveUtils.isTablet(context) ||
                          ResponsiveUtils.isIPad(context)
                      ? 17
                      : ResponsiveUtils.isMobile(context)
                      ? 15
                      : 16,
                ),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                  size:
                      ResponsiveUtils.isTablet(context) ||
                          ResponsiveUtils.isIPad(context)
                      ? 24
                      : 20,
                ),
                suffixIcon: state.email.isNotEmpty
                    ? IconButton(
                        icon: Icon(
                          Icons.clear,
                          size:
                              ResponsiveUtils.isTablet(context) ||
                                  ResponsiveUtils.isIPad(context)
                              ? 24
                              : 20,
                        ),
                        onPressed: () {
                          _controller.clear();
                          context.read<LoginBloc>().add(
                            const LoginEvent.emailChanged(''),
                          );
                        },
                      )
                    : null,
                contentPadding: EdgeInsets.all(
                  ResponsiveUtils.isTablet(context) ||
                          ResponsiveUtils.isIPad(context)
                      ? 20
                      : 16,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    ResponsiveUtils.getResponsiveBorderRadius(context, 12),
                  ),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: theme.brightness == Brightness.dark
                    ? AppColors.gray800
                    : AppColors.gray100,
              ),
              style: TextStyle(
                fontSize:
                    ResponsiveUtils.isTablet(context) ||
                        ResponsiveUtils.isIPad(context)
                    ? 17
                    : ResponsiveUtils.isMobile(context)
                    ? 15
                    : 16,
              ),
              onChanged: (email) {
                context.read<LoginBloc>().add(LoginEvent.emailChanged(email));
              },
              onFieldSubmitted: (_) => _handleSubmit(context, state),
            ),

            // Show validation error if any
            BlocBuilder<LoginBloc, LoginState>(
              buildWhen: (previous, current) =>
                  previous.email != current.email ||
                  previous.isEmailValid != current.isEmailValid,
              builder: (context, state) {
                final bloc = context.read<LoginBloc>();
                final errorMessage = bloc.getEmailError();

                if (errorMessage == null) return const SizedBox.shrink();

                return Padding(
                  padding: const EdgeInsets.only(top: 8, left: 12),
                  child: Text(
                    errorMessage,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.error,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _handleSubmit(BuildContext context, LoginState state) {
    if (state.canSubmit) {
      context.read<LoginBloc>().add(const LoginEvent.loginSubmitted());
    }
  }
}

/// Continue button with gradient background and loading state
class _ContinueButton extends StatelessWidget {
  const _ContinueButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) =>
          previous.canSubmit != current.canSubmit ||
          previous.isLoading != current.isLoading,
      builder: (context, state) {
        return GradientButton(
          onPressed: state.canSubmit
              ? () => context.read<LoginBloc>().add(
                  const LoginEvent.loginSubmitted(),
                )
              : null,
          isLoading: state.isLoading,
          gradient: AppGradients.primary,
          height: ResponsiveUtils.getButtonHeight(context),
          borderRadius: ResponsiveUtils.getResponsiveBorderRadius(context, 27),
          child: Text(
            'SEND OTP',
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

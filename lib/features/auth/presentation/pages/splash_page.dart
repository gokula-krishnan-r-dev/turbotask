import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbotask/core/auth/auth_bloc.dart';
import 'package:turbotask/core/auth/auth_state.dart';
import 'package:turbotask/features/auth/presentation/widgets/logo_widget.dart';

/// Splash page that determines the initial route based on auth state.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    print('SplashPage initState');

    // Add a timeout fallback in case auth state doesn't emit
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && !_hasNavigated) {
        _navigateToLogin();
      }
    });
  }

  void _handleAuthState(AuthState state) {
    if (_hasNavigated) return;

    // Add a small delay for splash screen effect
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted && !_hasNavigated) {
        _hasNavigated = true;

        if (state.isAuthenticated) {
          Navigator.of(context).pushReplacementNamed('/home');
        } else {
          _navigateToLogin();
        }
      }
    });
  }

  void _navigateToLogin() {
    if (mounted && !_hasNavigated) {
      _hasNavigated = true;
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        _handleAuthState(state);
      },
      builder: (context, state) {
        // Also check initial state
        if (!_hasNavigated && !state.isInitial && !state.isLoading) {
          // Trigger navigation for initial non-loading states
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _handleAuthState(state);
          });
        }

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Use animated logo for splash screen
                const AnimatedLogoWidget(size: 120, iconSize: 60),
                const SizedBox(height: 24),

                const Text(
                  'TurboTask',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),

                //add a button for login
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/login');
                  },
                  child: const Text('Login'),
                ),

                const SizedBox(height: 8),

                Text(
                  'Focus. Organize. Achieve.',
                  style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 48),

                const SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(strokeWidth: 3),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

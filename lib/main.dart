import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:turbotask/features/todos/presentation/bloc/kanban_board_bloc.dart';
import 'package:turbotask/features/todos/presentation/bloc/note_bloc.dart';

import 'core/auth/auth_bloc.dart';
import 'core/auth/auth_state.dart';
import 'core/auth/auth_state_event.dart';
import 'core/di/injection.dart';
import 'core/services/websocket_service.dart';
import 'core/theme/app_themes.dart';
import 'core/theme/theme_manager.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/otp_verification_page.dart';
import 'features/projects/presentation/pages/projects_home_page.dart';
import 'features/projects/presentation/bloc/projects_bloc.dart';
import 'features/floating_panel/presentation/pages/floating_panel_page.dart';
import 'features/floating_panel/presentation/pages/floating_panel_settings_page.dart';
import 'features/todos/presentation/bloc/todo_actions_bloc.dart';
import 'features/auth/presentation/widgets/logo_widget.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/reports/presentation/pages/reports_page.dart';

/// Main entry point of the TurboTask application.
/// Initializes dependency injection and runs the app.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure system UI overlay
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );

  // Set preferred orientations for desktop
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // Initialize dependency injection
  await configureDependencies();

  runApp(const TurboTaskApp());
}

/// Root application widget with theme management and routing.
class TurboTaskApp extends StatelessWidget {
  const TurboTaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<ProjectsBloc>()),
        BlocProvider(create: (context) => getIt<NoteBloc>()),
        BlocProvider(create: (context) => getIt<KanbanBoardBloc>()),
        BlocProvider(create: (context) => getIt<TodoActionsBloc>()),
      ],
      child: AnimatedBuilder(
        animation: getIt<ThemeManager>(),
        builder: (context, child) {
          final themeManager = getIt<ThemeManager>();

          return MaterialApp(
            title: 'TurboTask',
            debugShowCheckedModeBanner: false,
            // Localization delegates
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              AppFlowyEditorLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en', '')],

            // Theme configuration
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeManager.themeMode,

            // Initial route - use floating panel for macOS if authenticated
            home: const SplashPage(),

            // Route configuration
            routes: {
              '/login': (context) => const LoginPage(),
              '/home': (context) => const ProjectsHomePage(),
              '/projects': (context) => const ProjectsHomePage(),
              '/reports': (context) => const ReportsPage(),
              '/floating-panel': (context) => const FloatingPanelPage(),
              '/floating-panel-settings': (context) =>
                  const FloatingPanelSettingsPage(),
            },

            // Handle parameterized routes
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/otp-verification':
                  final email = settings.arguments as String;
                  return MaterialPageRoute(
                    builder: (context) => OtpVerificationPage(email: email),
                  );
                default:
                  return null;
              }
            },

            // Error handling
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}

/// Placeholder home page - will be replaced with projects home page
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('TurboTask'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              getIt<ThemeManager>().toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout functionality
              getIt<AuthBloc>().add(const AuthStateEvent.logout());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 64,
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome to TurboTask!',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Projects page is being prepared...',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/projects');
              },
              child: const Text('Go to Projects'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Splash page for macOS floating panel
class FloatingPanelSplashPage extends StatefulWidget {
  const FloatingPanelSplashPage({super.key});

  @override
  State<FloatingPanelSplashPage> createState() =>
      _FloatingPanelSplashPageState();
}

class _FloatingPanelSplashPageState extends State<FloatingPanelSplashPage> {
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    print('FloatingPanelSplashPage initState');

    // Add a timeout fallback in case auth state doesn't emit
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted && !_hasNavigated) {
        _navigateToFloatingPanel();
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
          Navigator.of(context).pushReplacementNamed('/floating-panel');
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

  void _navigateToFloatingPanel() {
    if (mounted && !_hasNavigated) {
      _hasNavigated = true;
      Navigator.of(context).pushReplacementNamed('/floating-panel');
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
                const AnimatedLogoWidget(size: 80, iconSize: 40),
                const SizedBox(height: 16),

                const Text(
                  'TurboTask Panel',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                ),

                const SizedBox(height: 8),

                Text(
                  'Your tasks, always at hand.',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 32),

                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/auth_manager.dart';
import '../auth/secure_storage_service.dart';
import '../network/api_service.dart';
import '../theme/theme_manager.dart';
import 'injection.config.dart';

/// Global service locator instance
final getIt = GetIt.instance;

/// Configure dependency injection
@InjectableInit()
Future<void> configureDependencies() async {
  // Register external dependencies that need async initialization
  await _registerExternalDependencies();

  // Initialize injectable dependencies
  getIt.init();

  // Initialize AuthManager after all dependencies are configured
  await getIt.get<AuthManager>().initialize();
}

/// Register external dependencies that can't be handled by injectable
Future<void> _registerExternalDependencies() async {
  // Register SharedPreferences as singleton
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  // Register ThemeManager as singleton and initialize it
  final themeManager = ThemeManager();
  await themeManager.init();
  getIt.registerSingleton<ThemeManager>(themeManager);
}

/// Injectable module for registering services
@module
abstract class RegisterModule {
  @singleton
  ApiService apiService(Dio dio, SecureStorageService secureStorage) =>
      ApiService(dio, secureStorage);

  @singleton
  Dio get dio => Dio()
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );
}

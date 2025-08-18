import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../auth/auth_manager.dart';
import '../auth/secure_storage_service.dart';
import '../network/api_service.dart';
import '../theme/theme_manager.dart';
import 'injection.config.dart';
import '../../features/breaks/data/datasources/break_remote_datasource.dart';
import '../../features/breaks/data/repositories/break_repository_impl.dart';
import '../../features/breaks/domain/repositories/break_repository.dart';
import '../../features/breaks/domain/usecases/start_break_usecase.dart';
import '../../features/breaks/domain/usecases/stop_break_usecase.dart';
import '../../features/breaks/domain/usecases/get_active_break_usecase.dart';
import '../../features/breaks/domain/usecases/get_break_stats_usecase.dart';
import '../../features/breaks/presentation/bloc/break_bloc.dart';

/// Global service locator instance
final getIt = GetIt.instance;

/// Configure dependency injection
@InjectableInit()
Future<void> configureDependencies() async {
  // Register external dependencies that need async initialization
  await _registerExternalDependencies();

  // Initialize injectable dependencies
  getIt.init();

  // Register break-related dependencies
  _registerBreakDependencies();

  // Note: TodoActions dependencies are registered automatically via @injectable annotations

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

  // Note: FocusToastService is registered automatically via @singleton annotation
}

/// Register break-related dependencies manually
void _registerBreakDependencies() {
  // Data sources
  getIt.registerLazySingleton<BreakRemoteDataSource>(
    () => BreakRemoteDataSourceImpl(getIt<ApiService>()),
  );

  // Repositories
  getIt.registerLazySingleton<BreakRepository>(
    () => BreakRepositoryImpl(getIt<BreakRemoteDataSource>()),
  );

  // Use cases
  getIt.registerLazySingleton<StartBreakUseCase>(
    () => StartBreakUseCase(getIt<BreakRepository>()),
  );
  getIt.registerLazySingleton<StopBreakUseCase>(
    () => StopBreakUseCase(getIt<BreakRepository>()),
  );
  getIt.registerLazySingleton<GetActiveBreakUseCase>(
    () => GetActiveBreakUseCase(getIt<BreakRepository>()),
  );
  getIt.registerLazySingleton<GetBreakStatsUseCase>(
    () => GetBreakStatsUseCase(getIt<BreakRepository>()),
  );

  // Bloc
  getIt.registerFactory<BreakBloc>(
    () => BreakBloc(
      getIt<StartBreakUseCase>(),
      getIt<StopBreakUseCase>(),
      getIt<GetActiveBreakUseCase>(),
      getIt<GetBreakStatsUseCase>(),
    ),
  );
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

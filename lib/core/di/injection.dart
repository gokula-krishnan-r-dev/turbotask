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
import '../../features/todos/data/datasources/ai_task_remote_datasource.dart';
import '../../features/todos/data/repositories/ai_task_repository_impl.dart';
import '../../features/todos/domain/repositories/ai_task_repository.dart';
import '../../features/todos/domain/usecases/ai_task_usecase.dart';
import '../../features/todos/presentation/bloc/ai_task_bloc.dart';
import '../services/websocket_service.dart';
import '../services/realtime_kanban_service.dart';

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

  // Register AI-related dependencies
  _registerAIDependencies();

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

/// Register AI-related dependencies manually
void _registerAIDependencies() {
  // WebSocket service (singleton)
  getIt.registerSingleton<WebSocketService>(
    WebSocketService(getIt<AuthManager>()),
  );

  // Realtime Kanban service (singleton)
  getIt.registerSingleton<RealtimeKanbanService>(
    RealtimeKanbanService(getIt<WebSocketService>()),
  );

  // Data sources
  getIt.registerLazySingleton<AITaskRemoteDataSource>(
    () => AITaskRemoteDataSourceImpl(getIt<ApiService>()),
  );

  // Repositories
  getIt.registerLazySingleton<AITaskRepository>(
    () => AITaskRepositoryImpl(getIt<AITaskRemoteDataSource>()),
  );

  // Use cases
  getIt.registerLazySingleton<AITaskUseCase>(
    () => AITaskUseCase(getIt<AITaskRepository>()),
  );

  // Bloc
  getIt.registerFactory<AITaskBloc>(
    () => AITaskBloc(getIt<AITaskUseCase>(), getIt<WebSocketService>()),
  );
}

/// Injectable module for registering services
@module
abstract class RegisterModule {
  @singleton
  ApiService apiService(Dio dio, SecureStorageService secureStorage) =>
      ApiService(dio, secureStorage);

  @singleton
  SecureStorageService secureStorageService(SharedPreferences prefs) =>
      SecureStorageService(prefs);

  @singleton
  Dio get dio => Dio()
    ..options = BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    );
}

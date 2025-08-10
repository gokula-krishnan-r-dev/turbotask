// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:turbotask/core/auth/auth_bloc.dart' as _i1028;
import 'package:turbotask/core/auth/auth_manager.dart' as _i293;
import 'package:turbotask/core/auth/secure_storage_service.dart' as _i484;
import 'package:turbotask/core/di/injection.dart' as _i208;
import 'package:turbotask/core/network/api_service.dart' as _i79;
import 'package:turbotask/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i577;
import 'package:turbotask/features/auth/data/repositories/auth_repository_impl.dart'
    as _i544;
import 'package:turbotask/features/auth/domain/repositories/auth_repository.dart'
    as _i766;
import 'package:turbotask/features/auth/domain/usecases/get_current_user_usecase.dart'
    as _i247;
import 'package:turbotask/features/auth/domain/usecases/initiate_otp_usecase.dart'
    as _i86;
import 'package:turbotask/features/auth/domain/usecases/login_usecase.dart'
    as _i151;
import 'package:turbotask/features/auth/domain/usecases/logout_usecase.dart'
    as _i805;
import 'package:turbotask/features/auth/domain/usecases/verify_otp_usecase.dart'
    as _i460;
import 'package:turbotask/features/auth/presentation/bloc/login_bloc.dart'
    as _i216;
import 'package:turbotask/features/auth/presentation/bloc/otp_bloc.dart'
    as _i352;
import 'package:turbotask/features/projects/data/datasources/project_remote_datasource.dart'
    as _i247;
import 'package:turbotask/features/projects/data/repositories/project_repository_impl.dart'
    as _i565;
import 'package:turbotask/features/projects/domain/repositories/project_repository.dart'
    as _i680;
import 'package:turbotask/features/projects/domain/usecases/create_project_usecase.dart'
    as _i245;
import 'package:turbotask/features/projects/domain/usecases/get_project_stats_usecase.dart'
    as _i967;
import 'package:turbotask/features/projects/domain/usecases/get_user_projects_usecase.dart'
    as _i69;
import 'package:turbotask/features/projects/presentation/bloc/projects_bloc.dart'
    as _i217;
import 'package:turbotask/features/todos/data/datasources/todo_remote_datasource.dart'
    as _i95;
import 'package:turbotask/features/todos/data/repositories/todo_repository_impl.dart'
    as _i410;
import 'package:turbotask/features/todos/domain/repositories/todo_repository.dart'
    as _i954;
import 'package:turbotask/features/todos/domain/usecases/create_subtask_usecase.dart'
    as _i929;
import 'package:turbotask/features/todos/domain/usecases/create_todo_usecase.dart'
    as _i355;
import 'package:turbotask/features/todos/domain/usecases/get_project_todos_usecase.dart'
    as _i1037;
import 'package:turbotask/features/todos/domain/usecases/update_todo_status_usecase.dart'
    as _i464;
import 'package:turbotask/features/todos/presentation/bloc/todos_bloc.dart'
    as _i297;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i484.SecureStorageService>(
      () => _i484.SecureStorageService(gh<_i460.SharedPreferences>()),
    );
    gh.singleton<_i79.ApiService>(
      () => registerModule.apiService(
        gh<_i361.Dio>(),
        gh<_i484.SecureStorageService>(),
      ),
    );
    gh.singleton<_i293.AuthManager>(
      () => _i293.AuthManager(
        gh<_i484.SecureStorageService>(),
        gh<_i79.ApiService>(),
      ),
    );
    gh.singleton<_i1028.AuthBloc>(
      () => _i1028.AuthBloc(gh<_i293.AuthManager>()),
    );
    gh.singleton<_i95.TodoRemoteDataSource>(
      () => _i95.TodoRemoteDataSourceImpl(gh<_i79.ApiService>()),
    );
    gh.singleton<_i247.ProjectRemoteDataSource>(
      () => _i247.ProjectRemoteDataSourceImpl(gh<_i79.ApiService>()),
    );
    gh.singleton<_i954.TodoRepository>(
      () => _i410.TodoRepositoryImpl(gh<_i95.TodoRemoteDataSource>()),
    );
    gh.factory<_i464.UpdateTodoStatusUseCase>(
      () => _i464.UpdateTodoStatusUseCase(gh<_i954.TodoRepository>()),
    );
    gh.factory<_i929.CreateSubtaskUseCase>(
      () => _i929.CreateSubtaskUseCase(gh<_i954.TodoRepository>()),
    );
    gh.factory<_i355.CreateTodoUseCase>(
      () => _i355.CreateTodoUseCase(gh<_i954.TodoRepository>()),
    );
    gh.factory<_i1037.GetProjectTodosUseCase>(
      () => _i1037.GetProjectTodosUseCase(gh<_i954.TodoRepository>()),
    );
    gh.singleton<_i577.AuthRemoteDataSource>(
      () => _i577.AuthRemoteDataSourceImpl(gh<_i79.ApiService>()),
    );
    gh.singleton<_i766.AuthRepository>(
      () => _i544.AuthRepositoryImpl(
        gh<_i577.AuthRemoteDataSource>(),
        gh<_i79.ApiService>(),
        gh<_i293.AuthManager>(),
      ),
    );
    gh.singleton<_i680.ProjectRepository>(
      () => _i565.ProjectRepositoryImpl(gh<_i247.ProjectRemoteDataSource>()),
    );
    gh.factory<_i86.InitiateOtpUseCase>(
      () => _i86.InitiateOtpUseCase(gh<_i766.AuthRepository>()),
    );
    gh.factory<_i151.LoginUseCase>(
      () => _i151.LoginUseCase(gh<_i766.AuthRepository>()),
    );
    gh.factory<_i805.LogoutUseCase>(
      () => _i805.LogoutUseCase(gh<_i766.AuthRepository>()),
    );
    gh.factory<_i247.GetCurrentUserUseCase>(
      () => _i247.GetCurrentUserUseCase(gh<_i766.AuthRepository>()),
    );
    gh.factory<_i460.VerifyOtpUseCase>(
      () => _i460.VerifyOtpUseCase(gh<_i766.AuthRepository>()),
    );
    gh.factory<_i297.TodosBloc>(
      () => _i297.TodosBloc(
        gh<_i1037.GetProjectTodosUseCase>(),
        gh<_i355.CreateTodoUseCase>(),
        gh<_i929.CreateSubtaskUseCase>(),
        gh<_i464.UpdateTodoStatusUseCase>(),
        gh<_i954.TodoRepository>(),
      ),
    );
    gh.factory<_i216.LoginBloc>(
      () => _i216.LoginBloc(gh<_i86.InitiateOtpUseCase>()),
    );
    gh.factory<_i967.GetProjectStatsUseCase>(
      () => _i967.GetProjectStatsUseCase(gh<_i680.ProjectRepository>()),
    );
    gh.factory<_i69.GetUserProjectsUseCase>(
      () => _i69.GetUserProjectsUseCase(gh<_i680.ProjectRepository>()),
    );
    gh.factory<_i245.CreateProjectUseCase>(
      () => _i245.CreateProjectUseCase(gh<_i680.ProjectRepository>()),
    );
    gh.factory<_i352.OtpBloc>(
      () => _i352.OtpBloc(
        gh<_i460.VerifyOtpUseCase>(),
        gh<_i86.InitiateOtpUseCase>(),
      ),
    );
    gh.factory<_i217.ProjectsBloc>(
      () => _i217.ProjectsBloc(
        gh<_i69.GetUserProjectsUseCase>(),
        gh<_i245.CreateProjectUseCase>(),
        gh<_i967.GetProjectStatsUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i208.RegisterModule {}

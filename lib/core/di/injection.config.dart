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
import 'package:turbotask/core/services/focus_mode_service.dart' as _i336;
import 'package:turbotask/core/services/focus_toast_service.dart' as _i511;
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
import 'package:turbotask/features/reports/data/datasources/reports_api_service.dart'
    as _i922;
import 'package:turbotask/features/reports/data/repositories/reports_repository_impl.dart'
    as _i569;
import 'package:turbotask/features/reports/domain/repositories/reports_repository.dart'
    as _i732;
import 'package:turbotask/features/reports/domain/usecases/export_report_usecase.dart'
    as _i442;
import 'package:turbotask/features/reports/domain/usecases/get_reports_overview_usecase.dart'
    as _i116;
import 'package:turbotask/features/reports/presentation/bloc/reports_bloc.dart'
    as _i424;
import 'package:turbotask/features/todos/data/datasources/kanban_remote_datasource.dart'
    as _i341;
import 'package:turbotask/features/todos/data/datasources/note_remote_datasource.dart'
    as _i1022;
import 'package:turbotask/features/todos/data/datasources/subtask_remote_datasource.dart'
    as _i283;
import 'package:turbotask/features/todos/data/datasources/todo_actions_remote_datasource.dart'
    as _i699;
import 'package:turbotask/features/todos/data/repositories/kanban_repository_impl.dart'
    as _i500;
import 'package:turbotask/features/todos/data/repositories/note_repository_impl.dart'
    as _i972;
import 'package:turbotask/features/todos/data/repositories/subtask_repository_impl.dart'
    as _i517;
import 'package:turbotask/features/todos/data/repositories/todo_actions_repository_impl.dart'
    as _i1051;
import 'package:turbotask/features/todos/domain/repositories/kanban_repository.dart'
    as _i204;
import 'package:turbotask/features/todos/domain/repositories/note_repository.dart'
    as _i351;
import 'package:turbotask/features/todos/domain/repositories/subtask_repository.dart'
    as _i592;
import 'package:turbotask/features/todos/domain/repositories/todo_actions_repository.dart'
    as _i832;
import 'package:turbotask/features/todos/domain/usecases/create_kanban_todo_usecase.dart'
    as _i68;
import 'package:turbotask/features/todos/domain/usecases/create_note_usecase.dart'
    as _i535;
import 'package:turbotask/features/todos/domain/usecases/create_subtask_usecase.dart'
    as _i929;
import 'package:turbotask/features/todos/domain/usecases/delete_note_usecase.dart'
    as _i613;
import 'package:turbotask/features/todos/domain/usecases/delete_subtask_usecase.dart'
    as _i579;
import 'package:turbotask/features/todos/domain/usecases/get_kanban_board_usecase.dart'
    as _i722;
import 'package:turbotask/features/todos/domain/usecases/get_notes_usecase.dart'
    as _i28;
import 'package:turbotask/features/todos/domain/usecases/get_subtasks_usecase.dart'
    as _i85;
import 'package:turbotask/features/todos/domain/usecases/move_todo_usecase.dart'
    as _i827;
import 'package:turbotask/features/todos/domain/usecases/todo_actions_usecase.dart'
    as _i885;
import 'package:turbotask/features/todos/domain/usecases/update_note_usecase.dart'
    as _i602;
import 'package:turbotask/features/todos/domain/usecases/update_subtask_usecase.dart'
    as _i58;
import 'package:turbotask/features/todos/presentation/bloc/kanban_board_bloc.dart'
    as _i585;
import 'package:turbotask/features/todos/presentation/bloc/note_bloc.dart'
    as _i623;
import 'package:turbotask/features/todos/presentation/bloc/subtask_bloc.dart'
    as _i432;
import 'package:turbotask/features/todos/presentation/bloc/todo_actions_bloc.dart'
    as _i466;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i336.FocusModeService>(() => _i336.FocusModeService());
    gh.singleton<_i511.FocusToastService>(() => _i511.FocusToastService());
    gh.singleton<_i484.SecureStorageService>(
      () => registerModule.secureStorageService(gh<_i460.SharedPreferences>()),
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
    gh.factory<_i341.KanbanRemoteDataSource>(
      () => _i341.KanbanRemoteDataSourceImpl(gh<_i79.ApiService>()),
    );
    gh.factory<_i283.SubtaskRemoteDataSource>(
      () => _i283.SubtaskRemoteDataSourceImpl(gh<_i79.ApiService>()),
    );
    gh.factory<_i204.KanbanRepository>(
      () => _i500.KanbanRepositoryImpl(gh<_i341.KanbanRemoteDataSource>()),
    );
    gh.factory<_i1022.NoteRemoteDataSource>(
      () => _i1022.NoteRemoteDataSourceImpl(gh<_i79.ApiService>()),
    );
    gh.singleton<_i247.ProjectRemoteDataSource>(
      () => _i247.ProjectRemoteDataSourceImpl(gh<_i79.ApiService>()),
    );
    gh.lazySingleton<_i922.ReportsApiService>(
      () => _i922.ReportsApiServiceImpl(gh<_i79.ApiService>()),
    );
    gh.factory<_i699.TodoActionsRemoteDataSource>(
      () => _i699.TodoActionsRemoteDataSourceImpl(gh<_i79.ApiService>()),
    );
    gh.factory<_i832.TodoActionsRepository>(
      () => _i1051.TodoActionsRepositoryImpl(
        gh<_i699.TodoActionsRemoteDataSource>(),
      ),
    );
    gh.singleton<_i577.AuthRemoteDataSource>(
      () => _i577.AuthRemoteDataSourceImpl(gh<_i79.ApiService>()),
    );
    gh.lazySingleton<_i732.ReportsRepository>(
      () => _i569.ReportsRepositoryImpl(gh<_i922.ReportsApiService>()),
    );
    gh.lazySingleton<_i592.SubtaskRepository>(
      () => _i517.SubtaskRepositoryImpl(gh<_i283.SubtaskRemoteDataSource>()),
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
    gh.lazySingleton<_i351.NoteRepository>(
      () => _i972.NoteRepositoryImpl(gh<_i1022.NoteRemoteDataSource>()),
    );
    gh.factory<_i929.CreateSubtaskUseCase>(
      () => _i929.CreateSubtaskUseCase(gh<_i592.SubtaskRepository>()),
    );
    gh.factory<_i58.UpdateSubtaskUseCase>(
      () => _i58.UpdateSubtaskUseCase(gh<_i592.SubtaskRepository>()),
    );
    gh.factory<_i579.DeleteSubtaskUseCase>(
      () => _i579.DeleteSubtaskUseCase(gh<_i592.SubtaskRepository>()),
    );
    gh.factory<_i85.GetSubtasksUseCase>(
      () => _i85.GetSubtasksUseCase(gh<_i592.SubtaskRepository>()),
    );
    gh.factory<_i216.LoginBloc>(
      () => _i216.LoginBloc(gh<_i86.InitiateOtpUseCase>()),
    );
    gh.factory<_i722.GetKanbanBoardUseCase>(
      () => _i722.GetKanbanBoardUseCase(gh<_i204.KanbanRepository>()),
    );
    gh.factory<_i68.CreateKanbanTodoUseCase>(
      () => _i68.CreateKanbanTodoUseCase(gh<_i204.KanbanRepository>()),
    );
    gh.factory<_i827.MoveTodoUseCase>(
      () => _i827.MoveTodoUseCase(gh<_i204.KanbanRepository>()),
    );
    gh.factory<_i827.ReorderTodosUseCase>(
      () => _i827.ReorderTodosUseCase(gh<_i204.KanbanRepository>()),
    );
    gh.factory<_i827.BulkMoveTodosUseCase>(
      () => _i827.BulkMoveTodosUseCase(gh<_i204.KanbanRepository>()),
    );
    gh.factory<_i585.KanbanBoardBloc>(
      () => _i585.KanbanBoardBloc(
        gh<_i722.GetKanbanBoardUseCase>(),
        gh<_i68.CreateKanbanTodoUseCase>(),
        gh<_i827.MoveTodoUseCase>(),
        gh<_i827.ReorderTodosUseCase>(),
      ),
    );
    gh.factory<_i535.CreateNoteUseCase>(
      () => _i535.CreateNoteUseCase(gh<_i351.NoteRepository>()),
    );
    gh.factory<_i613.DeleteNoteUseCase>(
      () => _i613.DeleteNoteUseCase(gh<_i351.NoteRepository>()),
    );
    gh.factory<_i602.UpdateNoteUseCase>(
      () => _i602.UpdateNoteUseCase(gh<_i351.NoteRepository>()),
    );
    gh.factory<_i28.GetNotesUseCase>(
      () => _i28.GetNotesUseCase(gh<_i351.NoteRepository>()),
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
    gh.factory<_i432.SubtaskBloc>(
      () => _i432.SubtaskBloc(
        gh<_i85.GetSubtasksUseCase>(),
        gh<_i929.CreateSubtaskUseCase>(),
        gh<_i58.UpdateSubtaskUseCase>(),
        gh<_i579.DeleteSubtaskUseCase>(),
      ),
    );
    gh.factory<_i885.TodoActionsUseCase>(
      () => _i885.TodoActionsUseCase(gh<_i832.TodoActionsRepository>()),
    );
    gh.factory<_i116.GetReportsOverviewUseCase>(
      () => _i116.GetReportsOverviewUseCase(gh<_i732.ReportsRepository>()),
    );
    gh.factory<_i442.ExportReportUseCase>(
      () => _i442.ExportReportUseCase(gh<_i732.ReportsRepository>()),
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
    gh.factory<_i424.ReportsBloc>(
      () => _i424.ReportsBloc(
        gh<_i116.GetReportsOverviewUseCase>(),
        gh<_i442.ExportReportUseCase>(),
        gh<_i732.ReportsRepository>(),
      ),
    );
    gh.factory<_i623.NoteBloc>(
      () => _i623.NoteBloc(
        gh<_i28.GetNotesUseCase>(),
        gh<_i535.CreateNoteUseCase>(),
        gh<_i602.UpdateNoteUseCase>(),
        gh<_i613.DeleteNoteUseCase>(),
      ),
    );
    gh.factory<_i466.TodoActionsBloc>(
      () => _i466.TodoActionsBloc(gh<_i885.TodoActionsUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i208.RegisterModule {}

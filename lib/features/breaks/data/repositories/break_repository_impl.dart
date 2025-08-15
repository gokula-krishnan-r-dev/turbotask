import '../../domain/entities/break_session.dart';
import '../../domain/entities/break_stats.dart';
import '../../domain/repositories/break_repository.dart';
import '../datasources/break_remote_datasource.dart';
import '../models/break_request_models.dart';

class BreakRepositoryImpl implements BreakRepository {
  final BreakRemoteDataSource _remoteDataSource;

  const BreakRepositoryImpl(this._remoteDataSource);

  @override
  Future<BreakSession> startBreak(StartBreakRequest request) async {
    return await _remoteDataSource.startBreak(request);
  }

  @override
  Future<BreakSession> stopBreak(StopBreakRequest request) async {
    return await _remoteDataSource.stopBreak(request);
  }

  @override
  Future<BreakSession?> getActiveBreak() async {
    return await _remoteDataSource.getActiveBreak();
  }

  @override
  Future<List<BreakSession>> getBreakHistory({
    int limit = 20,
    int offset = 0,
  }) async {
    return await _remoteDataSource.getBreakHistory(
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<List<BreakSession>> getBreaksByTodo(
    String todoId, {
    int limit = 20,
    int offset = 0,
  }) async {
    return await _remoteDataSource.getBreaksByTodo(
      todoId,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<List<BreakSession>> getBreaksByProject(
    String projectId, {
    int limit = 20,
    int offset = 0,
  }) async {
    return await _remoteDataSource.getBreaksByProject(
      projectId,
      limit: limit,
      offset: offset,
    );
  }

  @override
  Future<BreakStats> getBreakStats() async {
    return await _remoteDataSource.getBreakStats();
  }
}

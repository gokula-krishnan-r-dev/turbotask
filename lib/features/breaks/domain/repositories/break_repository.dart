import '../entities/break_session.dart';
import '../entities/break_stats.dart';
import '../../data/models/break_request_models.dart';

abstract class BreakRepository {
  Future<BreakSession> startBreak(StartBreakRequest request);
  Future<BreakSession> stopBreak(StopBreakRequest request);
  Future<BreakSession?> getActiveBreak();
  Future<List<BreakSession>> getBreakHistory({int limit = 20, int offset = 0});
  Future<List<BreakSession>> getBreaksByTodo(
    String todoId, {
    int limit = 20,
    int offset = 0,
  });
  Future<List<BreakSession>> getBreaksByProject(
    String projectId, {
    int limit = 20,
    int offset = 0,
  });
  Future<BreakStats> getBreakStats();
}

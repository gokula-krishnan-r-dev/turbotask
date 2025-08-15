import '../entities/break_stats.dart';
import '../repositories/break_repository.dart';

class GetBreakStatsUseCase {
  final BreakRepository _repository;

  const GetBreakStatsUseCase(this._repository);

  Future<BreakStats> call() async {
    return await _repository.getBreakStats();
  }
}

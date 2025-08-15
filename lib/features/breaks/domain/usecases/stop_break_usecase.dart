import '../entities/break_session.dart';
import '../repositories/break_repository.dart';
import '../../data/models/break_request_models.dart';

class StopBreakUseCase {
  final BreakRepository _repository;

  const StopBreakUseCase(this._repository);

  Future<BreakSession> call(StopBreakRequest request) async {
    return await _repository.stopBreak(request);
  }
}

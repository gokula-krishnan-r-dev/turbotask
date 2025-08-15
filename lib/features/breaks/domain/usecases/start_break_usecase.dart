import '../entities/break_session.dart';
import '../repositories/break_repository.dart';
import '../../data/models/break_request_models.dart';

class StartBreakUseCase {
  final BreakRepository _repository;

  const StartBreakUseCase(this._repository);

  Future<BreakSession> call(StartBreakRequest request) async {
    return await _repository.startBreak(request);
  }
}

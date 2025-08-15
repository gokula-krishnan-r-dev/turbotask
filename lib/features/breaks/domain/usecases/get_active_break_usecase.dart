import '../entities/break_session.dart';
import '../repositories/break_repository.dart';

class GetActiveBreakUseCase {
  final BreakRepository _repository;

  const GetActiveBreakUseCase(this._repository);

  Future<BreakSession?> call() async {
    return await _repository.getActiveBreak();
  }
}

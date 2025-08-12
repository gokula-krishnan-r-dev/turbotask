import 'package:injectable/injectable.dart';

import '../entities/subtask.dart';
import '../repositories/subtask_repository.dart';

@injectable
class GetSubtasksUseCase {
  final SubtaskRepository _repository;

  GetSubtasksUseCase(this._repository);

  Future<List<Subtask>> call(String todoId) {
    return _repository.getSubtasks(todoId);
  }
}

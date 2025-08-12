import 'package:injectable/injectable.dart';

import '../repositories/subtask_repository.dart';

@injectable
class DeleteSubtaskUseCase {
  final SubtaskRepository _repository;

  DeleteSubtaskUseCase(this._repository);

  Future<void> call(String subtaskId) {
    return _repository.deleteSubtask(subtaskId);
  }
}

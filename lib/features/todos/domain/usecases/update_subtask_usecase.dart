import 'package:injectable/injectable.dart';

import '../../data/models/subtask_request_models.dart';
import '../entities/subtask.dart';
import '../repositories/subtask_repository.dart';

@injectable
class UpdateSubtaskUseCase {
  final SubtaskRepository _repository;

  UpdateSubtaskUseCase(this._repository);

  Future<Subtask> call(String subtaskId, UpdateSubtaskRequest request) {
    return _repository.updateSubtask(subtaskId, request);
  }
}

import 'package:injectable/injectable.dart';

import '../../data/models/subtask_request_models.dart';
import '../entities/subtask.dart';
import '../repositories/subtask_repository.dart';

@injectable
class CreateSubtaskUseCase {
  final SubtaskRepository _repository;

  CreateSubtaskUseCase(this._repository);

  Future<Subtask> call(CreateSubtaskRequest request) {
    return _repository.createSubtask(request);
  }
}

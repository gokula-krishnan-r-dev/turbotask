import 'package:injectable/injectable.dart';

import '../../domain/entities/subtask.dart';
import '../../domain/repositories/subtask_repository.dart';
import '../datasources/subtask_remote_datasource.dart';
import '../models/subtask_request_models.dart';

@LazySingleton(as: SubtaskRepository)
class SubtaskRepositoryImpl implements SubtaskRepository {
  final SubtaskRemoteDataSource _remoteDataSource;

  SubtaskRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Subtask>> getSubtasks(String todoId) {
    return _remoteDataSource.getSubtasks(todoId);
  }

  @override
  Future<Subtask> createSubtask(CreateSubtaskRequest request) {
    return _remoteDataSource.createSubtask(request);
  }

  @override
  Future<Subtask> updateSubtask(
    String subtaskId,
    UpdateSubtaskRequest request,
  ) {
    return _remoteDataSource.updateSubtask(subtaskId, request);
  }

  @override
  Future<void> deleteSubtask(String subtaskId) {
    return _remoteDataSource.deleteSubtask(subtaskId);
  }

  @override
  Future<void> reorderSubtasks(ReorderSubtasksRequest request) {
    return _remoteDataSource.reorderSubtasks(request);
  }
}

import 'package:injectable/injectable.dart';

import '../../domain/entities/todo.dart';
import '../../domain/repositories/ai_task_repository.dart';
import '../datasources/ai_task_remote_datasource.dart';
import '../models/ai_task_models.dart';

@Injectable(as: AITaskRepository)
class AITaskRepositoryImpl implements AITaskRepository {
  final AITaskRemoteDataSource _remoteDataSource;

  const AITaskRepositoryImpl(this._remoteDataSource);

  @override
  Future<OptimizedAITaskResponse> createOptimizedAITask(
    CreateOptimizedAITaskRequest request,
  ) async {
    return await _remoteDataSource.createOptimizedAITask(request);
  }

  @override
  Future<Todo> regenerateAIEnhancements(String taskId) async {
    return await _remoteDataSource.regenerateAIEnhancements(taskId);
  }

  @override
  Future<Map<String, dynamic>> improveDescription(
    ImproveDescriptionRequest request,
  ) async {
    return await _remoteDataSource.improveDescription(request);
  }

  @override
  Future<List<Map<String, dynamic>>> refineSubtasks(
    RefineSubtasksRequest request,
  ) async {
    return await _remoteDataSource.refineSubtasks(request);
  }
}

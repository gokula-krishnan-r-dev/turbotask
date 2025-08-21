import 'package:injectable/injectable.dart';

import '../../data/models/ai_task_models.dart';
import '../entities/todo.dart';
import '../repositories/ai_task_repository.dart';

@injectable
class AITaskUseCase {
  final AITaskRepository _repository;

  const AITaskUseCase(this._repository);

  /// Create an optimized AI-enhanced task
  Future<OptimizedAITaskResponse> createOptimizedAITask(
    CreateOptimizedAITaskRequest request,
  ) async {
    return await _repository.createOptimizedAITask(request);
  }

  /// Regenerate AI enhancements for an existing task
  Future<Todo> regenerateAIEnhancements(String taskId) async {
    return await _repository.regenerateAIEnhancements(taskId);
  }

  /// Improve task description using AI
  Future<Map<String, dynamic>> improveDescription(
    ImproveDescriptionRequest request,
  ) async {
    return await _repository.improveDescription(request);
  }

  /// Refine subtasks using AI
  Future<List<Map<String, dynamic>>> refineSubtasks(
    RefineSubtasksRequest request,
  ) async {
    return await _repository.refineSubtasks(request);
  }
}

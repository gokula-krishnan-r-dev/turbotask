import '../../data/models/ai_task_models.dart';
import '../entities/todo.dart';

abstract class AITaskRepository {
  Future<OptimizedAITaskResponse> createOptimizedAITask(
    CreateOptimizedAITaskRequest request,
  );

  Future<Todo> regenerateAIEnhancements(String taskId);

  Future<Map<String, dynamic>> improveDescription(
    ImproveDescriptionRequest request,
  );

  Future<List<Map<String, dynamic>>> refineSubtasks(
    RefineSubtasksRequest request,
  );
}

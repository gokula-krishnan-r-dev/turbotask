import '../entities/subtask.dart';
import '../../data/models/subtask_request_models.dart';

abstract class SubtaskRepository {
  Future<List<Subtask>> getSubtasks(String todoId);
  Future<Subtask> createSubtask(CreateSubtaskRequest request);
  Future<Subtask> updateSubtask(String subtaskId, UpdateSubtaskRequest request);
  Future<void> deleteSubtask(String subtaskId);
  Future<void> reorderSubtasks(ReorderSubtasksRequest request);
}

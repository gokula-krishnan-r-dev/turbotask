import 'package:injectable/injectable.dart';

import '../entities/subtask.dart';
import '../entities/create_subtask_request.dart';
import '../repositories/todo_repository.dart';

/// Use case for creating a new subtask.
/// Handles business logic and validation for subtask creation.
@injectable
class CreateSubtaskUseCase {
  const CreateSubtaskUseCase(this._todoRepository);

  final TodoRepository _todoRepository;

  /// Execute creating a new subtask
  /// Returns the created subtask entity
  Future<Subtask> call(String todoId, CreateSubtaskRequest request) async {
    // Validate todo ID
    if (todoId.trim().isEmpty) {
      throw ArgumentError('Todo ID cannot be empty');
    }

    // Validate subtask name
    if (request.name.trim().isEmpty) {
      throw ArgumentError('Subtask name cannot be empty');
    }

    // // Validate subtask description
    // if (request.description.trim().isEmpty) {
    //   throw ArgumentError('Subtask description cannot be empty');
    // }

    // Validate estimated time if provided
    if (request.estimatedTime != null && request.estimatedTime! <= 0) {
      throw ArgumentError('Estimated time must be greater than 0');
    }

    // Verify that the parent todo exists
    try {
      await _todoRepository.getTodoById(todoId);
    } catch (e) {
      throw ArgumentError('Parent todo not found');
    }

    return await _todoRepository.createSubtask(todoId, request);
  }
}

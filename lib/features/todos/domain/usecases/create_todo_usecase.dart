import 'package:injectable/injectable.dart';

import '../entities/todo.dart';
import '../entities/create_todo_request.dart';
import '../repositories/todo_repository.dart';

/// Use case for creating a new todo.
/// Handles business logic and validation for todo creation.
@injectable
class CreateTodoUseCase {
  const CreateTodoUseCase(this._todoRepository);

  final TodoRepository _todoRepository;

  /// Execute creating a new todo
  /// Returns the created todo entity
  Future<Todo> call(CreateTodoRequest request) async {
    // Validate task name
    if (request.taskName.trim().isEmpty) {
      throw ArgumentError('Task name cannot be empty');
    }

    // Validate task description
    if (request.taskDescription.trim().isEmpty) {
      throw ArgumentError('Task description cannot be empty');
    }

    // Validate project ID
    if (request.projectId.trim().isEmpty) {
      throw ArgumentError('Project ID cannot be empty');
    }

    // Validate estimated time if provided
    if (request.estimatedTime != null && request.estimatedTime! <= 0) {
      throw ArgumentError('Estimated time must be greater than 0');
    }

    // Validate difficulty rating if provided
    if (request.difficultyRating != null) {
      if (request.difficultyRating! < 1 || request.difficultyRating! > 10) {
        throw ArgumentError('Difficulty rating must be between 1 and 10');
      }
    }

    // Validate energy level if provided
    if (request.energyLevelRequired != null) {
      if (request.energyLevelRequired! < 1 ||
          request.energyLevelRequired! > 5) {
        throw ArgumentError('Energy level must be between 1 and 5');
      }
    }

    // Validate due date if provided
    if (request.dueDate != null && request.dueDate!.isBefore(DateTime.now())) {
      throw ArgumentError('Due date cannot be in the past');
    }

    return await _todoRepository.createTodo(request);
  }
}

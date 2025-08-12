import 'package:injectable/injectable.dart';

import '../entities/todo.dart';
import '../repositories/kanban_repository.dart';
import '../../data/models/kanban_request_models.dart';

@injectable
class CreateKanbanTodoUseCase {
  final KanbanRepository _repository;

  const CreateKanbanTodoUseCase(this._repository);

  Future<Todo> call(CreateTodoRequest request) async {
    return await _repository.createTodo(request);
  }
}

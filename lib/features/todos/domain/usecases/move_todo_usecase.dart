import 'package:injectable/injectable.dart';

import '../repositories/kanban_repository.dart';
import '../../data/models/kanban_request_models.dart';

@injectable
class MoveTodoUseCase {
  final KanbanRepository _repository;

  const MoveTodoUseCase(this._repository);

  Future<void> call(MoveTodoRequest request) async {
    await _repository.moveTodo(request);
  }
}

@injectable
class ReorderTodosUseCase {
  final KanbanRepository _repository;

  const ReorderTodosUseCase(this._repository);

  Future<void> call(ReorderTodosRequest request) async {
    await _repository.reorderTodos(request);
  }
}

@injectable
class BulkMoveTodosUseCase {
  final KanbanRepository _repository;

  const BulkMoveTodosUseCase(this._repository);

  Future<void> call(BulkMoveTodosRequest request) async {
    await _repository.bulkMoveTodos(request);
  }
}

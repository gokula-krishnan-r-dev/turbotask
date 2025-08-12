import 'package:injectable/injectable.dart';

import '../../domain/entities/kanban_board.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/kanban_repository.dart';
import '../datasources/kanban_remote_datasource.dart';
import '../models/kanban_request_models.dart';

@Injectable(as: KanbanRepository)
class KanbanRepositoryImpl implements KanbanRepository {
  final KanbanRemoteDataSource _remoteDataSource;

  const KanbanRepositoryImpl(this._remoteDataSource);

  @override
  Future<KanbanBoard> getProjectKanbanBoard(String projectId) async {
    try {
      return await _remoteDataSource.getProjectKanbanBoard(projectId);
    } catch (e) {
      throw Exception('Failed to get kanban board: $e');
    }
  }

  @override
  Future<Todo> createTodo(CreateTodoRequest request) async {
    try {
      return await _remoteDataSource.createTodo(request);
    } catch (e) {
      throw Exception('Failed to create todo: $e');
    }
  }

  @override
  Future<void> moveTodo(MoveTodoRequest request) async {
    try {
      await _remoteDataSource.moveTodo(request);
    } catch (e) {
      throw Exception('Failed to move todo: $e');
    }
  }

  @override
  Future<void> reorderTodos(ReorderTodosRequest request) async {
    try {
      await _remoteDataSource.reorderTodos(request);
    } catch (e) {
      throw Exception('Failed to reorder todos: $e');
    }
  }

  @override
  Future<void> bulkMoveTodos(BulkMoveTodosRequest request) async {
    try {
      await _remoteDataSource.bulkMoveTodos(request);
    } catch (e) {
      throw Exception('Failed to bulk move todos: $e');
    }
  }
}

import '../entities/kanban_board.dart';
import '../entities/todo.dart';
import '../../data/models/kanban_request_models.dart';

abstract class KanbanRepository {
  Future<KanbanBoard> getProjectKanbanBoard(String projectId);
  Future<Todo> createTodo(CreateTodoRequest request);
  Future<void> moveTodo(MoveTodoRequest request);
  Future<void> reorderTodos(ReorderTodosRequest request);
  Future<void> bulkMoveTodos(BulkMoveTodosRequest request);
}

import 'package:injectable/injectable.dart';

import '../entities/kanban_board.dart';
import '../repositories/kanban_repository.dart';

@injectable
class GetKanbanBoardUseCase {
  final KanbanRepository _repository;

  const GetKanbanBoardUseCase(this._repository);

  Future<KanbanBoard> call(String projectId) async {
    return await _repository.getProjectKanbanBoard(projectId);
  }
}

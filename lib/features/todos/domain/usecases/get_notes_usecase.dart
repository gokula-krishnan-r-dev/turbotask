import 'package:injectable/injectable.dart';

import '../entities/note.dart';
import '../repositories/note_repository.dart';

@injectable
class GetNotesUseCase {
  final NoteRepository _repository;

  GetNotesUseCase(this._repository);

  Future<List<Note>> call(String todoId) {
    return _repository.getNotes(todoId);
  }
}

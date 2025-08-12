import 'package:injectable/injectable.dart';

import '../repositories/note_repository.dart';

@injectable
class DeleteNoteUseCase {
  final NoteRepository _repository;

  DeleteNoteUseCase(this._repository);

  Future<void> call(String noteId) {
    return _repository.deleteNote(noteId);
  }
}

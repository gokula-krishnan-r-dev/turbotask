import 'package:injectable/injectable.dart';

import '../../data/models/note_request_models.dart';
import '../entities/note.dart';
import '../repositories/note_repository.dart';

@injectable
class UpdateNoteUseCase {
  final NoteRepository _repository;

  UpdateNoteUseCase(this._repository);

  Future<Note> call(String noteId, UpdateNoteRequest request) {
    return _repository.updateNote(noteId, request);
  }
}

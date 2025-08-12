import 'package:injectable/injectable.dart';

import '../../data/models/note_request_models.dart';
import '../entities/note.dart';
import '../repositories/note_repository.dart';

@injectable
class CreateNoteUseCase {
  final NoteRepository _repository;

  CreateNoteUseCase(this._repository);

  Future<Note> call(CreateNoteRequest request) {
    return _repository.createNote(request);
  }
}

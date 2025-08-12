import '../entities/note.dart';
import '../../data/models/note_request_models.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes(String todoId);
  Future<Note> createNote(CreateNoteRequest request);
  Future<Note> updateNote(String noteId, UpdateNoteRequest request);
  Future<void> deleteNote(String noteId);
  Future<List<Note>> searchNotes(String todoId, String query);
}

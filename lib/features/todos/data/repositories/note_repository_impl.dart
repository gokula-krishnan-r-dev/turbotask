import 'package:injectable/injectable.dart';

import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/note_remote_datasource.dart';
import '../models/note_request_models.dart';

@LazySingleton(as: NoteRepository)
class NoteRepositoryImpl implements NoteRepository {
  final NoteRemoteDataSource _remoteDataSource;

  NoteRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<Note>> getNotes(String todoId) {
    return _remoteDataSource.getNotes(todoId);
  }

  @override
  Future<Note> createNote(CreateNoteRequest request) {
    return _remoteDataSource.createNote(request);
  }

  @override
  Future<Note> updateNote(String noteId, UpdateNoteRequest request) {
    return _remoteDataSource.updateNote(noteId, request);
  }

  @override
  Future<void> deleteNote(String noteId) {
    return _remoteDataSource.deleteNote(noteId);
  }

  @override
  Future<List<Note>> searchNotes(String todoId, String query) {
    return _remoteDataSource.searchNotes(todoId, query);
  }
}

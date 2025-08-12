import 'package:injectable/injectable.dart';

import '../../../../core/network/api_service.dart';
import '../../domain/entities/note.dart';
import '../models/note_request_models.dart';

abstract class NoteRemoteDataSource {
  Future<List<Note>> getNotes(String todoId);
  Future<Note> createNote(CreateNoteRequest request);
  Future<Note> updateNote(String noteId, UpdateNoteRequest request);
  Future<void> deleteNote(String noteId);
  Future<List<Note>> searchNotes(String todoId, String query);
}

@Injectable(as: NoteRemoteDataSource)
class NoteRemoteDataSourceImpl implements NoteRemoteDataSource {
  final ApiService _apiService;

  const NoteRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<Note>> getNotes(String todoId) async {
    try {
      print('NoteRemoteDataSource: Getting notes for todoId: $todoId');
      final response = await _apiService.get(
        '/api/v1/todo/todos/$todoId/notes',
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? [];
        return (data as List)
            .map((json) => Note.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to get notes: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('404') ||
          e.toString().contains('Todo not found')) {
        throw Exception('Todo not found');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<Note> createNote(CreateNoteRequest request) async {
    try {
      print(
        'NoteRemoteDataSource: Creating note for todoId: ${request.todoId}',
      );
      print('NoteRemoteDataSource: Request data: ${request.toJson()}');

      final response = await _apiService.post(
        '/api/v1/todo/todos/${request.todoId}/notes',
        data: request.toJson(),
      );

      print(
        'NoteRemoteDataSource: Create note response status: ${response.statusCode}',
      );
      print(
        'NoteRemoteDataSource: Create note response data: ${response.data}',
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return Note.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to create note: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid note data');
      } else if (e.toString().contains('404') ||
          e.toString().contains('Todo not found')) {
        throw Exception('Todo not found');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<Note> updateNote(String noteId, UpdateNoteRequest request) async {
    try {
      final response = await _apiService.put(
        '/api/v1/todo/notes/$noteId',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? response.data;
        return Note.fromJson(data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to update note: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        throw Exception('Invalid note data');
      } else if (e.toString().contains('404') ||
          e.toString().contains('not found')) {
        throw Exception('Note not found');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<void> deleteNote(String noteId) async {
    try {
      final response = await _apiService.delete('/api/v1/todo/notes/$noteId');

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to delete note: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('404') || e.toString().contains('not found')) {
        throw Exception('Note not found');
      }
      throw Exception('Network error: $e');
    }
  }

  @override
  Future<List<Note>> searchNotes(String todoId, String query) async {
    try {
      final response = await _apiService.get(
        '/api/v1/todo/todos/$todoId/notes/search',
        queryParameters: {'q': query},
      );

      if (response.statusCode == 200) {
        final data = response.data['data'] ?? [];
        return (data as List)
            .map((json) => Note.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to search notes: ${response.statusCode}');
      }
    } catch (e) {
      if (e.toString().contains('404') ||
          e.toString().contains('Todo not found')) {
        throw Exception('Todo not found');
      }
      throw Exception('Network error: $e');
    }
  }
}

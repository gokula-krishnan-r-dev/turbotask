part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object?> get props => [];
}

/// Load notes for a todo
class LoadNotes extends NoteEvent {
  final String todoId;

  const LoadNotes(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

/// Create a new note
class CreateNote extends NoteEvent {
  final String todoId;
  final String? title;
  final String content;
  final String? noteType;
  final bool? isPinned;
  final List<String>? tags;

  const CreateNote({
    required this.todoId,
    this.title,
    required this.content,
    this.noteType,
    this.isPinned,
    this.tags,
  });

  @override
  List<Object?> get props => [todoId, title, content, noteType, isPinned, tags];
}

/// Update an existing note
class UpdateNote extends NoteEvent {
  final String noteId;
  final String? title;
  final String? content;
  final String? noteType;
  final bool? isPinned;
  final List<String>? tags;

  const UpdateNote({
    required this.noteId,
    this.title,
    this.content,
    this.noteType,
    this.isPinned,
    this.tags,
  });

  @override
  List<Object?> get props => [noteId, title, content, noteType, isPinned, tags];
}

/// Delete a note
class DeleteNote extends NoteEvent {
  final String noteId;

  const DeleteNote(this.noteId);

  @override
  List<Object?> get props => [noteId];
}

/// Update note content (for real-time editing)
class UpdateNoteContent extends NoteEvent {
  final String noteId;
  final String content;

  const UpdateNoteContent({required this.noteId, required this.content});

  @override
  List<Object?> get props => [noteId, content];
}

/// Auto-save note content
class AutoSaveNote extends NoteEvent {
  final String noteId;
  final String content;

  const AutoSaveNote({required this.noteId, required this.content});

  @override
  List<Object?> get props => [noteId, content];
}

/// Refresh notes
class RefreshNotes extends NoteEvent {
  final String todoId;

  const RefreshNotes(this.todoId);

  @override
  List<Object?> get props => [todoId];
}

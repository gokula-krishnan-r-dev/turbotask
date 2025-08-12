part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class NoteInitial extends NoteState {
  const NoteInitial();
}

/// Loading state
class NoteLoading extends NoteState {
  final List<Note>? previousNotes;
  final String? todoId;

  const NoteLoading({this.previousNotes, this.todoId});

  @override
  List<Object?> get props => [previousNotes, todoId];
}

/// Loaded state with notes
class NoteLoaded extends NoteState {
  final List<Note> notes;
  final String todoId;

  const NoteLoaded({required this.notes, required this.todoId});

  /// Get notes count
  int get notesCount => notes.length;

  /// Get pinned notes
  List<Note> get pinnedNotes => notes.where((note) => note.isPinned).toList();

  /// Get unpinned notes
  List<Note> get unpinnedNotes =>
      notes.where((note) => !note.isPinned).toList();

  /// Check if there are any notes
  bool get hasNotes => notes.isNotEmpty;

  /// Get the primary note (first note or create a default)
  Note? get primaryNote => notes.isNotEmpty ? notes.first : null;

  @override
  List<Object?> get props => [notes, todoId];
}

/// Error state
class NoteError extends NoteState {
  final String message;

  const NoteError(this.message);

  @override
  List<Object?> get props => [message];
}

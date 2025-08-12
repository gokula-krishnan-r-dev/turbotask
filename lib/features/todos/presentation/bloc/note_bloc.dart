import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/note_request_models.dart';
import '../../domain/entities/note.dart';
import '../../domain/usecases/create_note_usecase.dart';
import '../../domain/usecases/delete_note_usecase.dart';
import '../../domain/usecases/get_notes_usecase.dart';
import '../../domain/usecases/update_note_usecase.dart';

part 'note_event.dart';
part 'note_state.dart';

@injectable
class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final GetNotesUseCase _getNotesUseCase;
  final CreateNoteUseCase _createNoteUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;

  Timer? _autoSaveTimer;

  NoteBloc(
    this._getNotesUseCase,
    this._createNoteUseCase,
    this._updateNoteUseCase,
    this._deleteNoteUseCase,
  ) : super(const NoteInitial()) {
    on<LoadNotes>(_onLoadNotes);
    on<CreateNote>(_onCreateNote);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);
    on<AutoSaveNote>(_onAutoSaveNote);
    on<UpdateNoteContent>(_onUpdateNoteContent);
    on<RefreshNotes>(_onRefreshNotes);
  }

  @override
  Future<void> close() {
    _autoSaveTimer?.cancel();
    return super.close();
  }

  Future<void> _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async {
    emit(const NoteLoading());
    try {
      final notes = await _getNotesUseCase(event.todoId);
      emit(NoteLoaded(notes: notes, todoId: event.todoId));
    } catch (e) {
      print('NoteBloc Error: $e');
      emit(NoteError(e.toString()));
    }
  }

  Future<void> _onCreateNote(CreateNote event, Emitter<NoteState> emit) async {
    print('NoteBloc: Creating note for todoId: ${event.todoId}');
    print('NoteBloc: Note title: ${event.title}');
    print('NoteBloc: Note content length: ${event.content.length}');

    // Allow creating notes even if state is not NoteLoaded
    List<Note> previousNotes = [];
    String todoId = event.todoId;

    if (state is NoteLoaded) {
      final currentState = state as NoteLoaded;
      previousNotes = currentState.notes;
      todoId = currentState.todoId;
    }

    emit(NoteLoading(previousNotes: previousNotes, todoId: todoId));

    try {
      final request = CreateNoteRequest(
        todoId: event.todoId,
        title: event.title,
        content: event.content,
        noteType: event.noteType ?? 'general',
        isPinned: event.isPinned ?? false,
        tags: event.tags ?? [],
      );

      print('NoteBloc: Calling createNoteUseCase...');
      final createdNote = await _createNoteUseCase(request);
      print('NoteBloc: Note created successfully: ${createdNote.id}');

      // Refresh notes to get updated list
      final updatedNotes = await _getNotesUseCase(event.todoId);
      print('NoteBloc: Notes refreshed, count: ${updatedNotes.length}');
      emit(NoteLoaded(notes: updatedNotes, todoId: event.todoId));
    } catch (e) {
      print('NoteBloc Error: $e');
      emit(NoteError(e.toString()));

      // Restore previous state on error
      if (previousNotes.isNotEmpty) {
        emit(NoteLoaded(notes: previousNotes, todoId: todoId));
      }
    }
  }

  Future<void> _onUpdateNote(UpdateNote event, Emitter<NoteState> emit) async {
    print('NoteBloc: Updating note: ${event.noteId}');
    print('NoteBloc: Update title: ${event.title}');
    print('NoteBloc: Update content length: ${event.content?.length ?? 0}');

    if (state is! NoteLoaded) {
      print('NoteBloc: Cannot update note - not in NoteLoaded state');
      return;
    }

    final currentState = state as NoteLoaded;

    // Optimistic update
    final updatedNotes = currentState.notes.map((note) {
      if (note.id == event.noteId) {
        return note.copyWith(
          title: event.title ?? note.title,
          content: event.content ?? note.content,
          noteType: event.noteType ?? note.noteType,
          isPinned: event.isPinned ?? note.isPinned,
          tags: event.tags ?? note.tags,
        );
      }
      return note;
    }).toList();

    emit(NoteLoaded(notes: updatedNotes, todoId: currentState.todoId));

    try {
      final request = UpdateNoteRequest(
        title: event.title,
        content: event.content,
        noteType: event.noteType,
        isPinned: event.isPinned,
        tags: event.tags,
      );

      print('NoteBloc: Calling updateNoteUseCase...');
      await _updateNoteUseCase(event.noteId, request);
      print('NoteBloc: Note updated successfully');

      // Refresh to ensure consistency
      final refreshedNotes = await _getNotesUseCase(currentState.todoId);
      print(
        'NoteBloc: Notes refreshed after update, count: ${refreshedNotes.length}',
      );
      emit(NoteLoaded(notes: refreshedNotes, todoId: currentState.todoId));
    } catch (e) {
      print('NoteBloc Error: $e');
      emit(NoteError(e.toString()));

      // Revert UI on error
      emit(NoteLoaded(notes: currentState.notes, todoId: currentState.todoId));
    }
  }

  Future<void> _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    if (state is! NoteLoaded) return;

    final currentState = state as NoteLoaded;

    // Optimistic update
    final updatedNotes = currentState.notes
        .where((note) => note.id != event.noteId)
        .toList();

    emit(NoteLoaded(notes: updatedNotes, todoId: currentState.todoId));

    try {
      await _deleteNoteUseCase(event.noteId);

      // Refresh to ensure consistency
      final refreshedNotes = await _getNotesUseCase(currentState.todoId);
      emit(NoteLoaded(notes: refreshedNotes, todoId: currentState.todoId));
    } catch (e) {
      print('NoteBloc Error: $e');
      emit(NoteError(e.toString()));

      // Revert UI on error
      emit(NoteLoaded(notes: currentState.notes, todoId: currentState.todoId));
    }
  }

  Future<void> _onUpdateNoteContent(
    UpdateNoteContent event,
    Emitter<NoteState> emit,
  ) async {
    // Cancel previous timer
    _autoSaveTimer?.cancel();

    // Start new auto-save timer (2 seconds delay)
    _autoSaveTimer = Timer(const Duration(seconds: 2), () {
      add(AutoSaveNote(noteId: event.noteId, content: event.content));
    });
  }

  Future<void> _onAutoSaveNote(
    AutoSaveNote event,
    Emitter<NoteState> emit,
  ) async {
    // Auto-save without changing UI state
    try {
      final request = UpdateNoteRequest(content: event.content);
      await _updateNoteUseCase(event.noteId, request);
    } catch (e) {
      print('Auto-save failed: $e');
      // Don't emit error for auto-save failures to avoid disrupting user experience
    }
  }

  Future<void> _onRefreshNotes(
    RefreshNotes event,
    Emitter<NoteState> emit,
  ) async {
    if (state is! NoteLoaded) return;

    final currentState = state as NoteLoaded;
    emit(
      NoteLoading(
        previousNotes: currentState.notes,
        todoId: currentState.todoId,
      ),
    );

    try {
      final notes = await _getNotesUseCase(event.todoId);
      emit(NoteLoaded(notes: notes, todoId: event.todoId));
    } catch (e) {
      print('NoteBloc Error: $e');
      emit(NoteError(e.toString()));

      // Restore previous state if refresh fails
      if (currentState.notes.isNotEmpty) {
        emit(
          NoteLoaded(notes: currentState.notes, todoId: currentState.todoId),
        );
      }
    }
  }
}

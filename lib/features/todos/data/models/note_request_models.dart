import 'package:equatable/equatable.dart';

/// Request model for creating a new note
class CreateNoteRequest extends Equatable {
  const CreateNoteRequest({
    required this.todoId,
    this.title,
    required this.content,
    this.noteType = 'general',
    this.isPinned = false,
    this.tags = const [],
  });

  final String todoId;
  final String? title;
  final String content;
  final String noteType;
  final bool isPinned;
  final List<String> tags;

  Map<String, dynamic> toJson() {
    return {
      'todo_id': todoId,
      'title': title,
      'content': content,
      'note_type': noteType,
      'is_pinned': isPinned,
      'tags': tags,
    };
  }

  @override
  List<Object?> get props => [todoId, title, content, noteType, isPinned, tags];
}

/// Request model for updating a note
class UpdateNoteRequest extends Equatable {
  const UpdateNoteRequest({
    this.title,
    this.content,
    this.noteType,
    this.isPinned,
    this.tags,
  });

  final String? title;
  final String? content;
  final String? noteType;
  final bool? isPinned;
  final List<String>? tags;

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (title != null) json['title'] = title;
    if (content != null) json['content'] = content;
    if (noteType != null) json['note_type'] = noteType;
    if (isPinned != null) json['is_pinned'] = isPinned;
    if (tags != null) json['tags'] = tags;

    return json;
  }

  @override
  List<Object?> get props => [title, content, noteType, isPinned, tags];
}

/// Request model for quick note update (content only)
class QuickUpdateNoteRequest extends Equatable {
  const QuickUpdateNoteRequest({required this.content});

  final String content;

  Map<String, dynamic> toJson() {
    return {'content': content};
  }

  @override
  List<Object?> get props => [content];
}

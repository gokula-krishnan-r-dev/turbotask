import 'package:equatable/equatable.dart';

/// Note entity representing a task note
class Note extends Equatable {
  const Note({
    required this.id,
    required this.todoId,
    this.title,
    required this.content,
    this.noteType = 'general',
    this.isPinned = false,
    this.tags = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String todoId;
  final String? title;
  final String content;
  final String noteType;
  final bool isPinned;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Create a copy of note with updated fields
  Note copyWith({
    String? id,
    String? todoId,
    String? title,
    String? content,
    String? noteType,
    bool? isPinned,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Note(
      id: id ?? this.id,
      todoId: todoId ?? this.todoId,
      title: title ?? this.title,
      content: content ?? this.content,
      noteType: noteType ?? this.noteType,
      isPinned: isPinned ?? this.isPinned,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    todoId,
    title,
    content,
    noteType,
    isPinned,
    tags,
    createdAt,
    updatedAt,
  ];

  @override
  String toString() {
    return 'Note(id: $id, todoId: $todoId, title: $title)';
  }

  /// Create Note from JSON
  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] ?? '',
      todoId: json['todo_id'] ?? '',
      title: json['title'],
      content: json['content'] ?? '',
      noteType: json['note_type'] ?? 'general',
      isPinned: json['is_pinned'] ?? false,
      tags: (json['tags'] as List?)?.cast<String>() ?? [],
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }

  /// Convert Note to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todo_id': todoId,
      'title': title,
      'content': content,
      'note_type': noteType,
      'is_pinned': isPinned,
      'tags': tags,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}

import 'dart:convert';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/note.dart';
import '../bloc/note_bloc.dart';

class NoteEditorWidget extends StatefulWidget {
  const NoteEditorWidget({
    super.key,
    required this.todoId,
    this.note,
    this.onClose,
  });

  final String todoId;
  final Note? note;
  final VoidCallback? onClose;

  @override
  State<NoteEditorWidget> createState() => _NoteEditorWidgetState();
}

class _NoteEditorWidgetState extends State<NoteEditorWidget> {
  late EditorState _editorState;
  late TextEditingController _titleController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _initializeEditor();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _initializeEditor() {
    if (widget.note?.content.isNotEmpty == true) {
      try {
        // Try to parse as JSON (AppFlowy Editor format)
        final jsonContent = jsonDecode(widget.note!.content);
        final document = Document.fromJson(jsonContent);
        _editorState = EditorState(document: document);
      } catch (e) {
        // If JSON parsing fails, treat as plain text
        _editorState = EditorState.blank();
        // Convert plain text to editor format
        final transaction = _editorState.transaction;
        transaction.insertText(
          _editorState.document.root.children.first,
          0,
          widget.note!.content,
        );
        _editorState.apply(transaction);
      }
    } else {
      _editorState = EditorState.blank();
    }

    // Listen to content changes for auto-save
    _editorState.transactionStream.listen((_) => _onContentChanged());
    _isInitialized = true;
  }

  void _onContentChanged() {
    if (!_isInitialized) return;

    final content = jsonEncode(_editorState.document.toJson());

    if (widget.note != null) {
      // Update existing note
      context.read<NoteBloc>().add(
        UpdateNoteContent(noteId: widget.note!.id, content: content),
      );
    }
  }

  void _saveNote() {
    final content = jsonEncode(_editorState.document.toJson());
    final title = _titleController.text.trim();

    print('NoteEditor: Saving note...');
    print('NoteEditor: Title: $title');
    print('NoteEditor: Content length: ${content.length}');

    if (content.isEmpty ||
        content == '{"document":{"type":"page","children":[]}}') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add some content to the note'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    if (widget.note != null) {
      // Update existing note
      context.read<NoteBloc>().add(
        UpdateNote(
          noteId: widget.note!.id,
          title: title.isNotEmpty ? title : null,
          content: content,
        ),
      );
    } else {
      // Create new note
      context.read<NoteBloc>().add(
        CreateNote(
          todoId: widget.todoId,
          title: title.isNotEmpty ? title : null,
          content: content,
        ),
      );
    }

    // Show saving feedback
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Saving note...'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<NoteBloc, NoteState>(
      listener: (context, state) {
        if (state is NoteLoaded) {
          // Successfully saved, show message and navigate back
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                widget.note != null ? 'Note updated!' : 'Note created!',
              ),
              backgroundColor: AppColors.success,
              duration: const Duration(seconds: 2),
            ),
          );
          if (widget.onClose != null) {
            widget.onClose!();
          } else {
            Navigator.of(context).pop();
          }
        } else if (state is NoteError) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.message}'),
              backgroundColor: AppColors.error,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(widget.note != null ? 'Edit Note' : 'New Note'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: widget.onClose ?? () => Navigator.of(context).pop(),
          ),
          actions: [
            if (widget.note != null)
              IconButton(
                icon: const Icon(Icons.delete_outline, color: AppColors.error),
                onPressed: () => _showDeleteDialog(),
              ),
            IconButton(
              icon: const Icon(Icons.check, color: AppColors.success),
              onPressed: _saveNote,
            ),
          ],
        ),
        body: Column(
          children: [
            // Title input
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: theme.cardColor,
                border: Border(
                  bottom: BorderSide(
                    color: theme.dividerColor.withOpacity(0.2),
                  ),
                ),
              ),
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Note title (optional)',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            // Editor
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: AppFlowyEditor(
                  editorState: _editorState,
                  shrinkWrap: false,
                  autoFocus: widget.note == null,
                  editorStyle: EditorStyle(
                    padding: EdgeInsets.zero,
                    cursorColor: AppColors.mint,
                    selectionColor: AppColors.mint.withOpacity(0.2),
                    dragHandleColor: AppColors.mint,
                    textSpanDecorator:
                        (context, node, index, text, textSpan, textSpanAfter) =>
                            textSpan,
                    textStyleConfiguration: TextStyleConfiguration(
                      text: theme.textTheme.bodyMedium ?? const TextStyle(),
                      bold:
                          theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ) ??
                          const TextStyle(fontWeight: FontWeight.bold),
                      italic:
                          theme.textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                          ) ??
                          const TextStyle(fontStyle: FontStyle.italic),
                      underline:
                          theme.textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.underline,
                          ) ??
                          const TextStyle(decoration: TextDecoration.underline),
                      strikethrough:
                          theme.textTheme.bodyMedium?.copyWith(
                            decoration: TextDecoration.lineThrough,
                          ) ??
                          const TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                      href: TextStyle(
                        color: AppColors.mint,
                        decoration: TextDecoration.underline,
                      ),
                      code:
                          theme.textTheme.bodyMedium?.copyWith(
                            fontFamily: 'monospace',
                            backgroundColor: AppColors.gray200,
                          ) ??
                          const TextStyle(
                            fontFamily: 'monospace',
                            backgroundColor: AppColors.gray200,
                          ),
                    ),
                  ),
                  blockComponentBuilders: _buildBlockComponents(),
                  characterShortcutEvents: _buildCharacterShortcuts(),
                  commandShortcutEvents: _buildCommandShortcuts(),
                ),
              ),
            ),

            // Status bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: theme.cardColor,
                border: Border(
                  top: BorderSide(color: theme.dividerColor.withOpacity(0.2)),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.auto_awesome, size: 16, color: AppColors.success),
                  const SizedBox(width: 8),
                  Text(
                    'Auto-save enabled',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.success,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  BlocBuilder<NoteBloc, NoteState>(
                    builder: (context, state) {
                      if (state is NoteLoading) {
                        return Row(
                          children: [
                            SizedBox(
                              width: 12,
                              height: 12,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.mint,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text('Saving...', style: theme.textTheme.bodySmall),
                          ],
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, BlockComponentBuilder> _buildBlockComponents() {
    final Map<String, BlockComponentBuilder> builders = {
      ...standardBlockComponentBuilderMap,
    };
    return builders;
  }

  List<CharacterShortcutEvent> _buildCharacterShortcuts() {
    return [...standardCharacterShortcutEvents];
  }

  List<CommandShortcutEvent> _buildCommandShortcuts() {
    return [...standardCommandShortcutEvents];
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (widget.note != null) {
                context.read<NoteBloc>().add(DeleteNote(widget.note!.id));
              }
              Navigator.of(dialogContext).pop();
              if (widget.onClose != null) {
                widget.onClose!();
              } else {
                Navigator.of(context).pop();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

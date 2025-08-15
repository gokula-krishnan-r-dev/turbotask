import 'dart:convert';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbotask/features/todos/presentation/widgets/subtask_list_widget.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../todos/domain/entities/note.dart';
import '../../../todos/domain/entities/todo.dart';
import '../../../todos/presentation/bloc/note_bloc.dart';
import '../../../todos/presentation/bloc/subtask_bloc.dart';
import '../../../todos/presentation/widgets/note_editor_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Task card widget for displaying tasks in the kanban board
class TaskCardWidget extends StatefulWidget {
  const TaskCardWidget({
    super.key,
    required this.task,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final Todo task;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  bool _isSubtasksExpanded = false;
  bool _isSubtasksVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) =>
          getIt<SubtaskBloc>()..add(LoadSubtasks(widget.task.id)),
      child: Card(
        margin: const EdgeInsets.only(bottom: 12),
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with title and actions
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Task title
                    Expanded(
                      child: Text(
                        widget.task.taskName,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    const Spacer(),

                    //add a button with only icon subtask use svg
                    Row(
                      children: [
                        //add a button with only icon subtask use svg
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isSubtasksExpanded = !_isSubtasksExpanded;
                              _isSubtasksVisible = !_isSubtasksVisible;
                            });
                            print('Subtask button pressed');
                          },
                          child: SvgPicture.asset(
                            'assets/icons/subtask.svg',
                            width: 20,
                            height: 20,
                          ),
                        ),

                        const SizedBox(width: 8),

                        //add a button for note
                        GestureDetector(
                          onTap: () => _openNotesList(context),
                          child: Icon(
                            Icons.note_outlined,
                            size: 16,
                            color: AppColors.mint,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                // Description
                if (widget.task.taskDescription != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    widget.task.taskDescription!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withValues(
                        alpha: 0.7,
                      ),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],

                // Tags
                if (widget.task.tags.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: widget.task.tags.take(3).map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mint.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          tag,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.mint,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],

                // // Subtasks
                if (_isSubtasksVisible) ...[
                  const SizedBox(height: 12),
                  SubtaskListWidget(
                    isVisible: _isSubtasksVisible,
                    todoId: widget.task.id,
                    isExpanded: _isSubtasksExpanded,
                    onExpandToggle: () {
                      setState(() {
                        _isSubtasksExpanded = !_isSubtasksExpanded;
                      });
                    },
                  ),
                ],

                // Footer with assignee and due date
                const SizedBox(height: 12),
                Row(
                  children: [
                    Text(
                      "+EST",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodySmall?.color?.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "0m",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodySmall?.color?.withValues(
                          alpha: 0.7,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ); // Close BlocProvider
  }

  void _openNotesList(BuildContext context) {
    print('TaskCardWidget: Opening notes for task ID: ${widget.task.id}');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) => BlocProvider(
        create: (context) => getIt<NoteBloc>()..add(LoadNotes(widget.task.id)),
        child: DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: _NoteModalContent(todoId: widget.task.id),
          ),
        ),
      ),
    );
  }
}

/// Internal widget for note modal content
class _NoteModalContent extends StatelessWidget {
  const _NoteModalContent({required this.todoId});

  final String todoId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<NoteBloc, NoteState>(
      builder: (context, state) {
        if (state is NoteLoading && state.previousNotes == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final notes = _getNotes(state);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.note_outlined, color: AppColors.mint, size: 24),
                  const SizedBox(width: 12),
                  Text(
                    'Notes',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => _openNoteEditor(context, null),
                    icon: Icon(Icons.add, color: AppColors.mint),
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.mint.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),

            // Notes list
            if (notes.isEmpty)
              _buildEmptyState(context, theme)
            else
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: notes.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final note = notes[index];
                    return _NoteCard(
                      note: note,
                      onTap: () => _openNoteEditor(context, note),
                      onDelete: () => _deleteNote(context, note),
                    );
                  },
                ),
              ),

            // Error handling
            if (state is NoteError)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.error.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          state.message,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<NoteBloc>().add(RefreshNotes(todoId));
                        },
                        icon: Icon(
                          Icons.refresh,
                          color: AppColors.error,
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context, ThemeData theme) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.note_add_outlined,
                size: 64,
                color: theme.iconTheme.color?.withOpacity(0.3),
              ),
              const SizedBox(height: 16),
              Text(
                'No notes yet',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Add your first note to capture important details about this task',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => _openNoteEditor(context, null),
                icon: const Icon(Icons.add),
                label: const Text('Add Note'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mint,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Note> _getNotes(NoteState state) {
    if (state is NoteLoaded) {
      return state.notes;
    } else if (state is NoteLoading && state.previousNotes != null) {
      return state.previousNotes!;
    }
    return [];
  }

  void _openNoteEditor(BuildContext context, Note? note) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: context.read<NoteBloc>(),
          child: NoteEditorWidget(todoId: todoId, note: note),
        ),
      ),
    );
  }

  void _deleteNote(BuildContext context, Note note) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete Note'),
        content: Text(
          'Are you sure you want to delete "${note.title ?? 'Untitled'}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<NoteBloc>().add(DeleteNote(note.id));
              Navigator.of(dialogContext).pop();
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

/// Note card widget
class _NoteCard extends StatelessWidget {
  const _NoteCard({
    required this.note,
    required this.onTap,
    required this.onDelete,
  });

  final Note note;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final preview = _getContentPreview();

    return Card(
      elevation: 1,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.dividerColor.withOpacity(0.2)),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  if (note.isPinned) ...[
                    Icon(Icons.push_pin, size: 16, color: AppColors.warning),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Text(
                      note.title ?? 'Untitled',
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      switch (value) {
                        case 'delete':
                          onDelete();
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 16,
                              color: AppColors.error,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Delete',
                              style: TextStyle(color: AppColors.error),
                            ),
                          ],
                        ),
                      ),
                    ],
                    child: Icon(
                      Icons.more_vert,
                      size: 16,
                      color: theme.iconTheme.color?.withOpacity(0.6),
                    ),
                  ),
                ],
              ),

              // Content preview
              if (preview.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  preview,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],

              // Footer
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 12,
                    color: theme.iconTheme.color?.withOpacity(0.5),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(note.updatedAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodyMedium?.color?.withOpacity(
                        0.5,
                      ),
                    ),
                  ),
                  if (note.tags.isNotEmpty) ...[
                    const SizedBox(width: 12),
                    Icon(
                      Icons.label_outline,
                      size: 12,
                      color: theme.iconTheme.color?.withOpacity(0.5),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      note.tags.take(2).join(', '),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodyMedium?.color?.withOpacity(
                          0.5,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getContentPreview() {
    try {
      // Try to parse as AppFlowy Editor JSON
      final jsonContent = jsonDecode(note.content);
      if (jsonContent is Map<String, dynamic>) {
        // Extract text from AppFlowy Editor document
        final document = Document.fromJson(jsonContent);
        final buffer = StringBuffer();

        for (final node in document.root.children) {
          if (node.type == 'paragraph') {
            final delta = node.delta;
            if (delta != null) {
              buffer.write(delta.toPlainText());
              buffer.write(' ');
            }
          }
        }

        return buffer.toString().trim();
      }
    } catch (e) {
      // If parsing fails, return as plain text
      return note.content;
    }

    return note.content;
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes}m ago';
      }
      return '${difference.inHours}h ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

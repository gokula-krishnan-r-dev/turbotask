import 'dart:convert';
import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbotask/core/constants/api_constants.dart';
import 'package:turbotask/features/todos/presentation/widgets/subtask_list_widget.dart';
import 'package:http/http.dart' as http;

import '../../../../core/auth/auth_manager.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../todos/data/datasources/todo_actions_remote_datasource.dart';
import '../../../todos/data/models/todo_action_request_models.dart';
import '../../../todos/domain/entities/todo.dart';
import '../../../todos/presentation/bloc/subtask_bloc.dart';

/// Task detail sidebar for comprehensive task management
class TaskDetailSidebar extends StatefulWidget {
  const TaskDetailSidebar({
    super.key,
    required this.task,
    required this.onClose,
    this.onRefresh,
  });

  final Todo task;
  final VoidCallback onClose;
  final VoidCallback? onRefresh;

  @override
  State<TaskDetailSidebar> createState() => _TaskDetailSidebarState();
}

class _TaskDetailSidebarState extends State<TaskDetailSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late EditorState _editorState;
  late final TodoActionsRemoteDataSource _todoActionsDataSource;
  late final AuthManager _authManager;

  bool _isGeneratingDescription = false;
  bool _isUpdatingDescription = false;
  String _currentDescription = '';
  String _currentTaskId = '';
  SubtaskBloc? _subtaskBloc;

  @override
  void initState() {
    super.initState();
    _todoActionsDataSource = getIt<TodoActionsRemoteDataSource>();
    _authManager = getIt<AuthManager>();

    // Initialize animation
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    // Initialize task-specific content
    _initializeTaskContent();

    // Start slide-in animation
    _animationController.forward();
  }

  @override
  void didUpdateWidget(TaskDetailSidebar oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the task has changed
    if (oldWidget.task.id != widget.task.id) {
      _initializeTaskContent();
    }
  }

  void _initializeTaskContent() {
    _currentTaskId = widget.task.id;
    _currentDescription = widget.task.taskDescription ?? '';

    // Initialize rich text editor
    _initializeEditor();

    // Initialize or update subtask bloc
    _initializeSubtaskBloc();
  }

  void _initializeSubtaskBloc() {
    // Dispose previous bloc if exists
    _subtaskBloc?.close();

    // Create new bloc for current task
    _subtaskBloc = getIt<SubtaskBloc>()..add(LoadSubtasks(_currentTaskId));
  }

  /// Refreshes the task content when the task changes
  void _refreshTaskContent() {
    if (mounted) {
      try {
        setState(() {
          _initializeTaskContent();
        });

        // Debug logging (remove in production)
        debugPrint(
          'TaskDetailSidebar: Refreshed content for task ${widget.task.id}',
        );
      } catch (e) {
        debugPrint('TaskDetailSidebar: Error refreshing content: $e');
      }
    }
  }

  /// Checks if the current task data is stale and needs refreshing
  bool _isTaskDataStale() {
    return _currentTaskId != widget.task.id ||
        _currentDescription != (widget.task.taskDescription ?? '');
  }

  void _initializeEditor() {
    Document document;

    if (_currentDescription.isNotEmpty) {
      try {
        // Try to parse as JSON (AppFlowy format)
        final jsonDoc = jsonDecode(_currentDescription);
        document = Document.fromJson(jsonDoc);
      } catch (e) {
        // If not JSON, treat as plain text
        document = Document.blank()
          ..insert([0], [paragraphNode(text: _currentDescription)]);
      }
    } else {
      document = Document.blank()
        ..insert([0], [paragraphNode(text: 'Add a description...')]);
    }

    _editorState = EditorState(document: document);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _subtaskBloc?.close();
    super.dispose();
  }

  Future<void> _generateAIDescription() async {
    setState(() {
      _isGeneratingDescription = true;
    });

    try {
      // Get JWT token from auth manager
      final accessToken = _authManager.currentTokens?.accessToken;
      if (accessToken == null) {
        throw Exception('User not authenticated');
      }

      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}/api/v1/ai/improve-description'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode({
          'task_name': widget.task.taskName,
          'current_description': _currentDescription,
          'priority': widget.task.priority.value,
          'tags': widget.task.tags,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final enhancedDescription = data['enhanced_description'] ?? '';

        // Update editor with new description
        final document = Document.blank()
          ..insert([0], [paragraphNode(text: enhancedDescription)]);

        setState(() {
          _editorState = EditorState(document: document);
          _currentDescription = enhancedDescription;
        });

        // Auto-save the enhanced description
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _saveDescription();
        });

        // Show success message
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.auto_awesome, color: AppColors.mint, size: 16),
                  const SizedBox(width: 8),
                  const Text('AI description generated successfully'),
                ],
              ),
              backgroundColor: AppColors.mint.withOpacity(0.8),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to generate AI description: $e'),
            backgroundColor: Colors.red.shade600,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      setState(() {
        _isGeneratingDescription = false;
      });
    }
  }

  Future<void> _saveDescription() async {
    setState(() {
      _isUpdatingDescription = true;
    });

    try {
      // Convert editor content to JSON
      final document = _editorState.document;
      final jsonContent = jsonEncode(document.toJson());

      final request = UpdateTodoRequest(taskDescription: jsonContent);
      await _todoActionsDataSource.updateTodo(_currentTaskId, request);

      setState(() {
        _currentDescription = jsonContent;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: AppColors.mint, size: 16),
                const SizedBox(width: 8),
                const Text('Description updated successfully'),
              ],
            ),
            backgroundColor: Colors.green.shade600,
            behavior: SnackBarBehavior.floating,
          ),
        );

        // Trigger refresh
        if (widget.onRefresh != null) {
          widget.onRefresh!();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update description: $e'),
            backgroundColor: Colors.red.shade600,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      setState(() {
        _isUpdatingDescription = false;
      });
    }
  }

  Future<void> _closeSidebar() async {
    await _animationController.reverse();
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Check if we need to refresh task data
    if (_isTaskDataStale()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _refreshTaskContent();
      });
    }

    return AnimatedBuilder(
      animation: _slideAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_slideAnimation.value * 400, 0),
          child: Container(
            width: 400,
            height: double.infinity,
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(-2, 0),
                ),
              ],
              border: Border(
                left: BorderSide(
                  color: theme.dividerColor.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              children: [
                // Header
                _buildHeader(theme),

                // Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Task Overview
                        _buildTaskOverview(theme),

                        const SizedBox(height: 24),

                        // Task Details
                        _buildTaskDetails(theme),

                        const SizedBox(height: 24),

                        // Description Editor
                        _buildDescriptionEditor(theme),

                        const SizedBox(height: 24),

                        // Subtasks Section
                        _buildSubtasksSection(theme),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Task emoji
          if (widget.task.taskEmoji != null &&
              widget.task.taskEmoji!.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.mint.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.task.taskEmoji!,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(width: 12),
          ],

          // Task title and AI indicator
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.task.taskName,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (widget.task.aiEnhanced) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.auto_awesome, size: 14, color: AppColors.mint),
                      const SizedBox(width: 4),
                      Text(
                        'AI Enhanced',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: AppColors.mint,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // Close button
          IconButton(
            onPressed: _closeSidebar,
            icon: const Icon(Icons.close),
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
              foregroundColor: theme.iconTheme.color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskOverview(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Overview',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // Status
          _buildDetailRow(
            theme,
            'Status',
            widget.task.status.displayName,
            _getStatusColor(widget.task.status),
          ),

          // Priority
          _buildDetailRow(
            theme,
            'Priority',
            widget.task.priority.displayName,
            _getPriorityColor(widget.task.priority),
          ),

          // Created date
          _buildDetailRow(
            theme,
            'Created',
            _formatDate(widget.task.createdAt),
            theme.textTheme.bodyMedium?.color,
          ),

          // Due date
          if (widget.task.dueDate != null)
            _buildDetailRow(
              theme,
              'Due Date',
              _formatDate(widget.task.dueDate!),
              widget.task.isOverdue
                  ? AppColors.error
                  : theme.textTheme.bodyMedium?.color,
            ),
        ],
      ),
    );
  }

  Widget _buildTaskDetails(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Details',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // Tags
          if (widget.task.tags.isNotEmpty) ...[
            Text(
              'Tags',
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.task.tags.map((tag) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.mint.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.mint.withOpacity(0.3)),
                  ),
                  child: Text(
                    tag,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: AppColors.mint,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],

          // Estimated time
          if (widget.task.estimatedTime != null)
            _buildDetailRow(
              theme,
              'Estimated Time',
              '${widget.task.estimatedTime} minutes',
              theme.textTheme.bodyMedium?.color,
            ),

          // AI Category
          if (widget.task.aiCategory != null)
            _buildDetailRow(
              theme,
              'AI Category',
              widget.task.aiCategory!,
              AppColors.mint,
            ),
        ],
      ),
    );
  }

  Widget _buildDescriptionEditor(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with AI button
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Description',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // Show update indicator if task data is being refreshed
                if (_isTaskDataStale()) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.orange.withOpacity(0.3)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.orange,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Updating...',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const Spacer(),

                // AI Generate button
                ElevatedButton.icon(
                  onPressed: _isGeneratingDescription
                      ? null
                      : _generateAIDescription,
                  icon: _isGeneratingDescription
                      ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Icon(Icons.auto_awesome, size: 16),
                  label: Text(
                    _isGeneratingDescription ? 'Generating...' : 'AI Enhance',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mint,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    textStyle: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Save button
                ElevatedButton.icon(
                  onPressed: _isUpdatingDescription ? null : _saveDescription,
                  icon: _isUpdatingDescription
                      ? SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Icon(Icons.save, size: 16),
                  label: Text(_isUpdatingDescription ? 'Saving...' : 'Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    textStyle: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Rich text editor
          Container(
            height: 200,
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.dividerColor.withOpacity(0.3)),
            ),
            child: AppFlowyEditor(
              key: ValueKey('editor_$_currentTaskId'),
              editorState: _editorState,
              editorStyle: EditorStyle.mobile(
                textStyleConfiguration: TextStyleConfiguration(
                  text: theme.textTheme.bodyMedium!,
                ),
                selectionColor: AppColors.mint.withOpacity(0.3),
                cursorColor: AppColors.mint,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubtasksSection(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Subtasks',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Subtasks list
          if (_subtaskBloc != null)
            BlocProvider.value(
              key: ValueKey('subtasks_$_currentTaskId'),
              value: _subtaskBloc!,
              child: SubtaskListWidget(
                isVisible: true,
                todoId: _currentTaskId,
                isExpanded: true,
                maxVisibleSubtasks: 10,
                onExpandToggle: () {}, // Always expanded in sidebar
              ),
            )
          else
            // Loading placeholder while subtask bloc is being initialized
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.mint,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Loading subtasks...',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodyMedium?.color?.withOpacity(
                        0.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    ThemeData theme,
    String label,
    String value,
    Color? valueColor,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: valueColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return Colors.grey.shade600;
      case TaskStatus.inProgress:
        return Colors.blue.shade600;
      case TaskStatus.completed:
        return Colors.green.shade600;
      case TaskStatus.done:
        return Colors.green.shade700;
      case TaskStatus.cancelled:
        return Colors.red.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  Color _getPriorityColor(Priority priority) {
    switch (priority) {
      case Priority.low:
        return Colors.green.shade600;
      case Priority.medium:
        return Colors.orange.shade600;
      case Priority.high:
        return Colors.red.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Today';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

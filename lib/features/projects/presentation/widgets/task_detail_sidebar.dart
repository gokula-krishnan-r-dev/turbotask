import 'dart:convert';

import 'package:appflowy_editor/appflowy_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/inline_edit_text.dart';
import '../../../todos/data/datasources/todo_actions_remote_datasource.dart';
import '../../../todos/data/models/todo_action_request_models.dart';
import '../../../todos/domain/entities/todo.dart';
import '../../../todos/presentation/bloc/subtask_bloc.dart';
import '../../../todos/presentation/widgets/subtask_list_widget.dart';

/// Task detail sidebar widget that displays comprehensive task information
class TaskDetailSidebar extends StatefulWidget {
  const TaskDetailSidebar({
    super.key,
    required this.task,
    required this.onClose,
    this.onTaskUpdated,
  });

  final Todo task;
  final VoidCallback onClose;
  final VoidCallback? onTaskUpdated;

  @override
  State<TaskDetailSidebar> createState() => _TaskDetailSidebarState();
}

class _TaskDetailSidebarState extends State<TaskDetailSidebar>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  
  late EditorState _editorState;
  late final TodoActionsRemoteDataSource _todoActionsDataSource;
  
  bool _isUpdatingDescription = false;
  bool _isGeneratingAI = false;
  String _currentDescription = '';

  @override
  void initState() {
    super.initState();
    _todoActionsDataSource = getIt<TodoActionsRemoteDataSource>();
    _currentDescription = widget.task.taskDescription ?? '';
    
    // Initialize slide animation
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    // Initialize rich text editor
    _initializeEditor();
    
    // Start slide animation
    _slideController.forward();
  }

  void _initializeEditor() {
    try {
      if (_currentDescription.isNotEmpty) {
        // Try to parse as JSON (AppFlowy format)
        final jsonContent = jsonDecode(_currentDescription);
        _editorState = EditorState(document: Document.fromJson(jsonContent));
      } else {
        // Create empty document
        _editorState = EditorState.blank();
      }
    } catch (e) {
      // If not JSON, treat as plain text
      final document = Document.blank();
      if (_currentDescription.isNotEmpty) {
        final transaction = document.transaction;
        transaction.insertText(
          document.root.children.first,
          0,
          _currentDescription,
        );
        transaction.commit();
      }
      _editorState = EditorState(document: document);
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _editorState.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    await _slideController.reverse();
    widget.onClose();
  }

  Future<void> _saveDescription() async {
    if (_isUpdatingDescription) return;

    setState(() {
      _isUpdatingDescription = true;
    });

    try {
      // Convert editor state to JSON
      final document = _editorState.document;
      final jsonContent = jsonEncode(document.toJson());

      final request = UpdateTodoRequest(taskDescription: jsonContent);
      await _todoActionsDataSource.updateTodo(widget.task.id, request);

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
            duration: const Duration(milliseconds: 1500),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green.shade600,
          ),
        );

        // Trigger refresh
        if (widget.onTaskUpdated != null) {
          widget.onTaskUpdated!();
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Text('Failed to update description: ${e.toString()}'),
              ],
            ),
            duration: const Duration(milliseconds: 3000),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red.shade600,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUpdatingDescription = false;
        });
      }
    }
  }

  Future<void> _generateAIDescription() async {
    if (_isGeneratingAI) return;

    setState(() {
      _isGeneratingAI = true;
    });

    try {
      // Simulate AI generation for now
      // TODO: Integrate with actual AI service
      await Future.delayed(const Duration(seconds: 2));

      final aiDescription = _generateSampleAIDescription();
      
      // Create new document with AI content
      final document = Document.blank();
      final transaction = document.transaction;
      transaction.insertText(document.root.children.first, 0, aiDescription);
      transaction.commit();
      
      setState(() {
        _editorState = EditorState(document: document);
      });

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
            duration: const Duration(milliseconds: 2000),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.purple.shade600,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.white, size: 16),
                const SizedBox(width: 8),
                Text('Failed to generate AI description: ${e.toString()}'),
              ],
            ),
            duration: const Duration(milliseconds: 3000),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red.shade600,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isGeneratingAI = false;
        });
      }
    }
  }

  String _generateSampleAIDescription() {
    final taskName = widget.task.taskName.toLowerCase();
    
    if (taskName.contains('api') || taskName.contains('backend')) {
      return '''This task involves developing a robust API solution that will serve as the backbone for data communication. 

Key objectives include:
• Designing RESTful endpoints with proper HTTP methods
• Implementing authentication and authorization mechanisms
• Ensuring data validation and error handling
• Creating comprehensive API documentation
• Setting up proper testing frameworks

The implementation should follow industry best practices for scalability, security, and maintainability. Consider using modern frameworks and ensuring the API can handle concurrent requests efficiently.''';
    } else if (taskName.contains('ui') || taskName.contains('design') || taskName.contains('frontend')) {
      return '''This task focuses on creating an intuitive and visually appealing user interface that enhances user experience.

Key deliverables include:
• Responsive design that works across different screen sizes
• Consistent visual hierarchy and typography
• Accessible components following WCAG guidelines
• Smooth animations and transitions
• Cross-browser compatibility testing

The design should align with modern UI/UX principles while maintaining the brand identity and ensuring optimal user engagement.''';
    } else {
      return '''This task represents an important milestone in the project development cycle. 

Scope of work includes:
• Clear definition of requirements and acceptance criteria
• Implementation of core functionality
• Quality assurance and testing procedures
• Documentation and knowledge transfer
• Stakeholder review and feedback incorporation

The execution should follow established project methodologies while maintaining high standards for code quality and user experience.''';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.black.withOpacity(0.3),
      child: GestureDetector(
        onTap: _close,
        child: Row(
          children: [
            // Backdrop
            const Expanded(child: SizedBox()),
            
            // Sidebar
            SlideTransition(
              position: _slideAnimation,
              child: GestureDetector(
                onTap: () {}, // Prevent backdrop tap
                child: Container(
                  width: 480,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(-5, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildHeader(theme),
                      Expanded(
                        child: _buildContent(theme),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.dividerColor.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        children: [
          // Task emoji
          if (widget.task.taskEmoji != null && widget.task.taskEmoji!.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.mint.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                widget.task.taskEmoji!,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(width: 16),
          ],
          
          // Title and AI indicator
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Task Details',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
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
            onPressed: _close,
            icon: const Icon(Icons.close),
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(ThemeData theme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTaskOverview(theme),
          const SizedBox(height: 24),
          _buildTaskProperties(theme),
          const SizedBox(height: 24),
          _buildDescriptionSection(theme),
          const SizedBox(height: 24),
          _buildSubtasksSection(theme),
        ],
      ),
    );
  }

  Widget _buildTaskOverview(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.dividerColor.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.task.taskName,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          
          // Status, Priority, Assignee row
          Row(
            children: [
              _buildPropertyChip(
                theme,
                'Status',
                'Not started',
                Icons.radio_button_unchecked,
                Colors.grey,
              ),
              const SizedBox(width: 12),
              _buildPropertyChip(
                theme,
                'Priority',
                widget.task.priority?.displayName ?? 'Medium',
                Icons.flag,
                _getPriorityColor(widget.task.priority),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          Row(
            children: [
              _buildPropertyChip(
                theme,
                'Assignee',
                'Empty',
                Icons.person_outline,
                Colors.grey,
              ),
              const SizedBox(width: 12),
              _buildPropertyChip(
                theme,
                'Due date',
                'Empty',
                Icons.calendar_today,
                Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyChip(
    ThemeData theme,
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskProperties(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Properties',
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        
        // Tags
        if (widget.task.tags.isNotEmpty) ...[
          _buildPropertyRow(theme, 'Tags', widget.task.tags.join(', ')),
          const SizedBox(height: 8),
        ],
        
        // Creation date
        _buildPropertyRow(
          theme,
          'Created',
          _formatDate(widget.task.createdAt),
        ),
        const SizedBox(height: 8),
        
        // Last updated
        _buildPropertyRow(
          theme,
          'Updated',
          _formatDate(widget.task.updatedAt),
        ),
      ],
    );
  }

  Widget _buildPropertyRow(ThemeData theme, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: theme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Task Description',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            
            // AI Generate button
            TextButton.icon(
              onPressed: _isGeneratingAI ? null : _generateAIDescription,
              icon: _isGeneratingAI
                  ? SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(AppColors.mint),
                      ),
                    )
                  : Icon(Icons.auto_awesome, size: 16, color: AppColors.mint),
              label: Text(
                _isGeneratingAI ? 'Generating...' : 'Ask AI',
                style: TextStyle(color: AppColors.mint),
              ),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.mint.withOpacity(0.1),
              ),
            ),
            
            const SizedBox(width: 8),
            
            // Save button
            ElevatedButton.icon(
              onPressed: _isUpdatingDescription ? null : _saveDescription,
              icon: _isUpdatingDescription
                  ? const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Icon(Icons.save, size: 16),
              label: Text(_isUpdatingDescription ? 'Saving...' : 'Save'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mint,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 12),
        
        // Rich text editor
        Container(
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(color: theme.dividerColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: AppFlowyEditor(
            editorState: _editorState,
            editorStyle: EditorStyle.desktop(
              padding: const EdgeInsets.all(16),
              textStyleConfiguration: TextStyleConfiguration(
                text: theme.textTheme.bodyMedium!,
                bold: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
                italic: theme.textTheme.bodyMedium!.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubtasksSection(ThemeData theme) {
    return BlocProvider(
      create: (context) => getIt<SubtaskBloc>()..add(LoadSubtasks(widget.task.id)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subtasks',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          
          SubtaskListWidget(
            isVisible: true,
            todoId: widget.task.id,
            isExpanded: true,
            onExpandToggle: () {},
          ),
        ],
      ),
    );
  }

  Color _getPriorityColor(Priority? priority) {
    switch (priority) {
      case Priority.low:
        return Colors.green;
      case Priority.medium:
        return Colors.orange;
      case Priority.high:
        return Colors.red;
      case Priority.urgent:
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        return '${difference.inMinutes} minutes ago';
      }
      return '${difference.inHours} hours ago';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}


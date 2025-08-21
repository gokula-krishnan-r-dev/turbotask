import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/ai_task_models.dart';
import '../bloc/ai_task_bloc.dart';

class AITaskCreationWidget extends StatefulWidget {
  const AITaskCreationWidget({
    super.key,
    required this.projectId,
    this.onTaskCreated,
    this.onClose,
  });

  final String projectId;
  final Function(OptimizedAITaskResponse)? onTaskCreated;
  final VoidCallback? onClose;

  @override
  State<AITaskCreationWidget> createState() => _AITaskCreationWidgetState();
}

class _AITaskCreationWidgetState extends State<AITaskCreationWidget> {
  final _formKey = GlobalKey<FormState>();
  final _taskNameController = TextEditingController();
  final _taskDescriptionController = TextEditingController();
  final _projectContextController = TextEditingController();

  bool _isCreating = false;
  Timer? _creationTimer;

  @override
  void dispose() {
    _taskNameController.dispose();
    _taskDescriptionController.dispose();
    _projectContextController.dispose();
    _creationTimer?.cancel();
    super.dispose();
  }

  void _createAITask() {
    if (!_formKey.currentState!.validate()) return;

    final request = CreateOptimizedAITaskRequest(
      projectId: widget.projectId,
      taskName: _taskNameController.text.trim(),
      taskDescription: _taskDescriptionController.text.trim().isEmpty
          ? null
          : _taskDescriptionController.text.trim(),
      projectContext: _projectContextController.text.trim().isEmpty
          ? null
          : _projectContextController.text.trim(),
    );

    context.read<AITaskBloc>().add(CreateOptimizedAITask(request));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => getIt<AITaskBloc>(),
      child: Container(
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: BlocConsumer<AITaskBloc, AITaskState>(
          listener: (context, state) {
            if (state is AITaskCreated) {
              _isCreating = false;
              widget.onTaskCreated?.call(state.response);

              // Show success message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      Icon(Icons.check_circle, color: AppColors.mint, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Task created successfully!',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'AI enhancement is processing in the background',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: AppColors.mint,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );

              // Auto-close after showing success
              Future.delayed(const Duration(milliseconds: 1500), () {
                if (mounted) {
                  widget.onClose?.call();
                }
              });
            } else if (state is AITaskError) {
              _isCreating = false;

              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.white, size: 16),
                      const SizedBox(width: 8),
                      Expanded(child: Text(state.message)),
                    ],
                  ),
                  backgroundColor: AppColors.error,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            } else if (state is AITaskCreating) {
              _isCreating = true;
            }

            setState(() {});
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.mint.withOpacity(0.15),
                              AppColors.teal.withOpacity(0.1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.auto_awesome,
                          color: AppColors.mint,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create AI-Enhanced Task',
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'AI will enhance your task with smart suggestions',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.7,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (!_isCreating)
                        IconButton(
                          onPressed: widget.onClose,
                          icon: const Icon(Icons.close),
                          style: IconButton.styleFrom(
                            backgroundColor: theme.dividerColor.withOpacity(
                              0.1,
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // Task name field
                  TextFormField(
                    controller: _taskNameController,
                    enabled: !_isCreating,
                    decoration: InputDecoration(
                      labelText: 'Task Name *',
                      hintText: 'Enter your task name...',
                      prefixIcon: Icon(Icons.task_alt, color: AppColors.mint),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: theme.dividerColor.withOpacity(0.3),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.mint),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter a task name';
                      }
                      if (value.trim().length > 255) {
                        return 'Task name is too long (max 255 characters)';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.next,
                  ),

                  const SizedBox(height: 16),

                  // Task description field
                  TextFormField(
                    controller: _taskDescriptionController,
                    enabled: !_isCreating,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Description (Optional)',
                      hintText: 'Describe your task... AI will enhance this!',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Icon(Icons.description, color: AppColors.mint),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: theme.dividerColor.withOpacity(0.3),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.mint),
                      ),
                    ),
                    textInputAction: TextInputAction.next,
                  ),

                  const SizedBox(height: 16),

                  // Project context field
                  TextFormField(
                    controller: _projectContextController,
                    enabled: !_isCreating,
                    maxLines: 2,
                    decoration: InputDecoration(
                      labelText: 'Project Context (Optional)',
                      hintText: 'Provide context about your project...',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Icon(Icons.info_outline, color: AppColors.mint),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: theme.dividerColor.withOpacity(0.3),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: AppColors.mint),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _createAITask(),
                  ),

                  const SizedBox(height: 24),

                  // AI Features info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.mint.withOpacity(0.05),
                          AppColors.teal.withOpacity(0.02),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.mint.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.psychology,
                              color: AppColors.mint,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'AI will enhance your task with:',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.mint,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ...[
                          '• Smart description improvements',
                          '• Relevant emoji and categorization',
                          '• Intelligent subtask suggestions',
                          '• Time estimates and priority levels',
                        ].map(
                          (feature) => Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: Text(
                              feature,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.7,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Action buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _isCreating ? null : widget.onClose,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: _isCreating ? null : _createAITask,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.mint,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: _isCreating
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text('Creating...'),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.auto_awesome, size: 18),
                                    const SizedBox(width: 8),
                                    const Text('Create AI Task'),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

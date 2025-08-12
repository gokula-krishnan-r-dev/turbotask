import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// Widget for creating new tasks with a beautiful, inline interface
class CreateTaskWidget extends StatefulWidget {
  final Function(String taskName, String? description) onCreateTask;
  final VoidCallback onCancel;

  const CreateTaskWidget({
    super.key,
    required this.onCreateTask,
    required this.onCancel,
  });

  @override
  State<CreateTaskWidget> createState() => _CreateTaskWidgetState();
}

class _CreateTaskWidgetState extends State<CreateTaskWidget>
    with TickerProviderStateMixin {
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FocusNode _taskNameFocus = FocusNode();
  final FocusNode _descriptionFocus = FocusNode();

  bool _showDescription = false;
  bool _isCreating = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();

    // Auto-focus on task name field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _taskNameFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _taskNameController.dispose();
    _descriptionController.dispose();
    _taskNameFocus.dispose();
    _descriptionFocus.dispose();
    super.dispose();
  }

  Future<void> _handleCreateTask() async {
    final taskName = _taskNameController.text.trim();
    if (taskName.isEmpty) return;

    setState(() {
      _isCreating = true;
    });

    try {
      await widget.onCreateTask(
        taskName,
        _descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim(),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isCreating = false;
        });
      }
    }
  }

  void _handleCancel() {
    _animationController.reverse().then((_) {
      widget.onCancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? [
                          theme.colorScheme.surface.withOpacity(0.9),
                          theme.colorScheme.surface.withOpacity(0.7),
                        ]
                      : [
                          Colors.white.withOpacity(0.9),
                          const Color(0xFFF8F9FA).withOpacity(0.9),
                        ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: theme.colorScheme.primary.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.add_task,
                          color: theme.colorScheme.primary,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: AutoSizeText(
                          'Create New Task',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      IconButton(
                        onPressed: _handleCancel,
                        icon: Icon(
                          Icons.close,
                          color: theme.colorScheme.onSurface.withOpacity(0.6),
                          size: 20,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 32,
                          minHeight: 32,
                        ),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Task Name Field
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: theme.colorScheme.outline.withOpacity(0.2),
                      ),
                    ),
                    child: TextField(
                      controller: _taskNameController,
                      focusNode: _taskNameFocus,
                      decoration: InputDecoration(
                        hintText: 'What needs to be done today?',
                        hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.5),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(16),
                        prefixIcon: Icon(
                          Icons.edit_outlined,
                          color: theme.colorScheme.primary,
                          size: 20,
                        ),
                      ),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      textCapitalization: TextCapitalization.sentences,
                      onSubmitted: (_) {
                        if (!_showDescription) {
                          _handleCreateTask();
                        } else {
                          _descriptionFocus.requestFocus();
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Description Toggle Button
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            _showDescription = !_showDescription;
                          });
                          if (_showDescription) {
                            Future.delayed(
                              const Duration(milliseconds: 100),
                              () {
                                _descriptionFocus.requestFocus();
                              },
                            );
                          }
                        },
                        icon: Icon(
                          _showDescription
                              ? Icons.keyboard_arrow_up
                              : Icons.add_circle_outline,
                          size: 16,
                        ),
                        label: Text(
                          _showDescription
                              ? 'Hide Description'
                              : 'Add Description',
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          minimumSize: Size.zero,
                        ),
                      ),
                      const Spacer(),
                      // Due date indicator
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.today,
                              size: 14,
                              color: theme.colorScheme.onPrimaryContainer,
                            ),
                            const SizedBox(width: 4),
                            AutoSizeText(
                              'Due Today',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Animated Description Field
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    height: _showDescription ? null : 0,
                    child: _showDescription
                        ? Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Container(
                              decoration: BoxDecoration(
                                color: theme.colorScheme.surfaceVariant
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: theme.colorScheme.outline.withOpacity(
                                    0.2,
                                  ),
                                ),
                              ),
                              child: TextField(
                                controller: _descriptionController,
                                focusNode: _descriptionFocus,
                                decoration: InputDecoration(
                                  hintText: 'Add more details...',
                                  hintStyle: theme.textTheme.bodySmall
                                      ?.copyWith(
                                        color: theme.colorScheme.onSurface
                                            .withOpacity(0.5),
                                      ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(12),
                                ),
                                style: theme.textTheme.bodySmall,
                                maxLines: 3,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                onSubmitted: (_) => _handleCreateTask(),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),

                  const SizedBox(height: 16),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _isCreating ? null : _handleCancel,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: BorderSide(
                              color: theme.colorScheme.outline.withOpacity(0.5),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: _isCreating ? null : _handleCreateTask,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colorScheme.primary,
                            foregroundColor: theme.colorScheme.onPrimary,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 2,
                          ),
                          child: _isCreating
                              ? SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_task, size: 16),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Create Task',
                                      style: theme.textTheme.bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: theme.colorScheme.onPrimary,
                                          ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

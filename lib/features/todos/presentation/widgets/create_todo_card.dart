import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/todo.dart';
import '../../domain/entities/create_todo_request.dart';

/// Inline card for creating new todos without popups
class CreateTodoCard extends StatefulWidget {
  const CreateTodoCard({
    super.key,
    required this.onCancel,
    required this.onSubmit,
    required this.color,
  });

  final VoidCallback onCancel;
  final Function(CreateTodoRequest) onSubmit;
  final Color color;

  @override
  State<CreateTodoCard> createState() => _CreateTodoCardState();
}

class _CreateTodoCardState extends State<CreateTodoCard> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _estimatedTimeController = TextEditingController();
  
  TodoPriority _selectedPriority = TodoPriority.medium;
  String _timeUnit = 'minutes';
  DateTime? _dueDate;
  int? _difficultyRating;
  int? _energyLevel;
  String? _context;
  List<String> _tags = [];
  
  bool _showAdvancedOptions = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _estimatedTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: widget.color.withValues(alpha: 0.3),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: widget.color.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                children: [
                  Icon(
                    Icons.add_task,
                    color: widget.color,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Create New Task',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: widget.color,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: widget.onCancel,
                    icon: const Icon(Icons.close, size: 18),
                    style: IconButton.styleFrom(
                      minimumSize: const Size(32, 32),
                      backgroundColor: theme.dividerColor.withValues(alpha: 0.1),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Task title
              TextFormField(
                controller: _titleController,
                decoration: _buildInputDecoration(
                  'Task title',
                  Icons.title,
                  theme,
                ),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a task title';
                  }
                  return null;
                },
                autofocus: true,
              ),
              
              const SizedBox(height: 12),
              
              // Task description
              TextFormField(
                controller: _descriptionController,
                decoration: _buildInputDecoration(
                  'Description',
                  Icons.description,
                  theme,
                ),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 12),
              
              // Priority and estimated time row
              Row(
                children: [
                  // Priority dropdown
                  Expanded(
                    child: DropdownButtonFormField<TodoPriority>(
                      value: _selectedPriority,
                      decoration: _buildInputDecoration(
                        'Priority',
                        Icons.flag,
                        theme,
                      ),
                      items: TodoPriority.values.map((priority) {
                        return DropdownMenuItem(
                          value: priority,
                          child: Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: _getPriorityColor(priority),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(priority.displayName),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _selectedPriority = value;
                          });
                        }
                      },
                    ),
                  ),
                  
                  const SizedBox(width: 12),
                  
                  // Estimated time
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: _estimatedTimeController,
                            decoration: _buildInputDecoration(
                              'Time',
                              Icons.schedule,
                              theme,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: _timeUnit,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            ),
                            items: const [
                              DropdownMenuItem(value: 'minutes', child: Text('min')),
                              DropdownMenuItem(value: 'hours', child: Text('hrs')),
                            ],
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _timeUnit = value;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              
              // Advanced options toggle
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    _showAdvancedOptions = !_showAdvancedOptions;
                  });
                },
                icon: Icon(
                  _showAdvancedOptions 
                      ? Icons.keyboard_arrow_up 
                      : Icons.keyboard_arrow_down,
                  size: 16,
                ),
                label: Text(
                  _showAdvancedOptions ? 'Less options' : 'More options',
                  style: theme.textTheme.bodySmall,
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.symmetric(vertical: 4),
                ),
              ),
              
              // Advanced options
              if (_showAdvancedOptions) ...[
                const SizedBox(height: 12),
                _buildAdvancedOptions(theme),
              ],
              
              const SizedBox(height: 16),
              
              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: widget.onCancel,
                      child: const Text('Cancel'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 2,
                    child: FilledButton(
                      onPressed: _submitForm,
                      style: FilledButton.styleFrom(
                        backgroundColor: widget.color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      child: const Text('Create Task'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdvancedOptions(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Due date
        InkWell(
          onTap: _selectDueDate,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: theme.dividerColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: theme.iconTheme.color),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _dueDate != null 
                        ? 'Due: ${_dueDate!.day}/${_dueDate!.month}/${_dueDate!.year}'
                        : 'Set due date (optional)',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: _dueDate != null 
                          ? theme.textTheme.bodyMedium?.color
                          : theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
                    ),
                  ),
                ),
                if (_dueDate != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _dueDate = null;
                      });
                    },
                    icon: const Icon(Icons.clear, size: 16),
                    style: IconButton.styleFrom(minimumSize: const Size(24, 24)),
                  ),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 12),
        
        // Difficulty and energy sliders
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Difficulty: ${_difficultyRating ?? 'Not set'}',
                    style: theme.textTheme.bodySmall,
                  ),
                  Slider(
                    value: (_difficultyRating ?? 5).toDouble(),
                    min: 1,
                    max: 10,
                    divisions: 9,
                    activeColor: widget.color,
                    onChanged: (value) {
                      setState(() {
                        _difficultyRating = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Energy: ${_energyLevel ?? 'Not set'}',
                    style: theme.textTheme.bodySmall,
                  ),
                  Slider(
                    value: (_energyLevel ?? 3).toDouble(),
                    min: 1,
                    max: 5,
                    divisions: 4,
                    activeColor: widget.color,
                    onChanged: (value) {
                      setState(() {
                        _energyLevel = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 12),
        
        // Context field
        TextFormField(
          decoration: _buildInputDecoration(
            'Context (e.g., @computer, @home)',
            Icons.location_on,
            theme,
          ),
          onChanged: (value) {
            _context = value.trim().isEmpty ? null : value;
          },
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(String hint, IconData icon, ThemeData theme) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, size: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: theme.dividerColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: theme.dividerColor.withValues(alpha: 0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: widget.color, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      filled: true,
      fillColor: theme.inputDecorationTheme.fillColor?.withValues(alpha: 0.3),
    );
  }

  Color _getPriorityColor(TodoPriority priority) {
    switch (priority) {
      case TodoPriority.low:
        return AppColors.mint;
      case TodoPriority.medium:
        return AppColors.blue;
      case TodoPriority.high:
        return AppColors.orange;
      case TodoPriority.urgent:
        return AppColors.error;
    }
  }

  Future<void> _selectDueDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    
    if (date != null) {
      setState(() {
        _dueDate = date;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final estimatedTime = _estimatedTimeController.text.trim().isNotEmpty 
          ? int.tryParse(_estimatedTimeController.text)
          : null;

      final request = CreateTodoRequest(
        projectId: '', // This will be set by the parent
        taskName: _titleController.text.trim(),
        taskDescription: _descriptionController.text.trim(),
        priority: _selectedPriority,
        estimatedTime: estimatedTime,
        timeUnit: _timeUnit,
        dueDate: _dueDate,
        tags: _tags,
        difficultyRating: _difficultyRating,
        energyLevelRequired: _energyLevel,
        context: _context,
      );

      widget.onSubmit(request);
    }
  }
}

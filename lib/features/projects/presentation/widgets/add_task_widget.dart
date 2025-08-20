import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/theme/app_colors.dart';
import '../../../../core/constants/api_constants.dart';

/// Intent for opening the add task widget
class OpenAddTaskIntent extends Intent {
  const OpenAddTaskIntent();
}

/// Widget for adding new tasks inline within kanban columns with AI Enhancement support
///
/// Features:
/// - Toggle between regular task creation and AI-enhanced creation
/// - When AI Enhancement is ON: provides additional fields and calls AI API
/// - When AI Enhancement is OFF: simple task name input only
///
/// Usage:
/// ```dart
/// AddTaskWidget(
///   columnId: 'column-uuid',
///   projectId: 'project-uuid',
///   onAddTask: (taskName) {
///     // Handle regular task creation
///   },
///   onAddAITask: (aiTaskData) {
///     // Handle AI-enhanced task creation
///     // aiTaskData contains: enhanced_description, emoji, priority, ai_generated_subtasks, etc.
///   },
/// )
/// ```
class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({
    super.key,
    required this.columnId,
    required this.projectId,
    required this.onAddTask,
    required this.onAddAITask,
    required this.onAddScheduledTask,
  });

  final String columnId;
  final String projectId;
  final Function(String taskName) onAddTask;
  final Function(Map<String, dynamic> aiTaskData) onAddAITask;
  final Function(Map<String, dynamic> scheduledTaskData) onAddScheduledTask;

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  bool _isSubmitting = false;
  bool _isAIEnhanced = false;
  bool _isScheduled = false;
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();
  final TextEditingController _projectContextController =
      TextEditingController();

  // Scheduling state variables
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedDateOption =
      'today'; // today, later_today, tomorrow, next_week, custom
  bool _isRecurring = false;
  String _recurringPattern = 'none'; // none, daily, weekdays, weekly, monthly
  final FocusNode _taskNameFocusNode = FocusNode();
  final FocusNode _taskDescriptionFocusNode = FocusNode();
  final FocusNode _projectContextFocusNode = FocusNode();
  Timer? _autoCollapseTimer;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  // Auto-collapse duration (in seconds)
  static const int _autoCollapseDuration = 10;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    // Listen to focus changes to manage auto-collapse
    _taskNameFocusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _autoCollapseTimer?.cancel();
    _animationController.dispose();
    _taskNameController.dispose();
    _taskDescriptionController.dispose();
    _projectContextController.dispose();
    _taskNameFocusNode.removeListener(_onFocusChange);
    _taskNameFocusNode.dispose();
    _taskDescriptionFocusNode.dispose();
    _projectContextFocusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_taskNameFocusNode.hasFocus) {
      _cancelAutoCollapse();
    } else if (_isExpanded && _taskNameController.text.isEmpty) {
      _startAutoCollapse();
    }
  }

  void _startAutoCollapse() {
    _cancelAutoCollapse();
    _autoCollapseTimer = Timer(
      const Duration(seconds: _autoCollapseDuration),
      () {
        if (mounted && _isExpanded && _taskNameController.text.isEmpty) {
          _handleCancel();
        }
      },
    );
  }

  void _cancelAutoCollapse() {
    _autoCollapseTimer?.cancel();
    _autoCollapseTimer = null;
  }

  void _toggleExpanded() {
    _cancelAutoCollapse();
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
        // Focus the text field when expanded
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _taskNameFocusNode.requestFocus();
          }
        });
      } else {
        _animationController.reverse();
        // Clear the text fields when collapsed
        _taskNameController.clear();
        _taskDescriptionController.clear();
        _projectContextController.clear();
      }
    });
  }

  void _openAddTask() {
    if (!_isExpanded) {
      _cancelAutoCollapse();
      setState(() {
        _isExpanded = true;
      });
      _animationController.forward();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _taskNameFocusNode.requestFocus();
        }
      });
    } else {
      // If already expanded, just focus the text field and cancel auto-collapse
      _cancelAutoCollapse();
      if (mounted) {
        _taskNameFocusNode.requestFocus();
      }
    }
  }

  Future<void> _handleSubmit() async {
    final taskName = _taskNameController.text.trim();
    if (taskName.isEmpty || _isSubmitting) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      if (_isScheduled) {
        // Create scheduled task
        await _createScheduledTask();
      } else if (_isAIEnhanced) {
        // Call AI API to enhance the task
        await _createAIEnhancedTask();
      } else {
        // Regular task creation
        widget.onAddTask(taskName);
        _showTaskAddedFeedback();
      }

      // Clear the text fields
      _taskNameController.clear();
      _taskDescriptionController.clear();
      _projectContextController.clear();

      // Keep widget expanded for continuous task creation
      // and refocus for the next task
      await Future.delayed(const Duration(milliseconds: 100));

      if (mounted) {
        _taskNameFocusNode.requestFocus();
        // Start auto-collapse timer for better UX
        _startAutoCollapse();
      }
    } catch (e) {
      if (mounted) {
        _showErrorFeedback('Failed to create task: ${e.toString()}');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  Future<void> _createAIEnhancedTask() async {
    try {
      final aiTaskData = await _callAIEnhancementAPI();
      if (aiTaskData != null) {
        widget.onAddAITask(aiTaskData);
        _showTaskAddedFeedback(isAIEnhanced: true);
      } else {
        throw Exception('Failed to get AI enhancement');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> _callAIEnhancementAPI() async {
    try {
      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}/api/v1/ai/tasks'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${await _getAuthToken()}',
        },
        body: jsonEncode({
          'task_name': _taskNameController.text.trim(),
          'task_description': _taskDescriptionController.text.trim(),
          'project_id': widget.projectId,
          'column_id': widget.columnId,
          'project_context': _projectContextController.text.trim(),
          'user_preferences':
              'Focus on professional development best practices',
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data['data'];
      } else {
        throw Exception('AI API call failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  Future<String> _getAuthToken() async {
    // TODO: Implement actual token retrieval from secure storage
    // For now, return a placeholder
    return 'your-jwt-token-here';
  }

  Future<void> _createScheduledTask() async {
    try {
      final scheduledTaskData = await _buildScheduledTaskData();
      widget.onAddScheduledTask(scheduledTaskData);
      _showTaskAddedFeedback(isScheduled: true);
    } catch (e) {
      throw Exception('Failed to create scheduled task: $e');
    }
  }

  Future<Map<String, dynamic>> _buildScheduledTaskData() async {
    final DateTime scheduledDateTime = _calculateScheduledDateTime();

    return {
      'task_name': _taskNameController.text.trim(),
      'task_description': _taskDescriptionController.text.trim(),
      'project_id': widget.projectId,
      'column_id': widget.columnId,
      'scheduled_datetime': scheduledDateTime.toIso8601String(),
      'is_all_day': _selectedTime == null,
      'is_recurring': _isRecurring,
      'recurrence_pattern': _isRecurring ? _recurringPattern : 'none',
      'recurrence_interval': 1,
      'reminder_minutes_before': 15,
    };
  }

  DateTime _calculateScheduledDateTime() {
    DateTime baseDate;
    final now = DateTime.now();

    switch (_selectedDateOption) {
      case 'today':
        baseDate = DateTime(now.year, now.month, now.day);
        break;
      case 'later_today':
        baseDate = now.add(const Duration(hours: 2));
        return baseDate;
      case 'tomorrow':
        baseDate = DateTime(now.year, now.month, now.day + 1);
        break;
      case 'next_week':
        baseDate = DateTime(now.year, now.month, now.day + 7);
        break;
      case 'custom':
        baseDate = _selectedDate ?? DateTime(now.year, now.month, now.day);
        break;
      default:
        baseDate = DateTime(now.year, now.month, now.day);
    }

    // Add time if specified
    if (_selectedTime != null) {
      return DateTime(
        baseDate.year,
        baseDate.month,
        baseDate.day,
        _selectedTime!.hour,
        _selectedTime!.minute,
      );
    }

    // Default to 9 AM if no time specified
    return DateTime(baseDate.year, baseDate.month, baseDate.day, 9, 0);
  }

  void _selectDateOption(String option) {
    setState(() {
      _selectedDateOption = option;
      if (option != 'custom') {
        _selectedDate = null; // Clear custom date when using predefined options
      }
    });
  }

  Future<void> _pickCustomDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _selectedDateOption = 'custom';
      });
    }
  }

  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  String _getDateOptionDisplay(String option) {
    switch (option) {
      case 'today':
        return 'Today';
      case 'later_today':
        return 'Later Today';
      case 'tomorrow':
        return 'Tomorrow';
      case 'next_week':
        return 'Next Week';
      case 'custom':
        if (_selectedDate != null) {
          return '${_selectedDate!.month}/${_selectedDate!.day}/${_selectedDate!.year}';
        }
        return 'Pick Date';
      default:
        return 'Today';
    }
  }

  Widget _buildDateOption(String value, String label) {
    final isSelected = _selectedDateOption == value;
    return InkWell(
      onTap: () {
        if (value == 'custom') {
          _pickCustomDate();
        } else {
          _selectDateOption(value);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.transparent,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.blue.withOpacity(0.3),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.blue.shade700,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  void _handleCancel() {
    _cancelAutoCollapse();
    _taskNameController.clear();
    _taskDescriptionController.clear();
    _projectContextController.clear();
    setState(() {
      _isExpanded = false;
      _isScheduled = false;
      _selectedDate = null;
      _selectedTime = null;
      _selectedDateOption = 'today';
      _isRecurring = false;
      _recurringPattern = 'none';
    });
    _animationController.reverse();
  }

  void _showTaskAddedFeedback({
    bool isAIEnhanced = false,
    bool isScheduled = false,
  }) {
    // Brief visual feedback that task was added
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isScheduled
                  ? Icons.schedule
                  : isAIEnhanced
                  ? Icons.auto_awesome
                  : Icons.check_circle,
              color: AppColors.mint,
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              isScheduled
                  ? 'Scheduled task created successfully!'
                  : isAIEnhanced
                  ? 'AI-enhanced task created successfully!'
                  : 'Task added successfully',
            ),
          ],
        ),
        duration: const Duration(milliseconds: 2000),
        behavior: SnackBarBehavior.floating,
        backgroundColor: isScheduled
            ? Colors.blue.shade600
            : isAIEnhanced
            ? Colors.purple.shade600
            : Colors.green.shade600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  void _showErrorFeedback(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.error, color: Colors.white, size: 16),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        duration: const Duration(milliseconds: 3000),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red.shade600,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(
          LogicalKeyboardKey.meta, // Command key on Mac
          LogicalKeyboardKey.keyN,
        ): const OpenAddTaskIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.control, // Ctrl key on Windows/Linux
          LogicalKeyboardKey.keyN,
        ): const OpenAddTaskIntent(),
        LogicalKeySet(
          LogicalKeyboardKey.escape, // Escape to close
        ): const DismissIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          OpenAddTaskIntent: CallbackAction<OpenAddTaskIntent>(
            onInvoke: (_) {
              _openAddTask();
              return null;
            },
          ),
          DismissIntent: CallbackAction<DismissIntent>(
            onInvoke: (_) {
              if (_isExpanded) {
                _handleCancel();
              }
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: false,
          child: Builder(
            builder: (context) {
              if (!_isExpanded) {
                return _buildCollapsedState(theme);
              }
              return _buildExpandedState(theme);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCollapsedState(ThemeData theme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: _toggleExpanded,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.dividerColor.withValues(alpha: 0.2),
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.add, size: 20, color: AppColors.mint),
              const SizedBox(width: 8),
              Text(
                'Add a task',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.mint,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.mint.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.mint.withOpacity(0.3),
                    width: 0.5,
                  ),
                ),
                child: Text(
                  Platform.isMacOS ? '⌘N' : 'Ctrl+N',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: AppColors.mint.withOpacity(0.8),
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedState(ThemeData theme) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Card(
              elevation: 4,
              shadowColor: Colors.black.withValues(alpha: 0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: _isScheduled
                      ? Colors.blue.withValues(alpha: 0.3)
                      : _isAIEnhanced
                      ? Colors.purple.withValues(alpha: 0.3)
                      : AppColors.mint.withValues(alpha: 0.3),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with toggles
                    Row(
                      children: [
                        Icon(
                          _isScheduled
                              ? Icons.schedule
                              : _isAIEnhanced
                              ? Icons.auto_awesome
                              : Icons.add_task,
                          size: 16,
                          color: _isScheduled
                              ? Colors.blue
                              : _isAIEnhanced
                              ? Colors.purple
                              : AppColors.mint,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          _isScheduled
                              ? 'Schedule Task'
                              : _isAIEnhanced
                              ? 'Create AI-Enhanced Task'
                              : 'Add new task',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: _isScheduled
                                ? Colors.blue
                                : _isAIEnhanced
                                ? Colors.purple
                                : AppColors.mint,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        // Enhancement Toggles
                        Row(
                          children: [
                            // Schedule Toggle
                            Text(
                              'Schedule',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Switch(
                              value: _isScheduled,
                              onChanged: _isSubmitting
                                  ? null
                                  : (value) {
                                      setState(() {
                                        _isScheduled = value;
                                        if (value) {
                                          _isAIEnhanced =
                                              false; // Disable AI when scheduling
                                        }
                                      });
                                      _cancelAutoCollapse();
                                    },
                              activeColor: Colors.blue,
                              thumbColor: WidgetStateProperty.resolveWith((
                                states,
                              ) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.blue;
                                }
                                return Colors.grey.shade400;
                              }),
                              trackColor: WidgetStateProperty.resolveWith((
                                states,
                              ) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.blue.withOpacity(0.3);
                                }
                                return Colors.grey.shade300;
                              }),
                            ),

                            const SizedBox(width: 12),

                            // AI Enhancement Toggle
                            Text(
                              'AI',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Switch(
                              value: _isAIEnhanced,
                              onChanged: _isSubmitting
                                  ? null
                                  : (value) {
                                      setState(() {
                                        _isAIEnhanced = value;
                                        if (value) {
                                          _isScheduled =
                                              false; // Disable scheduling when using AI
                                        }
                                      });
                                      _cancelAutoCollapse();
                                    },
                              activeColor: Colors.purple,
                              thumbColor: WidgetStateProperty.resolveWith((
                                states,
                              ) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.purple;
                                }
                                return Colors.grey.shade400;
                              }),
                              trackColor: WidgetStateProperty.resolveWith((
                                states,
                              ) {
                                if (states.contains(WidgetState.selected)) {
                                  return Colors.purple.withOpacity(0.3);
                                }
                                return Colors.grey.shade300;
                              }),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    // Task Name input
                    TextField(
                      controller: _taskNameController,
                      focusNode: _taskNameFocusNode,
                      enabled: !_isSubmitting,
                      decoration: InputDecoration(
                        labelText: 'Task Name *',
                        hintText: 'Enter task name...',
                        hintStyle: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyMedium?.color?.withValues(
                            alpha: 0.5,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: theme.dividerColor.withValues(alpha: 0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: _isScheduled
                                ? Colors.blue
                                : _isAIEnhanced
                                ? Colors.purple
                                : AppColors.mint,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        suffixIcon: _isSubmitting
                            ? Container(
                                margin: const EdgeInsets.all(12),
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    _isScheduled
                                        ? Colors.blue
                                        : _isAIEnhanced
                                        ? Colors.purple
                                        : AppColors.mint,
                                  ),
                                ),
                              )
                            : null,
                      ),
                      style: theme.textTheme.bodyMedium,
                      maxLines: 2,
                      minLines: 1,
                      textInputAction: (_isAIEnhanced || _isScheduled)
                          ? TextInputAction.next
                          : TextInputAction.done,
                      onSubmitted: (_) {
                        if (_isAIEnhanced) {
                          _taskDescriptionFocusNode.requestFocus();
                        } else if (_isScheduled) {
                          // Focus moves to scheduling options
                          _handleSubmit();
                        } else {
                          _handleSubmit();
                        }
                      },
                      onChanged: (_) {
                        _cancelAutoCollapse();
                      },
                    ),

                    // AI-specific fields
                    if (_isAIEnhanced) ...[
                      const SizedBox(height: 12),

                      // Task Description
                      TextField(
                        controller: _taskDescriptionController,
                        focusNode: _taskDescriptionFocusNode,
                        enabled: !_isSubmitting,
                        decoration: InputDecoration(
                          labelText: 'Task Description',
                          hintText: 'Describe what needs to be done...',
                          hintStyle: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.textTheme.bodyMedium?.color
                                ?.withValues(alpha: 0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                        ),
                        style: theme.textTheme.bodyMedium,
                        maxLines: 3,
                        minLines: 2,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (_) {
                          _projectContextFocusNode.requestFocus();
                        },
                        onChanged: (_) {
                          _cancelAutoCollapse();
                        },
                      ),

                      const SizedBox(height: 12),

                      // Project Context
                      TextField(
                        controller: _projectContextController,
                        focusNode: _projectContextFocusNode,
                        enabled: !_isSubmitting,
                        decoration: InputDecoration(
                          labelText: 'Project Context',
                          hintText:
                              'e.g., Flutter mobile app, React website...',
                          hintStyle: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.textTheme.bodyMedium?.color
                                ?.withValues(alpha: 0.5),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                        ),
                        style: theme.textTheme.bodyMedium,
                        maxLines: 2,
                        minLines: 1,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_) => _handleSubmit(),
                        onChanged: (_) {
                          _cancelAutoCollapse();
                        },
                      ),

                      const SizedBox(height: 12),

                      // AI Enhancement info
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.purple.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lightbulb,
                              size: 16,
                              color: Colors.purple,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'AI will generate task description, subtasks, priority, and emoji',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: Colors.purple.shade700,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    // Scheduling-specific fields
                    if (_isScheduled) ...[
                      const SizedBox(height: 12),

                      // Date Selection
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.blue.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Header
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Schedule Details',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: Colors.blue.shade700,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // Date options
                            Text(
                              'When:',
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                _buildDateOption('today', 'Today'),
                                _buildDateOption('later_today', 'Later Today'),
                                _buildDateOption('tomorrow', 'Tomorrow'),
                                _buildDateOption('next_week', 'Next Week'),
                                _buildDateOption(
                                  'custom',
                                  _getDateOptionDisplay('custom'),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // Time selection
                            Row(
                              children: [
                                Text(
                                  'Time (optional):',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: _pickTime,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blue.withOpacity(0.3),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 14,
                                          color: Colors.blue,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          _selectedTime?.format(context) ??
                                              'Set Time',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: Colors.blue.shade700,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (_selectedTime != null) ...[
                                  const SizedBox(width: 8),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedTime = null;
                                      });
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      size: 16,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ],
                            ),

                            const SizedBox(height: 12),

                            // Recurring options
                            Row(
                              children: [
                                Text(
                                  'Recurring:',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Switch(
                                  value: _isRecurring,
                                  onChanged: (value) {
                                    setState(() {
                                      _isRecurring = value;
                                      if (!value) {
                                        _recurringPattern = 'none';
                                      } else {
                                        _recurringPattern = 'daily';
                                      }
                                    });
                                  },
                                  activeColor: Colors.blue,
                                ),
                              ],
                            ),

                            // Recurring pattern dropdown
                            if (_isRecurring) ...[
                              const SizedBox(height: 8),
                              DropdownButtonFormField<String>(
                                value: _recurringPattern,
                                decoration: InputDecoration(
                                  labelText: 'Repeat',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 8,
                                  ),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'daily',
                                    child: Text('Every day'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'weekdays',
                                    child: Text('Every weekday'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'weekly',
                                    child: Text('Every week'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'monthly',
                                    child: Text('Every month'),
                                  ),
                                ],
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      _recurringPattern = value;
                                    });
                                  }
                                },
                              ),
                            ],

                            const SizedBox(height: 8),

                            // Schedule info
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_outline,
                                    size: 14,
                                    color: Colors.blue.shade700,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      'Task will be scheduled and moved to your Today list at the specified time',
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(
                                            color: Colors.blue.shade700,
                                            fontSize: 11,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                    const SizedBox(height: 16),

                    // Action buttons
                    Row(
                      children: [
                        // Add button
                        ElevatedButton(
                          onPressed: _isSubmitting ? null : _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isScheduled
                                ? Colors.blue
                                : _isAIEnhanced
                                ? Colors.purple
                                : AppColors.black,
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: theme.disabledColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 0,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (_isSubmitting) ...[
                                SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                              ] else if (_isScheduled) ...[
                                const Icon(Icons.schedule, size: 16),
                                const SizedBox(width: 6),
                              ] else if (_isAIEnhanced) ...[
                                const Icon(Icons.auto_awesome, size: 16),
                                const SizedBox(width: 6),
                              ],
                              Text(
                                _isSubmitting
                                    ? (_isScheduled
                                          ? 'Scheduling...'
                                          : _isAIEnhanced
                                          ? 'Enhancing with AI...'
                                          : 'Adding...')
                                    : (_isScheduled
                                          ? 'Schedule Task'
                                          : _isAIEnhanced
                                          ? 'Create with AI'
                                          : 'Add Task'),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),

                        // Cancel button
                        TextButton(
                          onPressed: _isSubmitting ? null : _handleCancel,
                          style: TextButton.styleFrom(
                            foregroundColor: theme.textTheme.bodyMedium?.color
                                ?.withValues(alpha: 0.7),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        const Spacer(),
                      ],
                    ),

                    // Helpful tip
                    const SizedBox(height: 8),
                    Text(
                      _isScheduled
                          ? 'Task will be scheduled and appear at the specified time'
                          : _isAIEnhanced
                          ? 'AI will enhance your task with smart suggestions'
                          : 'Press Enter to add quickly or Escape to close',
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.textTheme.bodySmall?.color?.withValues(
                          alpha: 0.5,
                        ),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

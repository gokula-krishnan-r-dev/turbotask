import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/subtask.dart';
import '../bloc/subtask_bloc.dart';
import 'subtask_item_widget.dart';

class SubtaskListWidget extends StatefulWidget {
  const SubtaskListWidget({
    super.key,
    required this.todoId,
    this.isExpanded = false,
    this.onExpandToggle,
    this.maxVisibleSubtasks = 3,
  });

  final String todoId;
  final bool isExpanded;
  final VoidCallback? onExpandToggle;
  final int maxVisibleSubtasks;

  @override
  State<SubtaskListWidget> createState() => _SubtaskListWidgetState();
}

class _SubtaskListWidgetState extends State<SubtaskListWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final _addSubtaskController = TextEditingController();
  bool _isAddingSubtask = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    if (widget.isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(SubtaskListWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _addSubtaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SubtaskBloc, SubtaskState>(
      builder: (context, state) {
        if (state is SubtaskLoading && state.previousSubtasks == null) {
          return _buildLoadingIndicator();
        }

        final subtasks = _getSubtasks(state);
        if (subtasks.isEmpty && !_isAddingSubtask) {
          return _buildEmptyState(theme);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subtasks header with progress
            _buildSubtasksHeader(theme, subtasks),

            // Animated subtasks content
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return SizeTransition(
                  sizeFactor: _fadeAnimation,
                  child: FadeTransition(opacity: _fadeAnimation, child: child),
                );
              },
              child: widget.isExpanded
                  ? _buildExpandedSubtasks(theme, subtasks, state)
                  : _buildCollapsedSubtasks(theme, subtasks),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }

  Widget _buildEmptyState(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: _startAddingSubtask,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: theme.dividerColor.withOpacity(0.3),
              style: BorderStyle.solid,
            ),
          ),
          child: Row(
            children: [
              Icon(Icons.add_circle_outline, size: 20, color: AppColors.mint),
              const SizedBox(width: 8),
              Text(
                'Add subtask',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.mint,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubtasksHeader(ThemeData theme, List<Subtask> subtasks) {
    final completedCount = subtasks.where((s) => s.isCompleted).length;
    final totalCount = subtasks.length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: widget.onExpandToggle,
            child: Row(
              children: [
                Icon(
                  widget.isExpanded
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  size: 20,
                  color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                ),
                const SizedBox(width: 4),
                Text(
                  '$completedCount/$totalCount Subtasks',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Progress indicator
          if (totalCount > 0) ...[
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: theme.dividerColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: FractionallySizedBox(
                  widthFactor: completedCount / totalCount,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
          ],

          // Add subtask button (when expanded)
          if (widget.isExpanded && !_isAddingSubtask) ...[
            const SizedBox(width: 8),
            IconButton(
              onPressed: _startAddingSubtask,
              icon: Icon(Icons.add, size: 20, color: AppColors.mint),
              constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              padding: EdgeInsets.zero,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildCollapsedSubtasks(ThemeData theme, List<Subtask> subtasks) {
    final visibleSubtasks = subtasks.take(widget.maxVisibleSubtasks).toList();

    return Column(
      children: [
        ...visibleSubtasks.map(
          (subtask) => SubtaskItemWidget(subtask: subtask, showActions: false),
        ),

        if (subtasks.length > widget.maxVisibleSubtasks)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              '+${subtasks.length - widget.maxVisibleSubtasks} more',
              style: theme.textTheme.bodySmall?.copyWith(
                color: AppColors.mint,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildExpandedSubtasks(
    ThemeData theme,
    List<Subtask> subtasks,
    SubtaskState state,
  ) {
    return Column(
      children: [
        // All subtasks
        ...subtasks.map(
          (subtask) => SubtaskItemWidget(
            key: ValueKey(subtask.id),
            subtask: subtask,
            showActions: true,
          ),
        ),

        // Add subtask input
        if (_isAddingSubtask) _buildAddSubtaskInput(theme, state),

        // Loading indicator for operations
        if (state is SubtaskLoading && state.previousSubtasks != null)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
      ],
    );
  }

  Widget _buildAddSubtaskInput(ThemeData theme, SubtaskState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.mint.withOpacity(0.3), width: 1),
        ),
        child: Row(
          children: [
            // Checkbox placeholder
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(color: theme.dividerColor, width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
            ),

            const SizedBox(width: 12),

            // Text input
            Expanded(
              child: TextField(
                controller: _addSubtaskController,
                decoration: const InputDecoration(
                  hintText: 'Enter subtask task title*',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                ),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                autofocus: true,
                onSubmitted: _submitSubtask,
                enabled: state is! SubtaskLoading,
              ),
            ),

            // Action buttons
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: state is SubtaskLoading
                      ? null
                      : _cancelAddingSubtask,
                  icon: const Icon(Icons.close, size: 18),
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  padding: EdgeInsets.zero,
                ),
                IconButton(
                  onPressed: state is SubtaskLoading
                      ? null
                      : () => _submitSubtask(_addSubtaskController.text),
                  icon: const Icon(Icons.check, size: 18),
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  padding: EdgeInsets.zero,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Subtask> _getSubtasks(SubtaskState state) {
    if (state is SubtaskLoaded) {
      return state.subtasks;
    } else if (state is SubtaskLoading && state.previousSubtasks != null) {
      return state.previousSubtasks!;
    }
    return [];
  }

  void _startAddingSubtask() {
    setState(() {
      _isAddingSubtask = true;
    });
  }

  void _cancelAddingSubtask() {
    setState(() {
      _isAddingSubtask = false;
      _addSubtaskController.clear();
    });
  }

  void _submitSubtask(String name) {
    final trimmedName = name.trim();
    if (trimmedName.isNotEmpty) {
      context.read<SubtaskBloc>().add(
        CreateSubtask(todoId: widget.todoId, name: trimmedName),
      );
      _addSubtaskController.clear();
      setState(() {
        _isAddingSubtask = false;
      });
    }
  }
}

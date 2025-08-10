import 'package:flutter/material.dart';

import '../../domain/entities/todo.dart';

/// Enhanced column widget with smooth drop animations and skeleton placeholders
class DropTargetColumn extends StatefulWidget {
  const DropTargetColumn({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.targetStatus,
    required this.children,
    required this.onAcceptTodo,
    required this.onAddTask,
    this.emptyMessage,
    this.showAddButton = true,
  });

  final String title;
  final IconData icon;
  final Color color;
  final TodoStatus targetStatus;
  final List<Widget> children;
  final Function(Todo, TodoStatus) onAcceptTodo;
  final VoidCallback onAddTask;
  final String? emptyMessage;
  final bool showAddButton;

  @override
  State<DropTargetColumn> createState() => _DropTargetColumnState();
}

class _DropTargetColumnState extends State<DropTargetColumn>
    with TickerProviderStateMixin {
  late AnimationController _highlightController;
  late AnimationController _pulseController;
  late Animation<double> _highlightAnimation;
  late Animation<double> _pulseAnimation;
  late Animation<Color?> _colorAnimation;

  bool _isDragOver = false;
  bool _isAccepting = false;

  @override
  void initState() {
    super.initState();

    _highlightController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _highlightAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _highlightController, curve: Curves.easeOut),
    );

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _colorAnimation =
        ColorTween(
          begin: widget.color.withValues(alpha: 0.1),
          end: widget.color.withValues(alpha: 0.3),
        ).animate(
          CurvedAnimation(parent: _highlightController, curve: Curves.easeOut),
        );

    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _highlightController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: Listenable.merge([_highlightAnimation, _pulseAnimation]),
      builder: (context, child) {
        return DragTarget<Todo>(
          onWillAccept: (todo) {
            if (todo?.status != widget.targetStatus) {
              setState(() {
                _isDragOver = true;
              });
              _highlightController.forward();
              return true;
            }
            return false;
          },
          onLeave: (todo) {
            setState(() {
              _isDragOver = false;
            });
            _highlightController.reverse();
          },
          onAccept: (todo) async {
            setState(() {
              _isDragOver = false;
              _isAccepting = true;
            });

            _highlightController.reverse();

            // Call the acceptance callback
            widget.onAcceptTodo(todo, widget.targetStatus);

            // Brief delay for visual feedback
            await Future.delayed(const Duration(milliseconds: 200));

            if (mounted) {
              setState(() {
                _isAccepting = false;
              });
            }
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isDragOver
                      ? widget.color.withValues(alpha: 0.6)
                      : theme.dividerColor.withValues(alpha: 0.1),
                  width: _isDragOver ? 2 : 1,
                ),
                boxShadow: _isDragOver
                    ? [
                        BoxShadow(
                          color: widget.color.withValues(alpha: 0.2),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Enhanced header with drag indication
                  _buildHeader(context, theme),

                  // Content area with drop animation
                  Expanded(child: _buildContent(context, theme, candidateData)),

                  // Add task button
                  if (widget.showAddButton && !_isDragOver)
                    _buildAddButton(context, theme),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _isDragOver
            ? _colorAnimation.value
            : widget.color.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        border: Border(
          bottom: BorderSide(
            color: _isDragOver
                ? widget.color.withValues(alpha: 0.3)
                : widget.color.withValues(alpha: 0.1),
            width: _isDragOver ? 2 : 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Animated icon
          AnimatedScale(
            scale: _isDragOver ? _pulseAnimation.value : 1.0,
            duration: const Duration(milliseconds: 300),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _isDragOver
                    ? widget.color.withValues(alpha: 0.2)
                    : widget.color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(widget.icon, size: 16, color: widget.color),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: _isDragOver
                    ? widget.color
                    : widget.color.withValues(alpha: 0.8),
              ),
            ),
          ),
          // Task count badge
          if (widget.children.isNotEmpty)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _isDragOver
                    ? widget.color
                    : widget.color.withValues(alpha: 0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                widget.children.length.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ThemeData theme,
    List<Todo?> candidateData,
  ) {
    // Show skeleton placeholder when dragging over
    if (_isDragOver && candidateData.isNotEmpty) {
      return Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: widget.children.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) => widget.children[index],
            ),
          ),
          // Skeleton placeholder for the incoming todo
          _buildSkeletonPlaceholder(context, theme),
        ],
      );
    }

    // Regular content
    if (widget.children.isEmpty) {
      return _buildEmptyState(context, theme);
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: widget.children.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => widget.children[index],
    );
  }

  Widget _buildSkeletonPlaceholder(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _pulseAnimation.value,
            child: Card(
              elevation: 0,
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: widget.color.withValues(alpha: 0.4),
                  width: 2,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      widget.color.withValues(alpha: 0.08),
                      widget.color.withValues(alpha: 0.04),
                      widget.color.withValues(alpha: 0.08),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with circle and title placeholder
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Checkbox placeholder with subtle animation
                        AnimatedBuilder(
                          animation: _colorAnimation,
                          builder: (context, child) {
                            return Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: widget.color.withValues(alpha: 0.3),
                                  width: 2,
                                ),
                                color:
                                    _colorAnimation.value?.withValues(
                                      alpha: 0.1,
                                    ) ??
                                    Colors.transparent,
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 12),

                        // Title and content placeholders
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title placeholder with shimmer effect
                              _buildShimmerLine(
                                width: double.infinity,
                                height: 16,
                                borderRadius: 4,
                              ),
                              const SizedBox(height: 8),

                              // Description placeholders
                              _buildShimmerLine(
                                width: 200,
                                height: 12,
                                borderRadius: 3,
                              ),
                              const SizedBox(height: 6),
                              _buildShimmerLine(
                                width: 150,
                                height: 12,
                                borderRadius: 3,
                              ),
                            ],
                          ),
                        ),

                        // Pin icon placeholder
                        AnimatedBuilder(
                          animation: _colorAnimation,
                          builder: (context, child) {
                            return Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color:
                                    _colorAnimation.value?.withValues(
                                      alpha: 0.15,
                                    ) ??
                                    widget.color.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Footer with status and metadata tags
                    Row(
                      children: [
                        _buildShimmerLine(
                          width: 60,
                          height: 20,
                          borderRadius: 10,
                        ),
                        const SizedBox(width: 8),
                        _buildShimmerLine(
                          width: 80,
                          height: 20,
                          borderRadius: 10,
                        ),
                        const Spacer(),
                        _buildShimmerLine(
                          width: 40,
                          height: 12,
                          borderRadius: 6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerLine({
    required double width,
    required double height,
    double borderRadius = 4,
  }) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color:
                _colorAnimation.value?.withValues(alpha: 0.2) ??
                widget.color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context, ThemeData theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            size: 48,
            color: theme.iconTheme.color?.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            widget.emptyMessage ?? _getDefaultEmptyMessage(),
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
            ),
            textAlign: TextAlign.center,
          ),
          if (_isDragOver) ...[
            const SizedBox(height: 16),
            AnimatedScale(
              scale: _pulseAnimation.value,
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: widget.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: widget.color.withValues(alpha: 0.3),
                    style: BorderStyle.solid,
                  ),
                ),
                child: Text(
                  'Drop here to move',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: widget.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAddButton(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: widget.onAddTask,
          icon: Icon(Icons.add, size: 16, color: widget.color),
          label: Text('Add Task', style: TextStyle(color: widget.color)),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: widget.color.withValues(alpha: 0.3)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
      ),
    );
  }

  String _getDefaultEmptyMessage() {
    switch (widget.title.toLowerCase()) {
      case 'backlog':
        return 'No tasks in backlog.\nAdd ideas and future tasks here.';
      case 'this week':
        return 'No tasks planned for this week.\nAdd tasks you want to work on.';
      case 'today':
        return 'No tasks for today.\nMove tasks here when you start working.';
      case 'done':
        return 'No completed tasks yet.\nCompleted tasks will appear here.';
      default:
        return 'No tasks yet.\nAdd your first task to get started.';
    }
  }
}

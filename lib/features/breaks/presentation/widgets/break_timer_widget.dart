import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/break_session.dart';
import '../bloc/break_bloc.dart';
import '../bloc/break_state.dart';

class BreakTimerWidget extends StatefulWidget {
  final BreakSession breakSession;
  final Function({String notes}) onStopBreak;
  final VoidCallback onClose;

  const BreakTimerWidget({
    super.key,
    required this.breakSession,
    required this.onStopBreak,
    required this.onClose,
  });

  @override
  State<BreakTimerWidget> createState() => _BreakTimerWidgetState();
}

class _BreakTimerWidgetState extends State<BreakTimerWidget>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<BreakBloc, BreakState>(
      listener: (context, state) {
        if (state is BreakError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.message}'),
              backgroundColor: AppColors.error,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      child: MouseRegion(
        onEnter: (_) => _onHover(true),
        onExit: (_) => _onHover(false),
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Stack(
                children: [
                  // Main content
                  _buildMainContent(theme),

                  // Hover overlay with actions
                  if (_isHovered)
                    Positioned.fill(
                      child: FadeTransition(
                        opacity: _opacityAnimation,
                        child: _buildHoverOverlay(theme),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    if (_isHovered != isHovered) {
      setState(() {
        _isHovered = isHovered;
      });

      if (isHovered) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  Widget _buildMainContent(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Break indicator icon
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: AppColors.warning,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.warning.withOpacity(0.4),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Break info - compact version
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Break status
                AutoSizeText(
                  'On Break',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: theme.colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 2),

                // Break type
                AutoSizeText(
                  widget.breakSession.displayBreakType,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: theme.colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Timer display - compact
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<BreakBloc, BreakState>(
                builder: (context, state) {
                  return AutoSizeText(
                    widget.breakSession.formattedDuration,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: AppColors.warning,
                      fontFeatures: [const FontFeature.tabularFigures()],
                    ),
                  );
                },
              ),

              AutoSizeText(
                'Break Time',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHoverOverlay(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.warning.withOpacity(0.9),
            AppColors.warning.withOpacity(0.95),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.warning.withOpacity(0.5), width: 1),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Break info
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.coffee, color: theme.colorScheme.onSurface, size: 16),
              const SizedBox(width: 8),
              AutoSizeText(
                'Break in Progress',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Stop break button
              _buildCompactActionButton(
                theme,
                icon: Icons.stop,
                onPressed: () => widget.onStopBreak(),
                tooltip: 'Stop Break',
              ),

              // Close button
              _buildCompactActionButton(
                theme,
                icon: Icons.close,
                onPressed: widget.onClose,
                tooltip: 'Close',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompactActionButton(
    ThemeData theme, {
    required IconData icon,
    required VoidCallback onPressed,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withOpacity(0.2),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: theme.colorScheme.onSurface.withOpacity(0.3),
            ),
          ),
          child: Icon(icon, size: 16, color: theme.colorScheme.onSurface),
        ),
      ),
    );
  }
}

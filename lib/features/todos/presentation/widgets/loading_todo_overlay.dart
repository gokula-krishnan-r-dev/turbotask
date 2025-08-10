import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Loading overlay widget for todos during API operations
class LoadingTodoOverlay extends StatefulWidget {
  const LoadingTodoOverlay({
    super.key,
    required this.child,
    required this.isLoading,
    this.loadingText = 'Updating...',
  });

  final Widget child;
  final bool isLoading;
  final String loadingText;

  @override
  State<LoadingTodoOverlay> createState() => _LoadingTodoOverlayState();
}

class _LoadingTodoOverlayState extends State<LoadingTodoOverlay>
    with TickerProviderStateMixin {
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _shimmerAnimation = Tween<double>(begin: -2.0, end: 2.0).animate(
      CurvedAnimation(parent: _shimmerController, curve: Curves.easeInOut),
    );

    if (widget.isLoading) {
      _shimmerController.repeat();
    }
  }

  @override
  void didUpdateWidget(LoadingTodoOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isLoading && !oldWidget.isLoading) {
      _shimmerController.repeat();
    } else if (!widget.isLoading && oldWidget.isLoading) {
      _shimmerController.stop();
    }
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content
        AnimatedOpacity(
          opacity: widget.isLoading ? 0.6 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: widget.child,
        ),

        // Loading overlay
        if (widget.isLoading)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _shimmerAnimation,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.transparent,
                        AppColors.blue.withValues(alpha: 0.1),
                        Colors.transparent,
                      ],
                      stops: [0.0, 0.5 + (_shimmerAnimation.value * 0.3), 1.0],
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blue.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blue.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.loadingText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

/// Professional shimmer effect for loading states
class ShimmerLoadingCard extends StatefulWidget {
  const ShimmerLoadingCard({super.key});

  @override
  State<ShimmerLoadingCard> createState() => _ShimmerLoadingCardState();
}

class _ShimmerLoadingCardState extends State<ShimmerLoadingCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: theme.dividerColor.withValues(alpha: 0.1)),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title shimmer
                _buildShimmerLine(
                  width: double.infinity,
                  height: 16,
                  gradientPosition: _animation.value,
                ),
                const SizedBox(height: 8),

                // Description lines
                _buildShimmerLine(
                  width: 200,
                  height: 12,
                  gradientPosition: _animation.value + 0.1,
                ),
                const SizedBox(height: 6),
                _buildShimmerLine(
                  width: 150,
                  height: 12,
                  gradientPosition: _animation.value + 0.2,
                ),
                const SizedBox(height: 12),

                // Footer tags
                Row(
                  children: [
                    _buildShimmerLine(
                      width: 60,
                      height: 20,
                      borderRadius: 10,
                      gradientPosition: _animation.value + 0.3,
                    ),
                    const SizedBox(width: 8),
                    _buildShimmerLine(
                      width: 80,
                      height: 20,
                      borderRadius: 10,
                      gradientPosition: _animation.value + 0.4,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildShimmerLine({
    required double width,
    required double height,
    double borderRadius = 4,
    required double gradientPosition,
  }) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.dividerColor.withValues(alpha: 0.1),
            theme.dividerColor.withValues(alpha: 0.3),
            theme.dividerColor.withValues(alpha: 0.1),
          ],
          stops: [0.0, 0.5 + (gradientPosition * 0.3).clamp(0.0, 1.0), 1.0],
        ),
      ),
    );
  }
}

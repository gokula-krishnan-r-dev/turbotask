import 'package:flutter/material.dart';

import '../../../../core/theme/app_gradients.dart';

/// Logo widget with gradient background and check icon.
/// Matches the design from the mockup with circular gradient background.
class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.size = 84, this.iconSize = 42});

  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients.primary,
      ),
      child: Icon(Icons.check_rounded, size: iconSize, color: Colors.black87),
    );
  }
}

/// Animated logo widget with subtle animation
class AnimatedLogoWidget extends StatefulWidget {
  const AnimatedLogoWidget({super.key, this.size = 84, this.iconSize = 42});

  final double size;
  final double iconSize;

  @override
  State<AnimatedLogoWidget> createState() => _AnimatedLogoWidgetState();
}

class _AnimatedLogoWidgetState extends State<AnimatedLogoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value * 0.2,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppGradients.primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                Icons.check_rounded,
                size: widget.iconSize,
                color: Colors.black87,
              ),
            ),
          ),
        );
      },
    );
  }
}

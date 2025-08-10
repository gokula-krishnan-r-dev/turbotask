import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// Custom gradient button with loading state and hover effects.
/// Provides a pill-shaped button with gradient background.
class GradientButton extends StatefulWidget {
  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.gradient,
    this.isLoading = false,
    this.height = 54,
    this.borderRadius = 27,
    this.loadingColor,
    this.disabledGradient,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final Gradient? gradient;
  final bool isLoading;
  final double height;
  final double borderRadius;
  final Color? loadingColor;
  final Gradient? disabledGradient;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.98).animate(
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
    final isEnabled = widget.onPressed != null && !widget.isLoading;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: isEnabled ? (_) => _animationController.forward() : null,
        onTapUp: isEnabled ? (_) => _animationController.reverse() : null,
        onTapCancel: isEnabled ? () => _animationController.reverse() : null,
        onTap: widget.onPressed,
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: widget.height,
                decoration: BoxDecoration(
                  gradient: _getGradient(isEnabled),
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  boxShadow: isEnabled && _isHovered
                      ? [
                          BoxShadow(
                            color: AppColors.mint.withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    onTap: widget.onPressed,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: widget.isLoading
                          ? SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  widget.loadingColor ?? Colors.black87,
                                ),
                              ),
                            )
                          : DefaultTextStyle(
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                              child: widget.child,
                            ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Gradient _getGradient(bool isEnabled) {
    if (!isEnabled) {
      return widget.disabledGradient ??
          const LinearGradient(colors: [AppColors.gray400, AppColors.gray300]);
    }

    return widget.gradient ??
        const LinearGradient(
          colors: [AppColors.violet, AppColors.mint],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        );
  }
}

/// Simplified gradient button for smaller use cases
class SimpleGradientButton extends StatelessWidget {
  const SimpleGradientButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.gradient,
    this.isLoading = false,
    this.height = 48,
  });

  final VoidCallback? onPressed;
  final String text;
  final Gradient? gradient;
  final bool isLoading;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GradientButton(
      onPressed: onPressed,
      gradient: gradient,
      isLoading: isLoading,
      height: height,
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}

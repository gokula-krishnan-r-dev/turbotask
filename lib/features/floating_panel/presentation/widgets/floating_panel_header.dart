import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

/// Header widget for the floating panel with controls
class FloatingPanelHeader extends StatelessWidget {
  final VoidCallback onSettingsPressed;
  final VoidCallback onClosePressed;

  const FloatingPanelHeader({
    super.key,
    required this.onSettingsPressed,
    required this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 56,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outline.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            // Enhanced Logo/Icon with animation
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary,
                    theme.colorScheme.primary.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: theme.colorScheme.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.task_alt,
                size: 18,
                color: theme.colorScheme.onPrimary,
              ),
            ),

            const SizedBox(width: 16),

            // Enhanced Title with subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'TurboTask',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                      letterSpacing: 0.2,
                    ),
                    maxLines: 1,
                    minFontSize: 14,
                  ),
                  AutoSizeText(
                    'Quick Access Panel',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withOpacity(0.6),
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    minFontSize: 10,
                  ),
                ],
              ),
            ),

            // Enhanced Controls with better styling
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Settings button
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceVariant.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: onSettingsPressed,
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.settings_outlined,
                          size: 18,
                          color: theme.colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 8),

                // Close button with enhanced styling
                Container(
                  decoration: BoxDecoration(
                    color: isDark
                        ? Colors.red.withOpacity(0.2)
                        : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: onClosePressed,
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.close_rounded,
                          size: 18,
                          color: Colors.red.shade600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

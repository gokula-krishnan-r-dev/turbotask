import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../pages/floating_panel_page.dart';

/// Widget for filtering tasks in the floating panel
class TaskFilters extends StatelessWidget {
  final TaskFilter currentFilter;
  final Function(TaskFilter) onFilterChanged;

  const TaskFilters({
    super.key,
    required this.currentFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 44,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  theme.colorScheme.surfaceVariant.withOpacity(0.4),
                  theme.colorScheme.surfaceVariant.withOpacity(0.2),
                ]
              : [
                  theme.colorScheme.surfaceVariant.withOpacity(0.3),
                  theme.colorScheme.surfaceVariant.withOpacity(0.1),
                ],
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: TaskFilter.values.map((filter) {
          final isSelected = filter == currentFilter;

          return Expanded(
            child: GestureDetector(
              onTap: () => onFilterChanged(filter),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [
                            theme.colorScheme.primary,
                            theme.colorScheme.primary.withOpacity(0.8),
                          ],
                        )
                      : null,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: theme.colorScheme.primary.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: isSelected
                            ? BoxDecoration(
                                color: theme.colorScheme.onPrimary.withOpacity(
                                  0.2,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              )
                            : null,
                        child: Icon(
                          filter.icon,
                          size: 14,
                          color: isSelected
                              ? theme.colorScheme.onPrimary
                              : _getFilterIconColor(filter, theme),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Flexible(
                        child: AutoSizeText(
                          filter.displayName,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            color: isSelected
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.onSurface.withOpacity(0.7),
                            letterSpacing: isSelected ? 0.2 : 0,
                          ),
                          maxLines: 1,
                          minFontSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getFilterIconColor(TaskFilter filter, ThemeData theme) {
    switch (filter) {
      case TaskFilter.today:
        return Colors.blue;
      case TaskFilter.upcoming:
        return Colors.green;
      case TaskFilter.overdue:
        return Colors.red;
      case TaskFilter.all:
        return theme.colorScheme.onSurface.withOpacity(0.6);
    }
  }
}

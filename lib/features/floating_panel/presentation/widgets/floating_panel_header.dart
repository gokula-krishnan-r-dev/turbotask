import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbotask/features/floating_panel/presentation/widgets/project_selector.dart';
import 'package:turbotask/features/projects/presentation/bloc/projects_bloc.dart';

/// Header widget for the floating panel with controls
class FloatingPanelHeader extends StatefulWidget {
  final VoidCallback onSettingsPressed;
  final VoidCallback onClosePressed;
  final String? selectedProjectId;
  final Function(String?) onProjectSelected;

  const FloatingPanelHeader({
    super.key,
    required this.onSettingsPressed,
    required this.onClosePressed,
    this.selectedProjectId,
    required this.onProjectSelected,
  });

  @override
  State<FloatingPanelHeader> createState() => _FloatingPanelHeaderState();
}

class _FloatingPanelHeaderState extends State<FloatingPanelHeader> {
  String? _selectedProjectId;

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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 36,
              padding: const EdgeInsets.only(right: 8),
              child: ProjectSelector(
                projects: context.read<ProjectsBloc>().state.projects,
                selectedProjectId: _selectedProjectId,
                onProjectSelected: (projectId) {
                  setState(() {
                    _selectedProjectId = projectId;
                  });
                  widget.onProjectSelected(projectId);
                },
              ),
            ),
            // Enhanced Title with subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'TurboTask Today',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.onSurface,
                      letterSpacing: 0.2,
                    ),
                    maxLines: 1,
                    minFontSize: 14,
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
                      onTap: widget.onSettingsPressed,
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
                      onTap: widget.onClosePressed,
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

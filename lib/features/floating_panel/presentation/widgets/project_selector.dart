import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../projects/domain/entities/project.dart';

/// Widget for selecting project in the floating panel
class ProjectSelector extends StatelessWidget {
  final List<Project> projects;
  final String? selectedProjectId;
  final Function(String) onProjectSelected;

  const ProjectSelector({
    super.key,
    required this.projects,
    required this.selectedProjectId,
    required this.onProjectSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (projects.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              Icons.folder_off_outlined,
              size: 20,
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AutoSizeText(
                'No projects available',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
                maxLines: 1,
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.outline.withOpacity(0.1)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedProjectId ?? projects.first.id,
          isExpanded: true,
          icon: Icon(
            Icons.expand_more,
            color: theme.colorScheme.onSurface.withOpacity(0.7),
          ),
          borderRadius: BorderRadius.circular(12),
          dropdownColor: theme.colorScheme.surface,
          elevation: 8,
          onChanged: (String? newValue) {
            if (newValue != null) {
              onProjectSelected(newValue);
            }
          },
          selectedItemBuilder: (BuildContext context) {
            return projects.map<Widget>((Project project) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    // Project color indicator
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _parseColor(project.colorTheme),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Project info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AutoSizeText(
                            project.title,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            minFontSize: 12,
                          ),
                          if (project.taskCount > 0) ...[
                            const SizedBox(height: 2),
                            AutoSizeText(
                              '${project.completedTaskCount}/${project.taskCount} tasks',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.6,
                                ),
                              ),
                              maxLines: 1,
                              minFontSize: 10,
                            ),
                          ],
                        ],
                      ),
                    ),

                    // Progress indicator
                    if (project.taskCount > 0)
                      Container(
                        width: 32,
                        height: 6,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.outline.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: project.completionPercentage / 100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: _parseColor(project.colorTheme),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }).toList();
          },
          items: projects.map<DropdownMenuItem<String>>((Project project) {
            return DropdownMenuItem<String>(
              value: project.id,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    // Project color indicator
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: _parseColor(project.colorTheme),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Project info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AutoSizeText(
                            project.title,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            minFontSize: 12,
                          ),
                          if (project.description.isNotEmpty) ...[
                            const SizedBox(height: 2),
                            AutoSizeText(
                              project.description,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.6,
                                ),
                              ),
                              maxLines: 1,
                              minFontSize: 10,
                            ),
                          ],
                          if (project.taskCount > 0) ...[
                            const SizedBox(height: 4),
                            AutoSizeText(
                              '${project.completedTaskCount}/${project.taskCount} tasks • ${project.completionPercentage.toInt()}%',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.onSurface.withOpacity(
                                  0.6,
                                ),
                              ),
                              maxLines: 1,
                              minFontSize: 10,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Color _parseColor(String colorString) {
    try {
      return Color(int.parse(colorString.replaceFirst('#', '0xFF')));
    } catch (e) {
      return const Color(0xFF8DE0C8); // Default color
    }
  }
}

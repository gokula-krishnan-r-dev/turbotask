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
      height: 36,
      width: 100,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value:
              (selectedProjectId != null &&
                  projects.any((p) => p.id == selectedProjectId))
              ? selectedProjectId
              : projects.first.id,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: theme.colorScheme.primary,
            size: 18,
          ),
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(8),
          dropdownColor: theme.colorScheme.surface,
          elevation: 2,
          onChanged: (String? newValue) {
            if (newValue != null) {
              onProjectSelected(newValue);
            }
          },
          selectedItemBuilder: (BuildContext context) {
            return projects.map<Widget>((Project project) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 0,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Project title
                    Flexible(
                      child: Text(
                        project.title,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.primary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
                child: Row(
                  children: [
                    // Project info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            project.title,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
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
}

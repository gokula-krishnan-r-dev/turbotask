import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_utils.dart';
import '../../domain/entities/create_project_request.dart';
import '../bloc/projects_bloc.dart';
import '../bloc/projects_event.dart';
import '../bloc/projects_state.dart';

/// Modal for creating new projects with beautiful form design
class CreateProjectModal extends StatefulWidget {
  const CreateProjectModal({super.key});

  @override
  State<CreateProjectModal> createState() => _CreateProjectModalState();
}

class _CreateProjectModalState extends State<CreateProjectModal> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  String _selectedCategory = 'work';
  Color _selectedColor = AppColors.mint;

  static const List<String> _categories = [
    'work',
    'personal',
    'health',
    'education',
    'finance',
    'hobby',
    'travel',
    'other',
  ];

  static final List<Color> _colors = [
    AppColors.mint,
    AppColors.teal,
    AppColors.gray500,
    const Color(0xFF9B59B6), // Purple
    const Color(0xFFE74C3C), // Red
    const Color(0xFFF39C12), // Orange
    const Color(0xFF3498DB), // Blue
    const Color(0xFF1ABC9C), // Turquoise
    const Color(0xFFE67E22), // Carrot
    const Color(0xFF34495E), // Dark Blue
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return BlocListener<ProjectsBloc, ProjectsState>(
      listener: (context, state) {
        if (state.status == ProjectsStatus.created) {
          // Dismiss the modal when project is created successfully
          Navigator.of(context).pop();
        } else if (state.hasError && state.errorMessage != null) {
          // Show error message as snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.all(isDesktop ? 40 : 16),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isDesktop ? 500 : double.infinity,
            maxHeight: MediaQuery.of(context).size.height * 0.9,
          ),
          decoration: BoxDecoration(
            color: theme.dialogBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: theme.dividerColor.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.mint.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.add_box_outlined,
                        color: AppColors.mint,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Create New Project',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                      style: IconButton.styleFrom(
                        backgroundColor: theme.dividerColor.withValues(
                          alpha: 0.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Form content
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Project title
                        _buildInputLabel('Project Title'),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _titleController,
                          decoration: _buildInputDecoration(
                            'Enter project title',
                            Icons.title,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a project title';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Project description
                        _buildInputLabel('Description'),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _descriptionController,
                          maxLines: 3,
                          decoration: _buildInputDecoration(
                            'Describe your project...',
                            Icons.description,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a project description';
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Category selection
                        _buildInputLabel('Category'),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.dividerColor.withValues(alpha: 0.3),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedCategory,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: _categories.map((category) {
                                return DropdownMenuItem(
                                  value: category,
                                  child: Row(
                                    children: [
                                      Icon(
                                        _getCategoryIcon(category),
                                        size: 20,
                                        color: theme.iconTheme.color
                                            ?.withValues(alpha: 0.7),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        _formatCategoryName(category),
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() {
                                    _selectedCategory = value;
                                  });
                                }
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Color selection
                        _buildInputLabel('Color Theme'),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.dividerColor.withValues(alpha: 0.3),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: _colors.map((color) {
                              final isSelected = color == _selectedColor;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedColor = color;
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.circle,
                                    border: isSelected
                                        ? Border.all(
                                            color: theme.colorScheme.onSurface,
                                            width: 3,
                                          )
                                        : null,
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              color: color.withValues(
                                                alpha: 0.3,
                                              ),
                                              blurRadius: 8,
                                              spreadRadius: 2,
                                            ),
                                          ]
                                        : null,
                                  ),
                                  child: isSelected
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 20,
                                        )
                                      : null,
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Create button
                        BlocBuilder<ProjectsBloc, ProjectsState>(
                          buildWhen: (previous, current) =>
                              previous.isCreating != current.isCreating,
                          builder: (context, state) {
                            return SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: FilledButton(
                                onPressed: state.isCreating
                                    ? null
                                    : _createProject,
                                style: FilledButton.styleFrom(
                                  backgroundColor: AppColors.mint,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: state.isCreating
                                    ? const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    Colors.white,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Text('Creating Project...'),
                                        ],
                                      )
                                    : const Text(
                                        'Create Project',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
    );
  }

  InputDecoration _buildInputDecoration(String hint, IconData icon) {
    final theme = Theme.of(context);

    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(
        icon,
        color: theme.iconTheme.color?.withValues(alpha: 0.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: theme.dividerColor.withValues(alpha: 0.3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: theme.dividerColor.withValues(alpha: 0.3),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.mint, width: 2),
      ),
      filled: true,
      fillColor: theme.inputDecorationTheme.fillColor?.withValues(alpha: 0.5),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'work':
        return Icons.work_outline;
      case 'personal':
        return Icons.person_outline;
      case 'health':
        return Icons.favorite_outline;
      case 'education':
        return Icons.school_outlined;
      case 'finance':
        return Icons.account_balance_wallet_outlined;
      case 'hobby':
        return Icons.palette_outlined;
      case 'travel':
        return Icons.flight_outlined;
      default:
        return Icons.folder_outlined;
    }
  }

  String _formatCategoryName(String category) {
    return category.substring(0, 1).toUpperCase() + category.substring(1);
  }

  void _createProject() {
    if (_formKey.currentState?.validate() ?? false) {
      final request = CreateProjectRequest(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        category: _selectedCategory,
        colorTheme: '#${_selectedColor.value.toRadixString(16).substring(2)}',
      );

      context.read<ProjectsBloc>().add(ProjectsEvent.createProject(request));
    }
  }
}

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

class _CreateProjectModalState extends State<CreateProjectModal>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

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
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();

    // Auto-focus title field after a short delay
    Future.delayed(const Duration(milliseconds: 400), () {
      if (mounted) {
        _titleFocusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return BlocListener<ProjectsBloc, ProjectsState>(
      listener: (context, state) {
        if (state.status == ProjectsStatus.created) {
          // Add a subtle delay for better UX
          Future.delayed(const Duration(milliseconds: 300), () {
            if (mounted) {
              Navigator.of(context).pop();
            }
          });
        } else if (state.hasError && state.errorMessage != null) {
          // Show error message as snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      state.errorMessage!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColors.error,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              margin: const EdgeInsets.all(16),
              duration: const Duration(seconds: 4),
            ),
          );
        }
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Opacity(
              opacity: _fadeAnimation.value,
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
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 30,
                        offset: const Offset(0, 15),
                      ),
                      BoxShadow(
                        color: AppColors.mint.withValues(alpha: 0.1),
                        blurRadius: 40,
                        offset: const Offset(0, 5),
                      ),
                    ],
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
                                _buildInputLabel('Project Title', '✨'),
                                const SizedBox(height: 12),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.mint.withValues(
                                          alpha: 0.1,
                                        ),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    controller: _titleController,
                                    focusNode: _titleFocusNode,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (value) {
                                      // Only move to description, don't submit form
                                      if (value.trim().isNotEmpty &&
                                          value.trim().length >= 3) {
                                        _descriptionFocusNode.requestFocus();
                                      }
                                    },
                                    decoration: _buildInputDecoration(
                                      'Enter your amazing project title...',
                                      Icons.lightbulb_outline,
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter a project title';
                                      }
                                      if (value.trim().length < 3) {
                                        return 'Title must be at least 3 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Project description
                                _buildInputLabel('Description', '📝'),
                                const SizedBox(height: 12),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.mint.withValues(
                                          alpha: 0.1,
                                        ),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    controller: _descriptionController,
                                    focusNode: _descriptionFocusNode,
                                    maxLines: 4,
                                    textInputAction: TextInputAction.newline,
                                    onFieldSubmitted: (value) {
                                      // Only submit if description is valid
                                      if (value.trim().isNotEmpty &&
                                          value.trim().length >= 10) {
                                        _createProject();
                                      }
                                    },
                                    decoration: _buildInputDecoration(
                                      'What makes this project special? Share your vision...\n\nTip: Press Enter here to create project instantly!',
                                      Icons.auto_awesome_outlined,
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please describe your project';
                                      }
                                      if (value.trim().length < 10) {
                                        return 'Description should be at least 10 characters';
                                      }
                                      return null;
                                    },
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Category selection
                                _buildInputLabel('Category', '📁'),
                                const SizedBox(height: 12),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: theme.dividerColor.withValues(
                                        alpha: 0.3,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _selectedCategory,
                                      isExpanded: true,
                                      icon: const Icon(
                                        Icons.keyboard_arrow_down,
                                      ),
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
                                                style:
                                                    theme.textTheme.bodyMedium,
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
                                _buildInputLabel('Color Theme', '🎨'),
                                const SizedBox(height: 12),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: theme.dividerColor.withValues(
                                        alpha: 0.3,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Wrap(
                                    spacing: 16,
                                    runSpacing: 16,
                                    children: _colors.map((color) {
                                      final isSelected =
                                          color == _selectedColor;
                                      return TweenAnimationBuilder<double>(
                                        duration: const Duration(
                                          milliseconds: 200,
                                        ),
                                        tween: Tween(
                                          begin: 0.0,
                                          end: isSelected ? 1.0 : 0.0,
                                        ),
                                        builder: (context, value, child) {
                                          return Transform.scale(
                                            scale: 1.0 + (value * 0.1),
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selectedColor = color;
                                                });
                                              },
                                              child: Container(
                                                width: 45,
                                                height: 45,
                                                decoration: BoxDecoration(
                                                  color: color,
                                                  shape: BoxShape.circle,
                                                  border: isSelected
                                                      ? Border.all(
                                                          color: theme
                                                              .colorScheme
                                                              .onSurface,
                                                          width: 3,
                                                        )
                                                      : Border.all(
                                                          color: color
                                                              .withValues(
                                                                alpha: 0.3,
                                                              ),
                                                          width: 2,
                                                        ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: color.withValues(
                                                        alpha: isSelected
                                                            ? 0.4
                                                            : 0.2,
                                                      ),
                                                      blurRadius: isSelected
                                                          ? 12
                                                          : 6,
                                                      spreadRadius: isSelected
                                                          ? 3
                                                          : 1,
                                                    ),
                                                  ],
                                                ),
                                                child: isSelected
                                                    ? Icon(
                                                        Icons.check_rounded,
                                                        color: Colors.white,
                                                        size: 22,
                                                        shadows: [
                                                          Shadow(
                                                            color: Colors.black
                                                                .withValues(
                                                                  alpha: 0.3,
                                                                ),
                                                            blurRadius: 2,
                                                          ),
                                                        ],
                                                      )
                                                    : null,
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),

                                const SizedBox(height: 40),

                                // Quick tips
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppColors.mint.withValues(
                                      alpha: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColors.mint.withValues(
                                        alpha: 0.2,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.tips_and_updates_outlined,
                                        color: AppColors.mint,
                                        size: 20,
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          '💡 Pro tip: Enter in title moves to description, Enter in description creates project!',
                                          style: theme.textTheme.bodySmall
                                              ?.copyWith(
                                                color: AppColors.mint,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // Create button
                                BlocBuilder<ProjectsBloc, ProjectsState>(
                                  buildWhen: (previous, current) =>
                                      previous.isCreating != current.isCreating,
                                  builder: (context, state) {
                                    return SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            16,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.mint.withValues(
                                                alpha: 0.3,
                                              ),
                                              blurRadius: 15,
                                              offset: const Offset(0, 8),
                                            ),
                                          ],
                                        ),
                                        child: FilledButton(
                                          onPressed: state.isCreating
                                              ? null
                                              : _createProject,
                                          style: FilledButton.styleFrom(
                                            backgroundColor: AppColors.mint,
                                            foregroundColor: Colors.black,
                                            disabledBackgroundColor: AppColors
                                                .mint
                                                .withValues(alpha: 0.6),
                                            elevation: 0,
                                            shadowColor: Colors.transparent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ),
                                          child: state.isCreating
                                              ? Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(
                                                      width: 22,
                                                      height: 22,
                                                      child: CircularProgressIndicator(
                                                        strokeWidth: 2.5,
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                              Color
                                                            >(
                                                              Colors.black
                                                                  .withValues(
                                                                    alpha: 0.8,
                                                                  ),
                                                            ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 14),
                                                    Text(
                                                      'Creating Magic...',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black
                                                            .withValues(
                                                              alpha: 0.8,
                                                            ),
                                                        letterSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : const Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .rocket_launch_rounded,
                                                      size: 22,
                                                    ),
                                                    SizedBox(width: 12),
                                                    Text(
                                                      'Create Project',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        letterSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ],
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
            ),
          );
        },
      ),
    );
  }

  Widget _buildInputLabel(String label, String emoji) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 8),
        Text(
          label,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.brightness == Brightness.dark
                ? Colors.white.withValues(alpha: 0.9)
                : Colors.black.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 2,
          width: 30,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.mint.withValues(alpha: 0.6),
                AppColors.mint.withValues(alpha: 0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration(String hint, IconData icon) {
    final theme = Theme.of(context);

    return InputDecoration(
      hintText: hint,
      hintStyle: theme.textTheme.bodyMedium?.copyWith(
        color: theme.textTheme.bodyMedium?.color?.withValues(alpha: 0.6),
        fontSize: 14,
      ),
      prefixIcon: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.mint.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.mint, size: 20),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: theme.dividerColor.withValues(alpha: 0.2),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: theme.dividerColor.withValues(alpha: 0.2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: AppColors.mint, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      filled: true,
      fillColor: theme.brightness == Brightness.dark
          ? Colors.white.withValues(alpha: 0.05)
          : Colors.black.withValues(alpha: 0.02),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
      // Unfocus all fields to hide keyboard
      FocusScope.of(context).unfocus();

      final request = CreateProjectRequest(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        category: _selectedCategory,
        colorTheme: '#${_selectedColor.value.toRadixString(16).substring(2)}',
      );

      context.read<ProjectsBloc>().add(ProjectsEvent.createProject(request));
    } else {
      // If validation fails, focus on the first error field
      if (_titleController.text.trim().isEmpty ||
          _titleController.text.trim().length < 3) {
        _titleFocusNode.requestFocus();
      } else if (_descriptionController.text.trim().isEmpty ||
          _descriptionController.text.trim().length < 10) {
        _descriptionFocusNode.requestFocus();
      }
    }
  }
}

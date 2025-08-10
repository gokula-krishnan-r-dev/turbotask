import 'package:equatable/equatable.dart';

/// Project entity representing a user's project.
/// This is the core domain model for project data.
class Project extends Equatable {
  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.colorTheme,
    this.imageUrl,
    this.isFavorite = false,
    this.isArchived = false,
    this.taskCount = 0,
    this.completedTaskCount = 0,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final String colorTheme;
  final String? imageUrl;
  final bool isFavorite;
  final bool isArchived;
  final int taskCount;
  final int completedTaskCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Calculate completion percentage
  double get completionPercentage {
    if (taskCount == 0) return 0.0;
    return (completedTaskCount / taskCount) * 100;
  }

  /// Get remaining task count
  int get remainingTaskCount => taskCount - completedTaskCount;

  /// Check if project is completed
  bool get isCompleted => taskCount > 0 && completedTaskCount == taskCount;

  /// Create a copy of project with updated fields
  Project copyWith({
    String? id,
    String? title,
    String? description,
    String? category,
    String? colorTheme,
    String? imageUrl,
    bool? isFavorite,
    bool? isArchived,
    int? taskCount,
    int? completedTaskCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Project(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      colorTheme: colorTheme ?? this.colorTheme,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      isArchived: isArchived ?? this.isArchived,
      taskCount: taskCount ?? this.taskCount,
      completedTaskCount: completedTaskCount ?? this.completedTaskCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    category,
    colorTheme,
    imageUrl,
    isFavorite,
    isArchived,
    taskCount,
    completedTaskCount,
    createdAt,
    updatedAt,
  ];

  @override
  String toString() {
    return 'Project(id: $id, title: $title, category: $category, taskCount: $taskCount)';
  }
}

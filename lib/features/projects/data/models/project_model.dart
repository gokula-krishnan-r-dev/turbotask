import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/project.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

/// Data model for Project entity with JSON serialization.
/// Converts between API responses and domain entities.
@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    required String title,
    @Default('No description') String description,
    @Default('work') String category,
    @JsonKey(name: 'color_theme') @Default('#8DE0C8') String colorTheme,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'is_favorite') @Default(false) bool isFavorite,
    @JsonKey(name: 'is_archived') @Default(false) bool isArchived,
    @JsonKey(name: 'progress_percentage') @Default(0) int progressPercentage,
    @JsonKey(name: 'todo_count') @Default(0) int todoCount,
    @JsonKey(name: 'completed_count') @Default(0) int completedCount,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _ProjectModel;

  const ProjectModel._();

  /// Create ProjectModel from JSON
  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);

  /// Convert to domain entity
  Project toDomain() {
    return Project(
      id: id,
      title: title,
      description: description,
      category: category,
      colorTheme: colorTheme,
      imageUrl: imageUrl,
      isFavorite: isFavorite,
      isArchived: isArchived,
      taskCount: todoCount,
      completedTaskCount: completedCount,
      createdAt: createdAt != null
          ? DateTime.parse(createdAt!)
          : DateTime.now(),
      updatedAt: updatedAt != null
          ? DateTime.parse(updatedAt!)
          : DateTime.now(),
    );
  }

  /// Create from domain entity
  factory ProjectModel.fromDomain(Project project) {
    return ProjectModel(
      id: project.id,
      title: project.title,
      description: project.description,
      category: project.category,
      colorTheme: project.colorTheme,
      imageUrl: project.imageUrl,
      isFavorite: project.isFavorite,
      isArchived: project.isArchived,
      todoCount: project.taskCount,
      completedCount: project.completedTaskCount,
      progressPercentage: project.completionPercentage.round(),
      createdAt: project.createdAt.toIso8601String(),
      updatedAt: project.updatedAt.toIso8601String(),
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String? ?? 'No description',
      category: json['category'] as String? ?? 'work',
      colorTheme: json['color_theme'] as String? ?? '#8DE0C8',
      imageUrl: json['image_url'] as String?,
      isFavorite: json['is_favorite'] as bool? ?? false,
      isArchived: json['is_archived'] as bool? ?? false,
      progressPercentage: (json['progress_percentage'] as num?)?.toInt() ?? 0,
      todoCount: (json['todo_count'] as num?)?.toInt() ?? 0,
      completedCount: (json['completed_count'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'color_theme': instance.colorTheme,
      'image_url': instance.imageUrl,
      'is_favorite': instance.isFavorite,
      'is_archived': instance.isArchived,
      'progress_percentage': instance.progressPercentage,
      'todo_count': instance.todoCount,
      'completed_count': instance.completedCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

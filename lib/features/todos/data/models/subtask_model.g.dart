// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subtask_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubtaskModelImpl _$$SubtaskModelImplFromJson(Map<String, dynamic> json) =>
    _$SubtaskModelImpl(
      id: json['id'] as String,
      todoId: json['todo_id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      status: json['status'] as String? ?? 'todo',
      priority: json['priority'] as String? ?? 'medium',
      estimatedTime: (json['estimated_time'] as num?)?.toInt(),
      actualTime: (json['actual_time'] as num?)?.toInt(),
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
      isArchived: json['is_archived'] as bool? ?? false,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      completedAt: json['completed_at'] as String?,
      assignedUserId: json['assigned_user_id'] as String?,
    );

Map<String, dynamic> _$$SubtaskModelImplToJson(_$SubtaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todo_id': instance.todoId,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'priority': instance.priority,
      'estimated_time': instance.estimatedTime,
      'actual_time': instance.actualTime,
      'sort_order': instance.sortOrder,
      'is_archived': instance.isArchived,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'completed_at': instance.completedAt,
      'assigned_user_id': instance.assignedUserId,
    };

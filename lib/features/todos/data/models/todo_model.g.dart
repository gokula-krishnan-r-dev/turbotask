// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      id: json['id'] as String,
      projectId: json['project_id'] as String,
      taskName: json['task_name'] as String,
      taskDescription: json['task_description'] as String,
      status: json['status'] as String? ?? 'todo',
      priority: json['priority'] as String? ?? 'medium',
      estimatedTime: (json['estimated_time'] as num?)?.toInt(),
      timeUnit: json['time_unit'] as String? ?? 'minutes',
      actualTime: (json['actual_time'] as num?)?.toInt(),
      dueDate: json['due_date'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      difficultyRating: (json['difficulty_rating'] as num?)?.toInt(),
      energyLevelRequired: (json['energy_level_required'] as num?)?.toInt(),
      context: json['context'] as String?,
      isPinned: json['is_pinned'] as bool? ?? false,
      isArchived: json['is_archived'] as bool? ?? false,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      completedAt: json['completed_at'] as String?,
      assignedUserId: json['assigned_user_id'] as String?,
      parentTodoId: json['parent_todo_id'] as String?,
      subtaskCount: (json['subtask_count'] as num?)?.toInt() ?? 0,
      completedSubtaskCount:
          (json['completed_subtask_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project_id': instance.projectId,
      'task_name': instance.taskName,
      'task_description': instance.taskDescription,
      'status': instance.status,
      'priority': instance.priority,
      'estimated_time': instance.estimatedTime,
      'time_unit': instance.timeUnit,
      'actual_time': instance.actualTime,
      'due_date': instance.dueDate,
      'tags': instance.tags,
      'difficulty_rating': instance.difficultyRating,
      'energy_level_required': instance.energyLevelRequired,
      'context': instance.context,
      'is_pinned': instance.isPinned,
      'is_archived': instance.isArchived,
      'sort_order': instance.sortOrder,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'completed_at': instance.completedAt,
      'assigned_user_id': instance.assignedUserId,
      'parent_todo_id': instance.parentTodoId,
      'subtask_count': instance.subtaskCount,
      'completed_subtask_count': instance.completedSubtaskCount,
    };

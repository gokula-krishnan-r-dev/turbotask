// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_todo_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateTodoRequestModelImpl _$$CreateTodoRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreateTodoRequestModelImpl(
  projectId: json['project_id'] as String,
  taskName: json['task_name'] as String,
  taskDescription: json['task_description'] as String,
  priority: json['priority'] as String? ?? 'medium',
  estimatedTime: (json['estimated_time'] as num?)?.toInt(),
  timeUnit: json['time_unit'] as String? ?? 'minutes',
  dueDate: json['due_date'] as String?,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  difficultyRating: (json['difficulty_rating'] as num?)?.toInt(),
  energyLevelRequired: (json['energy_level_required'] as num?)?.toInt(),
  context: json['context'] as String?,
  assignedUserId: json['assigned_user_id'] as String?,
  status: json['status'] as String? ?? 'backlog',
);

Map<String, dynamic> _$$CreateTodoRequestModelImplToJson(
  _$CreateTodoRequestModelImpl instance,
) => <String, dynamic>{
  'project_id': instance.projectId,
  'task_name': instance.taskName,
  'task_description': instance.taskDescription,
  'priority': instance.priority,
  'estimated_time': instance.estimatedTime,
  'time_unit': instance.timeUnit,
  'due_date': instance.dueDate,
  'tags': instance.tags,
  'difficulty_rating': instance.difficultyRating,
  'energy_level_required': instance.energyLevelRequired,
  'context': instance.context,
  'assigned_user_id': instance.assignedUserId,
  'status': instance.status,
};

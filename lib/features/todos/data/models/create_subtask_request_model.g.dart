// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_subtask_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateSubtaskRequestModelImpl _$$CreateSubtaskRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreateSubtaskRequestModelImpl(
  name: json['name'] as String,
  description: json['description'] as String,
  priority: json['priority'] as String? ?? 'medium',
  estimatedTime: (json['estimated_time'] as num?)?.toInt(),
  sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$$CreateSubtaskRequestModelImplToJson(
  _$CreateSubtaskRequestModelImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'priority': instance.priority,
  'estimated_time': instance.estimatedTime,
  'sort_order': instance.sortOrder,
};

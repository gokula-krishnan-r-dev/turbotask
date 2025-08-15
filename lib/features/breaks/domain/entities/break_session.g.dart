// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'break_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BreakSessionImpl _$$BreakSessionImplFromJson(Map<String, dynamic> json) =>
    _$BreakSessionImpl(
      id: json['id'] as String,
      todoId: json['todoId'] as String,
      projectId: json['projectId'] as String,
      userId: json['userId'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      duration: (json['duration'] as num).toInt(),
      breakType: json['breakType'] as String? ?? 'manual',
      notes: json['notes'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BreakSessionImplToJson(_$BreakSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'todoId': instance.todoId,
      'projectId': instance.projectId,
      'userId': instance.userId,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'duration': instance.duration,
      'breakType': instance.breakType,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

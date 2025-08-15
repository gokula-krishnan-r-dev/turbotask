// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'break_request_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartBreakRequestImpl _$$StartBreakRequestImplFromJson(
  Map<String, dynamic> json,
) => _$StartBreakRequestImpl(
  todoId: json['todoId'] as String,
  projectId: json['projectId'] as String,
  breakType: json['breakType'] as String? ?? 'manual',
  notes: json['notes'] as String? ?? '',
);

Map<String, dynamic> _$$StartBreakRequestImplToJson(
  _$StartBreakRequestImpl instance,
) => <String, dynamic>{
  'todoId': instance.todoId,
  'projectId': instance.projectId,
  'breakType': instance.breakType,
  'notes': instance.notes,
};

_$StopBreakRequestImpl _$$StopBreakRequestImplFromJson(
  Map<String, dynamic> json,
) => _$StopBreakRequestImpl(notes: json['notes'] as String? ?? '');

Map<String, dynamic> _$$StopBreakRequestImplToJson(
  _$StopBreakRequestImpl instance,
) => <String, dynamic>{'notes': instance.notes};

_$BreakApiResponseImpl _$$BreakApiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BreakApiResponseImpl(data: json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$$BreakApiResponseImplToJson(
  _$BreakApiResponseImpl instance,
) => <String, dynamic>{'data': instance.data};

_$BreakListApiResponseImpl _$$BreakListApiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BreakListApiResponseImpl(
  data: (json['data'] as List<dynamic>)
      .map((e) => e as Map<String, dynamic>)
      .toList(),
);

Map<String, dynamic> _$$BreakListApiResponseImplToJson(
  _$BreakListApiResponseImpl instance,
) => <String, dynamic>{'data': instance.data};

_$BreakStatsApiResponseImpl _$$BreakStatsApiResponseImplFromJson(
  Map<String, dynamic> json,
) => _$BreakStatsApiResponseImpl(data: json['data'] as Map<String, dynamic>);

Map<String, dynamic> _$$BreakStatsApiResponseImplToJson(
  _$BreakStatsApiResponseImpl instance,
) => <String, dynamic>{'data': instance.data};

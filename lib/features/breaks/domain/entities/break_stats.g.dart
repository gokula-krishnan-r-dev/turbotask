// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'break_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BreakStatsImpl _$$BreakStatsImplFromJson(Map<String, dynamic> json) =>
    _$BreakStatsImpl(
      totalBreaks: (json['totalBreaks'] as num).toInt(),
      totalDuration: (json['totalDuration'] as num).toInt(),
      averageDuration: (json['averageDuration'] as num).toDouble(),
      todayBreaks: (json['todayBreaks'] as num).toInt(),
      todayDuration: (json['todayDuration'] as num).toInt(),
      thisWeekBreaks: (json['thisWeekBreaks'] as num).toInt(),
      thisWeekDuration: (json['thisWeekDuration'] as num).toInt(),
      currentActiveBreak: json['currentActiveBreak'] == null
          ? null
          : BreakSession.fromJson(
              json['currentActiveBreak'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$$BreakStatsImplToJson(_$BreakStatsImpl instance) =>
    <String, dynamic>{
      'totalBreaks': instance.totalBreaks,
      'totalDuration': instance.totalDuration,
      'averageDuration': instance.averageDuration,
      'todayBreaks': instance.todayBreaks,
      'todayDuration': instance.todayDuration,
      'thisWeekBreaks': instance.thisWeekBreaks,
      'thisWeekDuration': instance.thisWeekDuration,
      'currentActiveBreak': instance.currentActiveBreak,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectStatsModelImpl _$$ProjectStatsModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectStatsModelImpl(
  totalProjects: (json['total_projects'] as num).toInt(),
  activeProjects: (json['active_projects'] as num).toInt(),
  archivedProjects: (json['archived_projects'] as num).toInt(),
  favoriteProjects: (json['favorite_projects'] as num).toInt(),
  totalTasks: (json['total_tasks'] as num).toInt(),
  completedTasks: (json['completed_tasks'] as num).toInt(),
  pendingTasks: (json['pending_tasks'] as num).toInt(),
  completionRate: (json['completion_rate'] as num).toDouble(),
  categoryBreakdown: Map<String, int>.from(json['category_breakdown'] as Map),
);

Map<String, dynamic> _$$ProjectStatsModelImplToJson(
  _$ProjectStatsModelImpl instance,
) => <String, dynamic>{
  'total_projects': instance.totalProjects,
  'active_projects': instance.activeProjects,
  'archived_projects': instance.archivedProjects,
  'favorite_projects': instance.favoriteProjects,
  'total_tasks': instance.totalTasks,
  'completed_tasks': instance.completedTasks,
  'pending_tasks': instance.pendingTasks,
  'completion_rate': instance.completionRate,
  'category_breakdown': instance.categoryBreakdown,
};

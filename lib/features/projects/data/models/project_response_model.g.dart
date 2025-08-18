// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectResponseModelImpl _$$ProjectResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectResponseModelImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : ProjectModel.fromJson(json['data'] as Map<String, dynamic>),
  projects: (json['projects'] as List<dynamic>?)
      ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  stats: json['stats'] == null
      ? null
      : ProjectStatsModel.fromJson(json['stats'] as Map<String, dynamic>),
  totalCount: (json['total_count'] as num?)?.toInt(),
  currentPage: (json['current_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ProjectResponseModelImplToJson(
  _$ProjectResponseModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'projects': instance.projects,
  'stats': instance.stats,
  'total_count': instance.totalCount,
  'current_page': instance.currentPage,
  'per_page': instance.perPage,
  'last_page': instance.lastPage,
};

_$ProjectListResponseModelImpl _$$ProjectListResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectListResponseModelImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num?)?.toInt(),
  currentPage: (json['current_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ProjectListResponseModelImplToJson(
  _$ProjectListResponseModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'total_count': instance.totalCount,
  'current_page': instance.currentPage,
  'per_page': instance.perPage,
  'last_page': instance.lastPage,
};

_$ProjectStatsResponseModelImpl _$$ProjectStatsResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$ProjectStatsResponseModelImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: ProjectStatsModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$ProjectStatsResponseModelImplToJson(
  _$ProjectStatsResponseModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'export_import_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExportProjectResponseImpl _$$ExportProjectResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ExportProjectResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  downloadUrl: json['downloadUrl'] as String?,
  fileName: json['fileName'] as String?,
  fileSize: (json['fileSize'] as num?)?.toInt(),
);

Map<String, dynamic> _$$ExportProjectResponseImplToJson(
  _$ExportProjectResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'downloadUrl': instance.downloadUrl,
  'fileName': instance.fileName,
  'fileSize': instance.fileSize,
};

_$ImportProjectResponseImpl _$$ImportProjectResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ImportProjectResponseImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  statistics: json['statistics'] == null
      ? null
      : ImportStatistics.fromJson(json['statistics'] as Map<String, dynamic>),
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  warnings: (json['warnings'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$ImportProjectResponseImplToJson(
  _$ImportProjectResponseImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'statistics': instance.statistics,
  'errors': instance.errors,
  'warnings': instance.warnings,
};

_$ImportStatisticsImpl _$$ImportStatisticsImplFromJson(
  Map<String, dynamic> json,
) => _$ImportStatisticsImpl(
  totalRecords: (json['totalRecords'] as num?)?.toInt() ?? 0,
  successfulImports: (json['successfulImports'] as num?)?.toInt() ?? 0,
  failedImports: (json['failedImports'] as num?)?.toInt() ?? 0,
  skippedRecords: (json['skippedRecords'] as num?)?.toInt() ?? 0,
  duplicatesFound: (json['duplicatesFound'] as num?)?.toInt() ?? 0,
  categoryBreakdown: (json['categoryBreakdown'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toInt()),
  ),
);

Map<String, dynamic> _$$ImportStatisticsImplToJson(
  _$ImportStatisticsImpl instance,
) => <String, dynamic>{
  'totalRecords': instance.totalRecords,
  'successfulImports': instance.successfulImports,
  'failedImports': instance.failedImports,
  'skippedRecords': instance.skippedRecords,
  'duplicatesFound': instance.duplicatesFound,
  'categoryBreakdown': instance.categoryBreakdown,
};

_$CsvTaskDataImpl _$$CsvTaskDataImplFromJson(Map<String, dynamic> json) =>
    _$CsvTaskDataImpl(
      taskName: json['taskName'] as String,
      taskDescription: json['taskDescription'] as String?,
      status: json['status'] as String?,
      priority: json['priority'] as String?,
      dueDate: json['dueDate'] as String?,
      startDate: json['startDate'] as String?,
      completedAt: json['completedAt'] as String?,
      tags: json['tags'] as String?,
      estimatedTime: json['estimatedTime'] as String?,
      actualTime: json['actualTime'] as String?,
      assignedTo: json['assignedTo'] as String?,
      location: json['location'] as String?,
      context: json['context'] as String?,
      difficultyRating: json['difficultyRating'] as String?,
      energyLevelRequired: json['energyLevelRequired'] as String?,
      completionPercentage: json['completionPercentage'] as String?,
      isRecurring: json['isRecurring'] as String?,
      isPinned: json['isPinned'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$CsvTaskDataImplToJson(_$CsvTaskDataImpl instance) =>
    <String, dynamic>{
      'taskName': instance.taskName,
      'taskDescription': instance.taskDescription,
      'status': instance.status,
      'priority': instance.priority,
      'dueDate': instance.dueDate,
      'startDate': instance.startDate,
      'completedAt': instance.completedAt,
      'tags': instance.tags,
      'estimatedTime': instance.estimatedTime,
      'actualTime': instance.actualTime,
      'assignedTo': instance.assignedTo,
      'location': instance.location,
      'context': instance.context,
      'difficultyRating': instance.difficultyRating,
      'energyLevelRequired': instance.energyLevelRequired,
      'completionPercentage': instance.completionPercentage,
      'isRecurring': instance.isRecurring,
      'isPinned': instance.isPinned,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$ImportValidationRequestImpl _$$ImportValidationRequestImplFromJson(
  Map<String, dynamic> json,
) => _$ImportValidationRequestImpl(
  projectId: json['projectId'] as String,
  fileName: json['fileName'] as String,
  tasks: (json['tasks'] as List<dynamic>)
      .map((e) => CsvTaskData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ImportValidationRequestImplToJson(
  _$ImportValidationRequestImpl instance,
) => <String, dynamic>{
  'projectId': instance.projectId,
  'fileName': instance.fileName,
  'tasks': instance.tasks,
};

_$ImportValidationResponseImpl _$$ImportValidationResponseImplFromJson(
  Map<String, dynamic> json,
) => _$ImportValidationResponseImpl(
  isValid: json['isValid'] as bool,
  errors: (json['errors'] as List<dynamic>).map((e) => e as String).toList(),
  warnings: (json['warnings'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  previewStatistics: json['previewStatistics'] == null
      ? null
      : ImportStatistics.fromJson(
          json['previewStatistics'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$$ImportValidationResponseImplToJson(
  _$ImportValidationResponseImpl instance,
) => <String, dynamic>{
  'isValid': instance.isValid,
  'errors': instance.errors,
  'warnings': instance.warnings,
  'previewStatistics': instance.previewStatistics,
};

import 'package:freezed_annotation/freezed_annotation.dart';

part 'export_import_models.freezed.dart';
part 'export_import_models.g.dart';

/// Response model for project export operation
@freezed
class ExportProjectResponse with _$ExportProjectResponse {
  const factory ExportProjectResponse({
    required bool success,
    required String message,
    String? downloadUrl,
    String? fileName,
    int? fileSize,
  }) = _ExportProjectResponse;

  factory ExportProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ExportProjectResponseFromJson(json);
}

/// Response model for project import operation
@freezed
class ImportProjectResponse with _$ImportProjectResponse {
  const factory ImportProjectResponse({
    required bool success,
    required String message,
    ImportStatistics? statistics,
    List<String>? errors,
    List<String>? warnings,
  }) = _ImportProjectResponse;

  factory ImportProjectResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportProjectResponseFromJson(json);
}

/// Statistics about the import operation
@freezed
class ImportStatistics with _$ImportStatistics {
  const factory ImportStatistics({
    @Default(0) int totalRecords,
    @Default(0) int successfulImports,
    @Default(0) int failedImports,
    @Default(0) int skippedRecords,
    @Default(0) int duplicatesFound,
    Map<String, int>? categoryBreakdown,
  }) = _ImportStatistics;

  factory ImportStatistics.fromJson(Map<String, dynamic> json) =>
      _$ImportStatisticsFromJson(json);
}

/// Model for CSV task data used in export/import
@freezed
class CsvTaskData with _$CsvTaskData {
  const factory CsvTaskData({
    required String taskName,
    String? taskDescription,
    String? status,
    String? priority,
    String? dueDate,
    String? startDate,
    String? completedAt,
    String? tags,
    String? estimatedTime,
    String? actualTime,
    String? assignedTo,
    String? location,
    String? context,
    String? difficultyRating,
    String? energyLevelRequired,
    String? completionPercentage,
    String? isRecurring,
    String? isPinned,
    String? createdAt,
    String? updatedAt,
  }) = _CsvTaskData;

  factory CsvTaskData.fromJson(Map<String, dynamic> json) =>
      _$CsvTaskDataFromJson(json);

  /// Create CSV task data from a CSV row map
  factory CsvTaskData.fromCsvMap(Map<String, dynamic> csvRow) {
    return CsvTaskData(
      taskName: csvRow['Task Name']?.toString() ?? '',
      taskDescription: csvRow['Description']?.toString(),
      status: csvRow['Status']?.toString(),
      priority: csvRow['Priority']?.toString(),
      dueDate: csvRow['Due Date']?.toString(),
      startDate: csvRow['Start Date']?.toString(),
      completedAt: csvRow['Completed At']?.toString(),
      tags: csvRow['Tags']?.toString(),
      estimatedTime: csvRow['Estimated Time']?.toString(),
      actualTime: csvRow['Actual Time']?.toString(),
      assignedTo: csvRow['Assigned To']?.toString(),
      location: csvRow['Location']?.toString(),
      context: csvRow['Context']?.toString(),
      difficultyRating: csvRow['Difficulty Rating']?.toString(),
      energyLevelRequired: csvRow['Energy Level Required']?.toString(),
      completionPercentage: csvRow['Completion Percentage']?.toString(),
      isRecurring: csvRow['Is Recurring']?.toString(),
      isPinned: csvRow['Is Pinned']?.toString(),
      createdAt: csvRow['Created At']?.toString(),
      updatedAt: csvRow['Updated At']?.toString(),
    );
  }
}

/// Extension methods for CsvTaskData
extension CsvTaskDataExtension on CsvTaskData {
  /// Convert CSV task data to a map for CSV generation
  Map<String, dynamic> toCSvMap() {
    return {
      'Task Name': taskName,
      'Description': taskDescription ?? '',
      'Status': status ?? '',
      'Priority': priority ?? '',
      'Due Date': dueDate ?? '',
      'Start Date': startDate ?? '',
      'Completed At': completedAt ?? '',
      'Tags': tags ?? '',
      'Estimated Time': estimatedTime ?? '',
      'Actual Time': actualTime ?? '',
      'Assigned To': assignedTo ?? '',
      'Location': location ?? '',
      'Context': context ?? '',
      'Difficulty Rating': difficultyRating ?? '',
      'Energy Level Required': energyLevelRequired ?? '',
      'Completion Percentage': completionPercentage ?? '',
      'Is Recurring': isRecurring ?? '',
      'Is Pinned': isPinned ?? '',
      'Created At': createdAt ?? '',
      'Updated At': updatedAt ?? '',
    };
  }
}

/// Request model for import validation
@freezed
class ImportValidationRequest with _$ImportValidationRequest {
  const factory ImportValidationRequest({
    required String projectId,
    required String fileName,
    required List<CsvTaskData> tasks,
  }) = _ImportValidationRequest;

  factory ImportValidationRequest.fromJson(Map<String, dynamic> json) =>
      _$ImportValidationRequestFromJson(json);
}

/// Response model for import validation
@freezed
class ImportValidationResponse with _$ImportValidationResponse {
  const factory ImportValidationResponse({
    required bool isValid,
    required List<String> errors,
    required List<String> warnings,
    ImportStatistics? previewStatistics,
  }) = _ImportValidationResponse;

  factory ImportValidationResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportValidationResponseFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'project_model.dart';
import 'project_stats_model.dart';

part 'project_response_model.freezed.dart';
part 'project_response_model.g.dart';

/// Generic API response model for project operations.
@freezed
class ProjectResponseModel with _$ProjectResponseModel {
  const factory ProjectResponseModel({
    required bool success,
    required String message,
    ProjectModel? data,
    @JsonKey(name: 'projects') List<ProjectModel>? projects,
    @JsonKey(name: 'stats') ProjectStatsModel? stats,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  }) = _ProjectResponseModel;

  /// Create ProjectResponseModel from JSON
  factory ProjectResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectResponseModelFromJson(json);
}

/// Response model for project list operations.
@freezed
class ProjectListResponseModel with _$ProjectListResponseModel {
  const factory ProjectListResponseModel({
    required bool success,
    required String message,
    List<ProjectModel>? data,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  }) = _ProjectListResponseModel;

  /// Create ProjectListResponseModel from JSON
  factory ProjectListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectListResponseModelFromJson(json);
}

/// Response model for project statistics.
@freezed
class ProjectStatsResponseModel with _$ProjectStatsResponseModel {
  const factory ProjectStatsResponseModel({
    required bool success,
    required String message,
    required ProjectStatsModel data,
  }) = _ProjectStatsResponseModel;

  /// Create ProjectStatsResponseModel from JSON
  factory ProjectStatsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectStatsResponseModelFromJson(json);
}

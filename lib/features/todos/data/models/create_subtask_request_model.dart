import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/create_subtask_request.dart';

part 'create_subtask_request_model.freezed.dart';
part 'create_subtask_request_model.g.dart';

/// Data model for CreateSubtaskRequest with JSON serialization.
@freezed
class CreateSubtaskRequestModel with _$CreateSubtaskRequestModel {
  const factory CreateSubtaskRequestModel({
    required String name,
    required String description,
    @Default('medium') String priority,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
  }) = _CreateSubtaskRequestModel;

  /// Create CreateSubtaskRequestModel from JSON
  factory CreateSubtaskRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateSubtaskRequestModelFromJson(json);

  /// Create from domain entity
  factory CreateSubtaskRequestModel.fromDomain(CreateSubtaskRequest request) {
    return CreateSubtaskRequestModel(
      name: request.name,
      description: request.description,
      priority: request.priority.apiValue,
      estimatedTime: request.estimatedTime,
      sortOrder: request.sortOrder,
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/create_todo_request.dart';

part 'create_todo_request_model.freezed.dart';
part 'create_todo_request_model.g.dart';

/// Data model for CreateTodoRequest with JSON serialization.
@freezed
class CreateTodoRequestModel with _$CreateTodoRequestModel {
  const factory CreateTodoRequestModel({
    @JsonKey(name: 'project_id') required String projectId,
    @JsonKey(name: 'task_name') required String taskName,
    @JsonKey(name: 'task_description') required String taskDescription,
    @Default('medium') String priority,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'time_unit') @Default('minutes') String timeUnit,
    @JsonKey(name: 'due_date') String? dueDate,
    @Default([]) List<String> tags,
    @JsonKey(name: 'difficulty_rating') int? difficultyRating,
    @JsonKey(name: 'energy_level_required') int? energyLevelRequired,
    String? context,
    @JsonKey(name: 'assigned_user_id') String? assignedUserId,
    @Default('backlog') String status,
  }) = _CreateTodoRequestModel;

  /// Create CreateTodoRequestModel from JSON
  factory CreateTodoRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTodoRequestModelFromJson(json);

  /// Create from domain entity
  factory CreateTodoRequestModel.fromDomain(CreateTodoRequest request) {
    return CreateTodoRequestModel(
      projectId: request.projectId,
      taskName: request.taskName,
      taskDescription: request.taskDescription,
      priority: request.priority.apiValue,
      estimatedTime: request.estimatedTime,
      timeUnit: request.timeUnit,
      dueDate: request.dueDate?.toIso8601String(),
      tags: request.tags,
      difficultyRating: request.difficultyRating,
      energyLevelRequired: request.energyLevelRequired,
      context: request.context,
      assignedUserId: request.assignedUserId,
      status: request.status.apiValue,
    );
  }
}

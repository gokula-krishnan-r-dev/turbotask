import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/subtask.dart';
import '../../domain/entities/todo.dart';

part 'subtask_model.freezed.dart';
part 'subtask_model.g.dart';

/// Data model for Subtask entity with JSON serialization.
/// Converts between API responses and domain entities.
@freezed
class SubtaskModel with _$SubtaskModel {
  const factory SubtaskModel({
    required String id,
    @JsonKey(name: 'todo_id') required String todoId,
    required String name,
    required String description,
    @Default('todo') String status,
    @Default('medium') String priority,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'actual_time') int? actualTime,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @JsonKey(name: 'is_archived') @Default(false) bool isArchived,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'assigned_user_id') String? assignedUserId,
  }) = _SubtaskModel;

  const SubtaskModel._();

  /// Create SubtaskModel from JSON
  factory SubtaskModel.fromJson(Map<String, dynamic> json) =>
      _$SubtaskModelFromJson(json);

  /// Convert to domain entity
  Subtask toDomain() {
    return Subtask(
      id: id,
      todoId: todoId,
      name: name,
      description: description,
      status: TodoStatus.fromApiValue(status),
      priority: TodoPriority.fromApiValue(priority),
      estimatedTime: estimatedTime,
      actualTime: actualTime,
      sortOrder: sortOrder,
      isArchived: isArchived,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
      assignedUserId: assignedUserId,
    );
  }

  /// Create from domain entity
  factory SubtaskModel.fromDomain(Subtask subtask) {
    return SubtaskModel(
      id: subtask.id,
      todoId: subtask.todoId,
      name: subtask.name,
      description: subtask.description,
      status: subtask.status.apiValue,
      priority: subtask.priority.apiValue,
      estimatedTime: subtask.estimatedTime,
      actualTime: subtask.actualTime,
      sortOrder: subtask.sortOrder,
      isArchived: subtask.isArchived,
      createdAt: subtask.createdAt.toIso8601String(),
      updatedAt: subtask.updatedAt.toIso8601String(),
      completedAt: subtask.completedAt?.toIso8601String(),
      assignedUserId: subtask.assignedUserId,
    );
  }
}

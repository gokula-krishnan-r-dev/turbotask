import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/todo.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

/// Data model for Todo entity with JSON serialization.
/// Converts between API responses and domain entities.
@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required String id,
    @JsonKey(name: 'project_id') required String projectId,
    @JsonKey(name: 'task_name') required String taskName,
    @JsonKey(name: 'task_description') required String taskDescription,
    @Default('todo') String status,
    @Default('medium') String priority,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'time_unit') @Default('minutes') String timeUnit,
    @JsonKey(name: 'actual_time') int? actualTime,
    @JsonKey(name: 'due_date') String? dueDate,
    @Default([]) List<String> tags,
    @JsonKey(name: 'difficulty_rating') int? difficultyRating,
    @JsonKey(name: 'energy_level_required') int? energyLevelRequired,
    String? context,
    @JsonKey(name: 'is_pinned') @Default(false) bool isPinned,
    @JsonKey(name: 'is_archived') @Default(false) bool isArchived,
    @JsonKey(name: 'sort_order') @Default(0) int sortOrder,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
    @JsonKey(name: 'assigned_user_id') String? assignedUserId,
    @JsonKey(name: 'parent_todo_id') String? parentTodoId,
    @JsonKey(name: 'subtask_count') @Default(0) int subtaskCount,
    @JsonKey(name: 'completed_subtask_count')
    @Default(0)
    int completedSubtaskCount,
  }) = _TodoModel;

  const TodoModel._();

  /// Create TodoModel from JSON
  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);

  /// Convert to domain entity
  Todo toDomain() {
    return Todo(
      id: id,
      projectId: projectId,
      taskName: taskName,
      taskDescription: taskDescription,
      status: TodoStatus.fromApiValue(status),
      priority: TodoPriority.fromApiValue(priority),
      estimatedTime: estimatedTime,
      timeUnit: timeUnit,
      actualTime: actualTime,
      dueDate: dueDate != null ? DateTime.parse(dueDate!) : null,
      tags: tags,
      difficultyRating: difficultyRating,
      energyLevelRequired: energyLevelRequired,
      context: context,
      isPinned: isPinned,
      isArchived: isArchived,
      sortOrder: sortOrder,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      completedAt: completedAt != null ? DateTime.parse(completedAt!) : null,
      assignedUserId: assignedUserId,
      parentTodoId: parentTodoId,
      subtaskCount: subtaskCount,
      completedSubtaskCount: completedSubtaskCount,
    );
  }

  /// Create from domain entity
  factory TodoModel.fromDomain(Todo todo) {
    return TodoModel(
      id: todo.id,
      projectId: todo.projectId,
      taskName: todo.taskName,
      taskDescription: todo.taskDescription,
      status: todo.status.apiValue,
      priority: todo.priority.apiValue,
      estimatedTime: todo.estimatedTime,
      timeUnit: todo.timeUnit,
      actualTime: todo.actualTime,
      dueDate: todo.dueDate?.toIso8601String(),
      tags: todo.tags,
      difficultyRating: todo.difficultyRating,
      energyLevelRequired: todo.energyLevelRequired,
      context: todo.context,
      isPinned: todo.isPinned,
      isArchived: todo.isArchived,
      sortOrder: todo.sortOrder,
      createdAt: todo.createdAt.toIso8601String(),
      updatedAt: todo.updatedAt.toIso8601String(),
      completedAt: todo.completedAt?.toIso8601String(),
      assignedUserId: todo.assignedUserId,
      parentTodoId: todo.parentTodoId,
      subtaskCount: todo.subtaskCount,
      completedSubtaskCount: todo.completedSubtaskCount,
    );
  }
}

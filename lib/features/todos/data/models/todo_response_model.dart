import 'package:freezed_annotation/freezed_annotation.dart';

import 'todo_model.dart';
import 'subtask_model.dart';

part 'todo_response_model.freezed.dart';
part 'todo_response_model.g.dart';

/// Generic API response model for todo operations.
@freezed
class TodoResponseModel with _$TodoResponseModel {
  const factory TodoResponseModel({
    required bool success,
    required String message,
    TodoModel? data,
    @JsonKey(name: 'todos') List<TodoModel>? todos,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  }) = _TodoResponseModel;

  /// Create TodoResponseModel from JSON
  factory TodoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TodoResponseModelFromJson(json);
}

/// Response model for todo list operations.
@freezed
class TodoListResponseModel with _$TodoListResponseModel {
  const factory TodoListResponseModel({
    required bool success,
    required String message,
    required List<TodoModel> data,
    @JsonKey(name: 'total_count') int? totalCount,
    @JsonKey(name: 'current_page') int? currentPage,
    @JsonKey(name: 'per_page') int? perPage,
    @JsonKey(name: 'last_page') int? lastPage,
  }) = _TodoListResponseModel;

  /// Create TodoListResponseModel from JSON
  factory TodoListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TodoListResponseModelFromJson(json);
}

/// Response model for subtask operations.
@freezed
class SubtaskResponseModel with _$SubtaskResponseModel {
  const factory SubtaskResponseModel({
    required bool success,
    required String message,
    SubtaskModel? data,
  }) = _SubtaskResponseModel;

  /// Create SubtaskResponseModel from JSON
  factory SubtaskResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubtaskResponseModelFromJson(json);
}

/// Response model for subtask list operations.
@freezed
class SubtaskListResponseModel with _$SubtaskListResponseModel {
  const factory SubtaskListResponseModel({
    required bool success,
    required String message,
    required List<SubtaskModel> data,
  }) = _SubtaskListResponseModel;

  /// Create SubtaskListResponseModel from JSON
  factory SubtaskListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SubtaskListResponseModelFromJson(json);
}

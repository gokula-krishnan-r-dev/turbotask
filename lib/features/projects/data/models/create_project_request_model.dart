import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/create_project_request.dart';

part 'create_project_request_model.freezed.dart';
part 'create_project_request_model.g.dart';

/// Data model for CreateProjectRequest with JSON serialization.
@freezed
class CreateProjectRequestModel with _$CreateProjectRequestModel {
  const factory CreateProjectRequestModel({
    required String title,
    required String description,
    required String category,
    @JsonKey(name: 'color_theme') required String colorTheme,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _CreateProjectRequestModel;

  const CreateProjectRequestModel._();

  /// Create CreateProjectRequestModel from JSON
  factory CreateProjectRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectRequestModelFromJson(json);

  /// Convert to domain entity
  CreateProjectRequest toDomain() {
    return CreateProjectRequest(
      title: title,
      description: description,
      category: category,
      colorTheme: colorTheme,
      imageUrl: imageUrl,
    );
  }

  /// Create from domain entity
  factory CreateProjectRequestModel.fromDomain(CreateProjectRequest request) {
    return CreateProjectRequestModel(
      title: request.title,
      description: request.description,
      category: request.category,
      colorTheme: request.colorTheme,
      imageUrl: request.imageUrl,
    );
  }
}

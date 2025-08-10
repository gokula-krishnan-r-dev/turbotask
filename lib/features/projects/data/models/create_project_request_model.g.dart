// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateProjectRequestModelImpl _$$CreateProjectRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$CreateProjectRequestModelImpl(
  title: json['title'] as String,
  description: json['description'] as String,
  category: json['category'] as String,
  colorTheme: json['color_theme'] as String,
  imageUrl: json['image_url'] as String?,
);

Map<String, dynamic> _$$CreateProjectRequestModelImplToJson(
  _$CreateProjectRequestModelImpl instance,
) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'color_theme': instance.colorTheme,
  'image_url': instance.imageUrl,
};

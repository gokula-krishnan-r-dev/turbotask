// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoResponseModelImpl _$$TodoResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$TodoResponseModelImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : TodoModel.fromJson(json['data'] as Map<String, dynamic>),
  todos: (json['todos'] as List<dynamic>?)
      ?.map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num?)?.toInt(),
  currentPage: (json['current_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
);

Map<String, dynamic> _$$TodoResponseModelImplToJson(
  _$TodoResponseModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'todos': instance.todos,
  'total_count': instance.totalCount,
  'current_page': instance.currentPage,
  'per_page': instance.perPage,
  'last_page': instance.lastPage,
};

_$TodoListResponseModelImpl _$$TodoListResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$TodoListResponseModelImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => TodoModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalCount: (json['total_count'] as num?)?.toInt(),
  currentPage: (json['current_page'] as num?)?.toInt(),
  perPage: (json['per_page'] as num?)?.toInt(),
  lastPage: (json['last_page'] as num?)?.toInt(),
);

Map<String, dynamic> _$$TodoListResponseModelImplToJson(
  _$TodoListResponseModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
  'total_count': instance.totalCount,
  'current_page': instance.currentPage,
  'per_page': instance.perPage,
  'last_page': instance.lastPage,
};

_$SubtaskResponseModelImpl _$$SubtaskResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$SubtaskResponseModelImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: json['data'] == null
      ? null
      : SubtaskModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$SubtaskResponseModelImplToJson(
  _$SubtaskResponseModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_$SubtaskListResponseModelImpl _$$SubtaskListResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$SubtaskListResponseModelImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => SubtaskModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$SubtaskListResponseModelImplToJson(
  _$SubtaskListResponseModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

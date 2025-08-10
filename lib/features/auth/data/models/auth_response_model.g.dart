// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
  Map<String, dynamic> json,
) => _$AuthResponseModelImpl(
  success: json['success'] as bool,
  message: json['message'] as String,
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  isNewUser: json['is_new_user'] as bool,
);

Map<String, dynamic> _$$AuthResponseModelImplToJson(
  _$AuthResponseModelImpl instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'user': instance.user,
  'is_new_user': instance.isNewUser,
};

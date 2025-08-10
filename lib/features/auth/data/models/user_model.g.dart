// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      username: json['username'] as String,
      emailVerified: json['email_verified'] as bool? ?? false,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      fullName: json['full_name'] as String,
      timezone: json['timezone'] as String,
      locale: json['locale'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'email_verified': instance.emailVerified,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'full_name': instance.fullName,
      'timezone': instance.timezone,
      'locale': instance.locale,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

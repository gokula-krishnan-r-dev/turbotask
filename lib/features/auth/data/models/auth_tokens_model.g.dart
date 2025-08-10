// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_tokens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthTokensModelImpl _$$AuthTokensModelImplFromJson(
  Map<String, dynamic> json,
) => _$AuthTokensModelImpl(
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  tokenType: json['token_type'] as String? ?? 'Bearer',
  expiresIn: (json['expires_in'] as num?)?.toInt(),
);

Map<String, dynamic> _$$AuthTokensModelImplToJson(
  _$AuthTokensModelImpl instance,
) => <String, dynamic>{
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'token_type': instance.tokenType,
  'expires_in': instance.expiresIn,
};

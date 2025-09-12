// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  login: json['login'] as String,
  id: (json['id'] as num).toInt(),
  avatarUrl: json['avatar_url'] as String,
  htmlUrl: json['html_url'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'login': instance.login,
  'id': instance.id,
  'avatar_url': instance.avatarUrl,
  'html_url': instance.htmlUrl,
};

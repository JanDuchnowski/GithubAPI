// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PullRequestModel _$PullRequestModelFromJson(Map<String, dynamic> json) =>
    PullRequestModel(
      id: (json['id'] as num).toInt(),
      number: (json['number'] as num).toInt(),
      title: json['title'] as String,
      state: json['state'] as String,
      htmlUrl: json['html_url'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      body: json['body'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      closedAt: json['closed_at'] as String?,
      mergedAt: json['merged_at'] as String?,
    );

Map<String, dynamic> _$PullRequestModelToJson(PullRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'title': instance.title,
      'state': instance.state,
      'html_url': instance.htmlUrl,
      'user': instance.user,
      'body': instance.body,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'closed_at': instance.closedAt,
      'merged_at': instance.mergedAt,
    };

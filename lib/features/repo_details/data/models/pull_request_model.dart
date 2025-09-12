import 'user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pull_request_model.g.dart';

@JsonSerializable()
class PullRequestModel {
  final int id;
  final int number;
  final String title;
  final String state;
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @JsonKey(name: 'user')
  final UserModel user;
  final String? body;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'closed_at')
  final String? closedAt;
  @JsonKey(name: 'merged_at')
  final String? mergedAt;

  PullRequestModel({
    required this.id,
    required this.number,
    required this.title,
    required this.state,
    required this.htmlUrl,
    required this.user,
    this.body,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.mergedAt,
  });

  String get userLogin => user.login;

  factory PullRequestModel.fromJson(Map<String, dynamic> json) =>
      _$PullRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$PullRequestModelToJson(this);
}

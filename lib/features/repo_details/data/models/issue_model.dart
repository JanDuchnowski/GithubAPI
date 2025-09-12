import 'package:json_annotation/json_annotation.dart';

part 'issue_model.g.dart';

@JsonSerializable()
class IssueModel {
  final int id;
  @JsonKey(name: 'node_id')
  final String nodeId;
  final int number;
  final String title;
  final String state;
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  final String? body;
  final User user;
  final List<Label> labels;
  final bool locked;
  final int comments;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'closed_at')
  final String? closedAt;
  @JsonKey(name: 'author_association')
  final String authorAssociation;
  final bool? draft;
  @JsonKey(name: 'pull_request')
  final PullRequestInfo? pullRequest;

  IssueModel({
    required this.id,
    required this.nodeId,
    required this.number,
    required this.title,
    required this.state,
    required this.htmlUrl,
    this.body,
    required this.user,
    required this.labels,
    required this.locked,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    this.closedAt,
    required this.authorAssociation,
    this.draft,
    this.pullRequest,
  });

  factory IssueModel.fromJson(Map<String, dynamic> json) =>
      _$IssueModelFromJson(json);
  Map<String, dynamic> toJson() => _$IssueModelToJson(this);
}

@JsonSerializable()
class Label {
  final int id;
  @JsonKey(name: 'node_id')
  final String nodeId;
  final String url;
  final String name;
  final String color;
  final bool? isDefault;
  final String? description;

  Label({
    required this.id,
    required this.nodeId,
    required this.url,
    required this.name,
    required this.color,
    this.isDefault,
    this.description,
  });

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);
  Map<String, dynamic> toJson() => _$LabelToJson(this);
}

@JsonSerializable()
class PullRequestInfo {
  final String url;
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @JsonKey(name: 'diff_url')
  final String diffUrl;
  @JsonKey(name: 'patch_url')
  final String patchUrl;
  final String? mergedAt;

  PullRequestInfo({
    required this.url,
    required this.htmlUrl,
    required this.diffUrl,
    required this.patchUrl,
    this.mergedAt,
  });

  factory PullRequestInfo.fromJson(Map<String, dynamic> json) =>
      _$PullRequestInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PullRequestInfoToJson(this);
}

@JsonSerializable()
class User {
  final String login;
  final int id;
  @JsonKey(name: 'node_id')
  final String nodeId;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'gravatar_id')
  final String gravatarId;
  final String url;
  @JsonKey(name: 'html_url')
  final String htmlUrl;
  @JsonKey(name: 'followers_url')
  final String followersUrl;
  @JsonKey(name: 'following_url')
  final String followingUrl;
  @JsonKey(name: 'gists_url')
  final String gistsUrl;
  @JsonKey(name: 'starred_url')
  final String starredUrl;
  @JsonKey(name: 'subscriptions_url')
  final String subscriptionsUrl;
  @JsonKey(name: 'organizations_url')
  final String organizationsUrl;
  @JsonKey(name: 'repos_url')
  final String reposUrl;
  @JsonKey(name: 'events_url')
  final String eventsUrl;
  @JsonKey(name: 'received_events_url')
  final String receivedEventsUrl;
  final String type;
  @JsonKey(name: 'user_view_type')
  final String userViewType;
  @JsonKey(name: 'site_admin')
  final bool siteAdmin;

  User({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.userViewType,
    required this.siteAdmin,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

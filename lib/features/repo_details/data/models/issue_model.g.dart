// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueModel _$IssueModelFromJson(Map<String, dynamic> json) => IssueModel(
  id: (json['id'] as num).toInt(),
  nodeId: json['node_id'] as String,
  number: (json['number'] as num).toInt(),
  title: json['title'] as String,
  state: json['state'] as String,
  htmlUrl: json['html_url'] as String,
  body: json['body'] as String?,
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  labels: (json['labels'] as List<dynamic>)
      .map((e) => Label.fromJson(e as Map<String, dynamic>))
      .toList(),
  locked: json['locked'] as bool,
  comments: (json['comments'] as num).toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  closedAt: json['closed_at'] as String?,
  authorAssociation: json['author_association'] as String,
  draft: json['draft'] as bool?,
  pullRequest: json['pull_request'] == null
      ? null
      : PullRequestInfo.fromJson(json['pull_request'] as Map<String, dynamic>),
);

Map<String, dynamic> _$IssueModelToJson(IssueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'node_id': instance.nodeId,
      'number': instance.number,
      'title': instance.title,
      'state': instance.state,
      'html_url': instance.htmlUrl,
      'body': instance.body,
      'user': instance.user,
      'labels': instance.labels,
      'locked': instance.locked,
      'comments': instance.comments,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'closed_at': instance.closedAt,
      'author_association': instance.authorAssociation,
      'draft': instance.draft,
      'pull_request': instance.pullRequest,
    };

Label _$LabelFromJson(Map<String, dynamic> json) => Label(
  id: (json['id'] as num).toInt(),
  nodeId: json['node_id'] as String,
  url: json['url'] as String,
  name: json['name'] as String,
  color: json['color'] as String,
  isDefault: json['isDefault'] as bool?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$LabelToJson(Label instance) => <String, dynamic>{
  'id': instance.id,
  'node_id': instance.nodeId,
  'url': instance.url,
  'name': instance.name,
  'color': instance.color,
  'isDefault': instance.isDefault,
  'description': instance.description,
};

PullRequestInfo _$PullRequestInfoFromJson(Map<String, dynamic> json) =>
    PullRequestInfo(
      url: json['url'] as String,
      htmlUrl: json['html_url'] as String,
      diffUrl: json['diff_url'] as String,
      patchUrl: json['patch_url'] as String,
      mergedAt: json['mergedAt'] as String?,
    );

Map<String, dynamic> _$PullRequestInfoToJson(PullRequestInfo instance) =>
    <String, dynamic>{
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'diff_url': instance.diffUrl,
      'patch_url': instance.patchUrl,
      'mergedAt': instance.mergedAt,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  login: json['login'] as String,
  id: (json['id'] as num).toInt(),
  nodeId: json['node_id'] as String,
  avatarUrl: json['avatar_url'] as String,
  gravatarId: json['gravatar_id'] as String,
  url: json['url'] as String,
  htmlUrl: json['html_url'] as String,
  followersUrl: json['followers_url'] as String,
  followingUrl: json['following_url'] as String,
  gistsUrl: json['gists_url'] as String,
  starredUrl: json['starred_url'] as String,
  subscriptionsUrl: json['subscriptions_url'] as String,
  organizationsUrl: json['organizations_url'] as String,
  reposUrl: json['repos_url'] as String,
  eventsUrl: json['events_url'] as String,
  receivedEventsUrl: json['received_events_url'] as String,
  type: json['type'] as String,
  userViewType: json['user_view_type'] as String,
  siteAdmin: json['site_admin'] as bool,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'login': instance.login,
  'id': instance.id,
  'node_id': instance.nodeId,
  'avatar_url': instance.avatarUrl,
  'gravatar_id': instance.gravatarId,
  'url': instance.url,
  'html_url': instance.htmlUrl,
  'followers_url': instance.followersUrl,
  'following_url': instance.followingUrl,
  'gists_url': instance.gistsUrl,
  'starred_url': instance.starredUrl,
  'subscriptions_url': instance.subscriptionsUrl,
  'organizations_url': instance.organizationsUrl,
  'repos_url': instance.reposUrl,
  'events_url': instance.eventsUrl,
  'received_events_url': instance.receivedEventsUrl,
  'type': instance.type,
  'user_view_type': instance.userViewType,
  'site_admin': instance.siteAdmin,
};

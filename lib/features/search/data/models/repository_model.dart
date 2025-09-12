import 'package:json_annotation/json_annotation.dart';

part 'repository_model.g.dart';

@JsonSerializable()
class RepositoryModel {
  final int id;
  @JsonKey(name: 'node_id')
  final String? nodeId;
  final String? name;
  @JsonKey(name: 'full_name')
  final String? fullName;
  final bool private;
  final Owner owner;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  final String? description;
  final bool fork;
  final String? url;
  @JsonKey(name: 'forks_url')
  final String? forksUrl;
  @JsonKey(name: 'keys_url')
  final String? keysUrl;
  @JsonKey(name: 'collaborators_url')
  final String? collaboratorsUrl;
  @JsonKey(name: 'teams_url')
  final String? teamsUrl;
  @JsonKey(name: 'hooks_url')
  final String? hooksUrl;
  @JsonKey(name: 'issue_events_url')
  final String? issueEventsUrl;
  @JsonKey(name: 'events_url')
  final String? eventsUrl;
  @JsonKey(name: 'assignees_url')
  final String? assigneesUrl;
  @JsonKey(name: 'branches_url')
  final String? branchesUrl;
  @JsonKey(name: 'tags_url')
  final String? tagsUrl;
  @JsonKey(name: 'blobs_url')
  final String? blobsUrl;
  @JsonKey(name: 'git_tags_url')
  final String? gitTagsUrl;
  @JsonKey(name: 'git_refs_url')
  final String? gitRefsUrl;
  @JsonKey(name: 'trees_url')
  final String? treesUrl;
  @JsonKey(name: 'statuses_url')
  final String? statusesUrl;
  @JsonKey(name: 'languages_url')
  final String? languagesUrl;
  @JsonKey(name: 'stargazers_url')
  final String? stargazersUrl;
  @JsonKey(name: 'contributors_url')
  final String? contributorsUrl;
  @JsonKey(name: 'subscribers_url')
  final String? subscribersUrl;
  @JsonKey(name: 'subscription_url')
  final String? subscriptionUrl;
  @JsonKey(name: 'commits_url')
  final String? commitsUrl;
  @JsonKey(name: 'git_commits_url')
  final String? gitCommitsUrl;
  @JsonKey(name: 'comments_url')
  final String? commentsUrl;
  @JsonKey(name: 'issue_comment_url')
  final String? issueCommentUrl;
  @JsonKey(name: 'contents_url')
  final String? contentsUrl;
  @JsonKey(name: 'compare_url')
  final String? compareUrl;
  @JsonKey(name: 'merges_url')
  final String? mergesUrl;
  @JsonKey(name: 'archive_url')
  final String? archiveUrl;
  @JsonKey(name: 'downloads_url')
  final String? downloadsUrl;
  @JsonKey(name: 'issues_url')
  final String? issuesUrl;
  @JsonKey(name: 'pulls_url')
  final String? pullsUrl;
  @JsonKey(name: 'milestones_url')
  final String? milestonesUrl;
  @JsonKey(name: 'notifications_url')
  final String? notificationsUrl;
  @JsonKey(name: 'labels_url')
  final String? labelsUrl;
  @JsonKey(name: 'releases_url')
  final String? releasesUrl;
  @JsonKey(name: 'deployments_url')
  final String? deploymentsUrl;

  RepositoryModel({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    this.description,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.languagesUrl,
    required this.stargazersUrl,
    required this.contributorsUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.commitsUrl,
    required this.gitCommitsUrl,
    required this.commentsUrl,
    required this.issueCommentUrl,
    required this.contentsUrl,
    required this.compareUrl,
    required this.mergesUrl,
    required this.archiveUrl,
    required this.downloadsUrl,
    required this.issuesUrl,
    required this.pullsUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.labelsUrl,
    required this.releasesUrl,
    required this.deploymentsUrl,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$RepositoryModelToJson(this);
}

@JsonSerializable()
class Owner {
  final String? login;
  final int id;
  @JsonKey(name: 'node_id')
  final String? nodeId;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  @JsonKey(name: 'gravatar_id')
  final String? gravatarId;
  final String? url;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  @JsonKey(name: 'followers_url')
  final String? followersUrl;
  @JsonKey(name: 'following_url')
  final String? followingUrl;
  @JsonKey(name: 'gists_url')
  final String? gistsUrl;
  @JsonKey(name: 'starred_url')
  final String? starredUrl;
  @JsonKey(name: 'subscriptions_url')
  final String? subscriptionsUrl;
  @JsonKey(name: 'organizations_url')
  final String? organizationsUrl;
  @JsonKey(name: 'repos_url')
  final String? reposUrl;
  @JsonKey(name: 'events_url')
  final String? eventsUrl;
  @JsonKey(name: 'received_events_url')
  final String? receivedEventsUrl;
  final String? type;
  @JsonKey(name: 'user_view_type')
  final String? userViewType;
  @JsonKey(name: 'site_admin')
  final bool? siteAdmin;

  Owner({
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

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}

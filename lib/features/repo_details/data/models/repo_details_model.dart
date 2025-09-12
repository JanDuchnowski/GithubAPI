import 'package:githubapi/features/repo_details/data/models/license_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repo_details_model.g.dart';

@JsonSerializable()
class RepoDetailsModel {
  final int id;
  @JsonKey(name: 'node_id')
  final String? nodeId;
  final String? name;
  @JsonKey(name: 'full_name')
  final String? fullName;
  final Owner owner;
  final bool private;
  @JsonKey(name: 'html_url')
  final String? htmlUrl;
  final String? description;
  final bool fork;
  final String? url;
  @JsonKey(name: 'archive_url')
  final String? archiveUrl;
  @JsonKey(name: 'assignees_url')
  final String? assigneesUrl;
  @JsonKey(name: 'blobs_url')
  final String? blobsUrl;
  @JsonKey(name: 'branches_url')
  final String? branchesUrl;
  @JsonKey(name: 'collaborators_url')
  final String? collaboratorsUrl;
  @JsonKey(name: 'comments_url')
  final String? commentsUrl;
  @JsonKey(name: 'commits_url')
  final String? commitsUrl;
  @JsonKey(name: 'compare_url')
  final String? compareUrl;
  @JsonKey(name: 'contents_url')
  final String? contentsUrl;
  @JsonKey(name: 'contributors_url')
  final String? contributorsUrl;
  @JsonKey(name: 'deployments_url')
  final String? deploymentsUrl;
  @JsonKey(name: 'downloads_url')
  final String? downloadsUrl;
  @JsonKey(name: 'events_url')
  final String? eventsUrl;
  @JsonKey(name: 'forks_url')
  final String? forksUrl;
  @JsonKey(name: 'git_commits_url')
  final String? gitCommitsUrl;
  @JsonKey(name: 'git_refs_url')
  final String? gitRefsUrl;
  @JsonKey(name: 'git_tags_url')
  final String? gitTagsUrl;
  @JsonKey(name: 'git_url')
  final String? gitUrl;
  @JsonKey(name: 'issue_comment_url')
  final String? issueCommentUrl;
  @JsonKey(name: 'issue_events_url')
  final String? issueEventsUrl;
  @JsonKey(name: 'issues_url')
  final String? issuesUrl;
  @JsonKey(name: 'keys_url')
  final String? keysUrl;
  @JsonKey(name: 'labels_url')
  final String? labelsUrl;
  @JsonKey(name: 'languages_url')
  final String? languagesUrl;
  @JsonKey(name: 'merges_url')
  final String? mergesUrl;
  @JsonKey(name: 'milestones_url')
  final String? milestonesUrl;
  @JsonKey(name: 'notifications_url')
  final String? notificationsUrl;
  @JsonKey(name: 'pulls_url')
  final String? pullsUrl;
  @JsonKey(name: 'releases_url')
  final String? releasesUrl;
  @JsonKey(name: 'ssh_url')
  final String? sshUrl;
  @JsonKey(name: 'stargazers_url')
  final String? stargazersUrl;
  @JsonKey(name: 'statuses_url')
  final String? statusesUrl;
  @JsonKey(name: 'subscribers_url')
  final String? subscribersUrl;
  @JsonKey(name: 'subscription_url')
  final String? subscriptionUrl;
  @JsonKey(name: 'tags_url')
  final String? tagsUrl;
  @JsonKey(name: 'teams_url')
  final String? teamsUrl;
  @JsonKey(name: 'trees_url')
  final String? treesUrl;
  @JsonKey(name: 'clone_url')
  final String? cloneUrl;
  @JsonKey(name: 'default_branch')
  final String? defaultBranch;
  final int? forks;
  @JsonKey(name: 'forks_count')
  final int? forksCount;
  final String? homepage;
  final String? language;
  final bool? archived;
  final bool? disabled;
  final License? license;
  @JsonKey(name: 'mirror_url')
  final String? mirrorUrl;
  @JsonKey(name: 'open_issues')
  final int? openIssues;
  @JsonKey(name: 'open_issues_count')
  final int? openIssuesCount;
  @JsonKey(name: 'pushed_at')
  final String? pushedAt;
  final int? size;
  @JsonKey(name: 'ssh_url2')
  final String? sshUrl2;
  @JsonKey(name: 'svn_url')
  final String? svnUrl;
  @JsonKey(name: 'stargazers_count')
  final int? stargazersCount;
  final int? watchers;
  @JsonKey(name: 'watchers_count')
  final int? watchersCount;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'network_count')
  final int? networkCount;
  @JsonKey(name: 'has_issues')
  final bool? hasIssues;
  @JsonKey(name: 'has_projects')
  final bool? hasProjects;
  @JsonKey(name: 'has_downloads')
  final bool? hasDownloads;
  @JsonKey(name: 'has_wiki')
  final bool? hasWiki;
  @JsonKey(name: 'has_pages')
  final bool? hasPages;
  @JsonKey(name: 'has_discussions')
  final bool? hasDiscussions;
  @JsonKey(name: 'allow_forking')
  final bool? allowForking;
  @JsonKey(name: 'is_template')
  final bool? isTemplate;
  @JsonKey(name: 'web_commit_signoff_required')
  final bool? webCommitSignoffRequired;
  final List<String>? topics;
  final String? visibility;
  @JsonKey(name: 'temp_clone_token')
  final String? tempCloneToken;
  @JsonKey(name: 'subscribers_count')
  final int? subscribersCount;

  RepoDetailsModel({
    required this.id,
    this.nodeId,
    this.name,
    this.fullName,
    required this.owner,
    required this.private,
    this.htmlUrl,
    this.description,
    required this.fork,
    this.url,
    this.archiveUrl,
    this.assigneesUrl,
    this.blobsUrl,
    this.branchesUrl,
    this.collaboratorsUrl,
    this.commentsUrl,
    this.commitsUrl,
    this.compareUrl,
    this.contentsUrl,
    this.contributorsUrl,
    this.deploymentsUrl,
    this.downloadsUrl,
    this.eventsUrl,
    this.forksUrl,
    this.gitCommitsUrl,
    this.gitRefsUrl,
    this.gitTagsUrl,
    this.gitUrl,
    this.issueCommentUrl,
    this.issueEventsUrl,
    this.issuesUrl,
    this.keysUrl,
    this.labelsUrl,
    this.languagesUrl,
    this.mergesUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.pullsUrl,
    this.releasesUrl,
    this.sshUrl,
    this.stargazersUrl,
    this.statusesUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.tagsUrl,
    this.teamsUrl,
    this.treesUrl,
    this.cloneUrl,
    this.defaultBranch,
    this.forks,
    this.forksCount,
    this.homepage,
    this.language,
    this.archived,
    this.disabled,
    this.license,
    this.mirrorUrl,
    this.openIssues,
    this.openIssuesCount,
    this.pushedAt,
    this.size,
    this.sshUrl2,
    this.svnUrl,
    this.stargazersCount,
    this.watchers,
    this.watchersCount,
    this.createdAt,
    this.updatedAt,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.hasDiscussions,
    this.allowForking,
    this.isTemplate,
    this.webCommitSignoffRequired,
    this.topics,
    this.visibility,
    this.tempCloneToken,
    this.networkCount,
    this.subscribersCount,
  });
  Map<String, dynamic> toJson() => _$RepoDetailsModelToJson(this);
  factory RepoDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$RepoDetailsModelFromJson(json);
}

@JsonSerializable()
class Owner {
  final String? login;
  final int? id;
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
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.userViewType,
    this.siteAdmin,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}

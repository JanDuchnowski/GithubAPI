import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:githubapi/core/network/dio_client.dart';
import 'package:githubapi/features/repo_details/data/models/pull_request_model.dart';
import 'package:githubapi/features/repo_details/data/repositories/github_pull_requests_repository.dart';
import 'package:githubapi/features/repo_details/domain/repositories/pull_requests_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pull_requests_provider.g.dart';

@riverpod
PullRequestsRepository pullRequestsRepository(Ref ref) {
  return GithubPullRequestsRepository(ref.watch(dioProvider));
}

@riverpod
Future<List<PullRequestModel>> pullRequests(
  Ref ref,
  ({String owner, String repo, String state}) params,
) async {
  final repository = ref.watch(pullRequestsRepositoryProvider);
  return repository.fetchPullRequests(
    params.owner,
    params.repo,
    state: params.state,
  );
}

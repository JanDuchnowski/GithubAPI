import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:githubapi/core/network/dio_client.dart';
import 'package:githubapi/features/repo_details/data/repositories/github_issue_repository.dart';
import 'package:githubapi/features/repo_details/data/models/issue_model.dart';
import 'package:githubapi/features/repo_details/domain/repositories/issue_repository.dart';

final issueRepositoryProvider = Provider<IssueRepository>(
  (ref) => GithubIssueRepository(ref.watch(dioProvider)),
);

final issuesProvider = FutureProvider.autoDispose
    .family<List<IssueModel>, ({String owner, String repo})>((
      ref,
      params,
    ) async {
      final repo = ref.watch(issueRepositoryProvider);
      return repo.fetchIssues(params.owner, params.repo);
    });

import 'package:githubapi/features/repo_details/data/models/pull_request_model.dart';

abstract class PullRequestsRepository {
  Future<List<PullRequestModel>> fetchPullRequests(
    String owner,
    String repo, {
    String state = 'open',
  });
}

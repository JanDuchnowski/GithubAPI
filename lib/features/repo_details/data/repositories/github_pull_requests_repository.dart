import 'package:dio/dio.dart';
import 'package:githubapi/core/network/dio_client.dart';
import '../models/pull_request_model.dart';
import '../../domain/repositories/pull_requests_repository.dart';

class GithubPullRequestsRepository implements PullRequestsRepository {
  final Dio dio;

  const GithubPullRequestsRepository(this.dio);

  @override
  Future<List<PullRequestModel>> fetchPullRequests(
    String owner,
    String repo, {
    String state = 'open',
  }) async {
    final response = await dio.get(
      '/${ApiConstants.repos}/$owner/$repo/${ApiConstants.pulls}',
      queryParameters: {'state': state},
    );
    final data = response.data as List;
    return data.map((item) => PullRequestModel.fromJson(item)).toList();
  }
}

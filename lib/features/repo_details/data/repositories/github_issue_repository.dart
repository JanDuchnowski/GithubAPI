import 'package:dio/dio.dart';
import 'package:githubapi/core/network/dio_client.dart';
import 'package:githubapi/features/repo_details/domain/repositories/issue_repository.dart';
import '../models/issue_model.dart';

class GithubIssueRepository implements IssueRepository {
  final Dio dio;

  const GithubIssueRepository(this.dio);

  @override
  Future<List<IssueModel>> fetchIssues(String owner, String repo) async {
    final response = await dio.get(
      '${ApiConstants.repos}/$owner/$repo/${ApiConstants.issues}',
    );

    final data = response.data as List;

    // Filter out items that are actually pull requests
    final issuesOnly = data
        .where((item) => item['pull_request'] == null)
        .toList();

    return issuesOnly.map((item) => IssueModel.fromJson(item)).toList();
  }
}

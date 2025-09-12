import 'package:githubapi/features/repo_details/data/models/issue_model.dart';

abstract class IssueRepository {
  Future<List<IssueModel>> fetchIssues(String owner, String repo);
}

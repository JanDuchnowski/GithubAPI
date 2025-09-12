import '../entities/repo_details_entity.dart';

abstract class RepoDetailsRepository {
  Future<RepoDetailsEntity> fetchRepoDetails(String owner, String repo);
}

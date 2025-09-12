import 'repository_entity.dart';

abstract class SearchRepository {
  Future<List<RepositoryEntity>> searchRepositories(String query);
}

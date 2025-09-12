import 'package:dio/dio.dart';

import '../models/repository_model.dart';
import '../../domain/repository_entity.dart';
import '../../domain/search_repository.dart';

class GithubSearchRepository implements SearchRepository {
  final Dio dio;

  GithubSearchRepository(this.dio);

  @override
  Future<List<RepositoryEntity>> searchRepositories(String query) async {
    final response = await dio.get(
      'https://api.github.com/search/repositories',
      queryParameters: {'q': query},
    );
    final items = response.data['items'] as List<dynamic>;
    return items
        .map((item) => RepositoryModel.fromJson(item))
        .map(
          (model) => RepositoryEntity(
            id: model.id,
            name: model.name ?? '',
            fullName: model.fullName ?? '',
            description: model.description,
            stargazersCount: 0, // TODO: map if present in model
            htmlUrl: model.htmlUrl ?? '',
            ownerLogin: model.owner.login ?? '',
            ownerAvatarUrl: model.owner.avatarUrl ?? '',
          ),
        )
        .toList();
  }
}

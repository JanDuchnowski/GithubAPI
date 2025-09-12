import 'package:dio/dio.dart';
import '../models/repo_details_model.dart';
import '../../domain/entities/repo_details_entity.dart';
import '../../domain/repositories/repo_details_repository.dart';

class GithubRepoDetailsRepository implements RepoDetailsRepository {
  final Dio _dio;
  GithubRepoDetailsRepository(this._dio);

  @override
  Future<RepoDetailsEntity> fetchRepoDetails(String owner, String repo) async {
    final response = await _dio.get(
      'https://api.github.com/repos/$owner/$repo',
    );
    final model = RepoDetailsModel.fromJson(response.data);
    return RepoDetailsEntity(
      name: model.name ?? '',
      fullName: model.fullName ?? '',
      description: model.description ?? '',
      stargazersCount: model.stargazersCount ?? 0,
      forksCount: model.forksCount ?? 0,
      watchersCount: model.watchersCount ?? 0,
      language: model.language ?? '',
      license: model.license?.name ?? '',
      updatedAt: model.updatedAt ?? '',
      ownerLogin: model.owner.login ?? '',
      ownerAvatarUrl: model.owner.avatarUrl ?? '',
    );
  }
}

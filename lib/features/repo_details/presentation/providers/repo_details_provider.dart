import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:githubapi/core/network/dio_client.dart';
import 'package:githubapi/features/repo_details/domain/repositories/repo_details_repository.dart';
import '../../data/repositories/github_repo_details_repository.dart';
import '../../domain/entities/repo_details_entity.dart';

final repoDetailsRepositoryProvider = Provider<RepoDetailsRepository>(
  (ref) => GithubRepoDetailsRepository(ref.watch(dioProvider)),
);

final repoDetailsProvider = FutureProvider.autoDispose
    .family<RepoDetailsEntity, ({String owner, String repo})>((
      ref,
      params,
    ) async {
      final repo = ref.watch(repoDetailsRepositoryProvider);
      return repo.fetchRepoDetails(params.owner, params.repo);
    });

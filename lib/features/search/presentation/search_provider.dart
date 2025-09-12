import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:developer';
import 'package:githubapi/core/network/dio_client.dart';
import '../data/repositories/github_search_repository.dart';
import '../domain/search_repository.dart';
import '../domain/repository_entity.dart';

part 'search_provider.g.dart';

@riverpod
SearchRepository githubSearchRepository(Ref ref) {
  return GithubSearchRepository(ref.watch(dioProvider));
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';
}

@riverpod
Future<List<RepositoryEntity>> searchResults(Ref ref) async {
  try {
    final query = ref.watch(searchQueryProvider);
    if (query.isEmpty) return [];
    final repo = ref.watch(githubSearchRepositoryProvider);
    return await repo.searchRepositories(query);
  } catch (e, stackTrace) {
    log("Error: $e, stackTrace: $stackTrace");
    return [];
  }
}

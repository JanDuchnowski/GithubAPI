import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/features/search/data/repositories/github_search_repository.dart';
import 'package:githubapi/features/search/domain/search_repository.dart';
import 'package:githubapi/features/search/domain/repository_entity.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('GithubSearchRepository', () {
    late MockDio dio;
    late SearchRepository repo;

    setUp(() {
      dio = MockDio();
      repo = GithubSearchRepository(dio);
    });

    test('returns list of RepositoryEntity from API', () async {
      when(
        () => dio.get(any(), queryParameters: any(named: 'queryParameters')),
      ).thenAnswer(
        (_) async => Response(
          data: {
            'items': [
              {
                'id': 1,
                'name': 'flutter',
                'full_name': 'flutter/flutter',
                'description': 'desc',
                'html_url': 'url',
                'owner': {'login': 'flutter', 'avatar_url': 'avatar'},
              },
            ],
          },
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      final result = await repo.searchRepositories('flutter');
      expect(result, isA<List<RepositoryEntity>>());
      expect(result.first.fullName, 'flutter/flutter');
    });
  });
}

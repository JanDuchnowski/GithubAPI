import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/features/repo_details/data/repositories/github_repo_details_repository.dart';
import 'package:githubapi/features/repo_details/domain/entities/repo_details_entity.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('GithubRepoDetailsRepository', () {
    late MockDio dio;
    late GithubRepoDetailsRepository repo;

    setUp(() {
      dio = MockDio();
      repo = GithubRepoDetailsRepository(dio);
    });

    test('returns RepoDetailsEntity from API', () async {
      when(() => dio.get(any())).thenAnswer(
        (_) async => Response(
          data: {
            'name': 'flutter',
            'full_name': 'flutter/flutter',
            'description': 'desc',
            'stargazers_count': 1,
            'forks_count': 2,
            'watchers_count': 3,
            'language': 'Dart',
            'license': {'name': 'BSD'},
            'updated_at': 'now',
            'owner': {'login': 'flutter', 'avatar_url': 'avatar'},
          },
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      final result = await repo.fetchRepoDetails('flutter', 'flutter');
      expect(result, isA<RepoDetailsEntity>());
      expect(result.fullName, 'flutter/flutter');
      expect(result.license, 'BSD');
    });
  });
}

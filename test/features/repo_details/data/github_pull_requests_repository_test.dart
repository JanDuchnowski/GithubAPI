import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/features/repo_details/data/repositories/github_pull_requests_repository.dart';
import 'package:githubapi/features/repo_details/data/models/pull_request_model.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('GithubPullRequestsRepository', () {
    late MockDio dio;
    late GithubPullRequestsRepository repo;

    setUp(() {
      dio = MockDio();
      repo = GithubPullRequestsRepository(dio);
    });

    test('fetches pull requests with correct state', () async {
      when(
        () => dio.get(any(), queryParameters: any(named: 'queryParameters')),
      ).thenAnswer((invocation) async {
        final params =
            invocation.namedArguments[const Symbol('queryParameters')]
                as Map<String, dynamic>?;
        expect(params?['state'], 'open');
        return Response(
          data: [
            {
              'id': 1,
              'number': 10,
              'title': 'PR 1',
              'state': 'open',
              'html_url': 'http://example.com/pr',
              'user': {
                'login': 'a',
                'id': 1,
                'avatar_url': 'http://avatar',
                'html_url': 'http://user',
              },
              'body': 'body',
              'created_at': '',
              'updated_at': '',
              'closed_at': null,
              'merged_at': null,
            },
          ],
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        );
      });
      final result = await repo.fetchPullRequests(
        'flutter',
        'flutter',
        state: 'open',
      );
      expect(result, isA<List<PullRequestModel>>());
      expect(result.length, 1);
      expect(result.first.title, 'PR 1');
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/features/repo_details/data/repositories/github_issue_repository.dart';
import 'package:githubapi/features/repo_details/data/models/issue_model.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('GithubIssueRepository', () {
    late MockDio dio;
    late GithubIssueRepository repo;

    setUp(() {
      dio = MockDio();
      repo = GithubIssueRepository(dio);
    });

    test('returns only issues (not PRs) from API', () async {
      when(() => dio.get(any())).thenAnswer(
        (_) async => Response(
          data: [
            {
              'id': 1,
              'node_id': 'node1',
              'number': 101,
              'title': 'issue',
              'state': 'open',
              'html_url': 'http://example.com/issue',
              'body': 'body',
              'user': {
                'login': 'a',
                'id': 1,
                'node_id': 'u1',
                'avatar_url': 'http://avatar',
                'gravatar_id': '',
                'url': '',
                'html_url': '',
                'followers_url': '',
                'following_url': '',
                'gists_url': '',
                'starred_url': '',
                'subscriptions_url': '',
                'organizations_url': '',
                'repos_url': '',
                'events_url': '',
                'received_events_url': '',
                'type': '',
                'user_view_type': '',
                'site_admin': false,
              },
              'labels': [
                {
                  'id': 1,
                  'node_id': 'l1',
                  'url': '',
                  'name': 'bug',
                  'color': 'f00',
                  'isDefault': true,
                  'description': 'desc',
                },
              ],
              'locked': false,
              'comments': 0,
              'created_at': '',
              'updated_at': '',
              'closed_at': null,
              'author_association': '',
              'draft': false,
              'pull_request': null,
            },
            {
              'id': 2,
              'node_id': 'node2',
              'number': 102,
              'title': 'pr',
              'state': 'open',
              'html_url': 'http://example.com/pr',
              'body': 'body',
              'user': {
                'login': 'a',
                'id': 1,
                'node_id': 'u1',
                'avatar_url': 'http://avatar',
                'gravatar_id': '',
                'url': '',
                'html_url': '',
                'followers_url': '',
                'following_url': '',
                'gists_url': '',
                'starred_url': '',
                'subscriptions_url': '',
                'organizations_url': '',
                'repos_url': '',
                'events_url': '',
                'received_events_url': '',
                'type': '',
                'user_view_type': '',
                'site_admin': false,
              },
              'labels': [],
              'locked': false,
              'comments': 0,
              'created_at': '',
              'updated_at': '',
              'closed_at': null,
              'author_association': '',
              'draft': false,
              'pull_request': {
                'url': '',
                'html_url': '',
                'diff_url': '',
                'patch_url': '',
                'mergedAt': null,
              },
            },
          ],
          statusCode: 200,
          requestOptions: RequestOptions(path: ''),
        ),
      );
      final result = await repo.fetchIssues('flutter', 'flutter');
      expect(result, isA<List<IssueModel>>());
      expect(result.length, 1);
      expect(result.first.title, 'issue');
    });
  });
}

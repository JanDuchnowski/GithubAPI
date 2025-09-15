import 'package:network_image_mock/network_image_mock.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/main.dart';
import 'package:mocktail/mocktail.dart';
import 'package:githubapi/features/search/domain/search_repository.dart';
import 'package:githubapi/features/repo_details/domain/repositories/repo_details_repository.dart';
import 'package:githubapi/features/repo_details/domain/repositories/issue_repository.dart';
import 'package:githubapi/features/repo_details/domain/repositories/pull_requests_repository.dart';
import 'package:githubapi/features/search/domain/repository_entity.dart';
import 'package:githubapi/features/repo_details/domain/entities/repo_details_entity.dart';
import 'package:githubapi/features/repo_details/data/models/issue_model.dart';
import 'package:githubapi/features/repo_details/data/models/pull_request_model.dart';
import 'package:githubapi/features/repo_details/data/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:githubapi/features/search/presentation/search_provider.dart';
import 'package:githubapi/features/repo_details/presentation/providers/repo_details_provider.dart';
import 'package:githubapi/features/repo_details/presentation/providers/issues_provider.dart';
import 'package:githubapi/features/repo_details/presentation/providers/pull_requests_provider.dart';

// Mock classes
class MockSearchRepository extends Mock implements SearchRepository {}

class MockRepoDetailsRepository extends Mock implements RepoDetailsRepository {}

class MockIssueRepository extends Mock implements IssueRepository {}

class MockPullRequestsRepository extends Mock
    implements PullRequestsRepository {}

void main() {
  testWidgets('search, select repo, show details, show issues/PRs', (
    WidgetTester tester,
  ) async {
    await mockNetworkImagesFor(() async {
      // Arrange: Set up mocks and providers
      final mockSearchRepo = MockSearchRepository();
      final mockDetailsRepo = MockRepoDetailsRepository();
      final mockIssueRepo = MockIssueRepository();
      final mockPrRepo = MockPullRequestsRepository();

      // Example data
      final repoEntity = RepositoryEntity(
        id: 1,
        name: 'flutter',
        fullName: 'flutter/flutter',
        description: 'Flutter framework',
        stargazersCount: 123,
        htmlUrl: 'https://github.com/flutter/flutter',
        ownerLogin: 'flutter',
        ownerAvatarUrl: 'https://avatars.githubusercontent.com/u/14101776?v=4',
      );
      final repoDetails = RepoDetailsEntity(
        name: 'flutter',
        fullName: 'flutter/flutter',
        description: 'Flutter framework',
        stargazersCount: 123,
        forksCount: 45,
        watchersCount: 67,
        language: 'Dart',
        license: 'BSD',
        updatedAt: '202-06-01T00:00:00Z',
        ownerLogin: 'flutter',
        ownerAvatarUrl: 'https://avatars.githubusercontent.com/u/14101776?v=4',
      );
      final issues = [
        IssueModel(
          id: 1,
          nodeId: 'node1',
          number: 101,
          title: 'Sample issue',
          state: 'open',
          htmlUrl: 'https://github.com/flutter/flutter/issues/101',
          body: '',
          user: User(
            login: 'user1',
            id: 1,
            nodeId: 'node1',
            avatarUrl: '',
            gravatarId: '',
            url: '',
            htmlUrl: '',
            followersUrl: '',
            followingUrl: '',
            gistsUrl: '',
            starredUrl: '',
            subscriptionsUrl: '',
            organizationsUrl: '',
            reposUrl: '',
            eventsUrl: '',
            receivedEventsUrl: '',
            type: '',
            userViewType: '',
            siteAdmin: false,
          ),
          labels: const [],
          locked: false,
          comments: 0,
          createdAt: '',
          updatedAt: '',
          closedAt: null,
          authorAssociation: '',
          draft: false,
          pullRequest: null,
        ),
      ];
      final prs = [
        PullRequestModel(
          id: 1,
          number: 201,
          title: 'Sample PR',
          state: 'open',
          htmlUrl: 'https://github.com/flutter/flutter/pull/201',
          user: UserModel(login: 'user2', id: 2, avatarUrl: '', htmlUrl: ''),
          body: '',
          createdAt: '',
          updatedAt: '',
          closedAt: '',
          mergedAt: '',
        ),
      ];

      when(
        () => mockSearchRepo.searchRepositories('flutter'),
      ).thenAnswer((_) async => [repoEntity]);
      when(
        () => mockDetailsRepo.fetchRepoDetails('flutter', 'flutter'),
      ).thenAnswer((_) async => repoDetails);
      when(
        () => mockIssueRepo.fetchIssues('flutter', 'flutter'),
      ).thenAnswer((_) async => issues);
      when(
        () => mockPrRepo.fetchPullRequests(
          'flutter',
          'flutter',
          state: any(named: 'state'),
        ),
      ).thenAnswer((_) async => prs);

      // Override providers
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            githubSearchRepositoryProvider.overrideWith(
              (ref) => mockSearchRepo,
            ),
            repoDetailsRepositoryProvider.overrideWith(
              (ref) => mockDetailsRepo,
            ),
            issueRepositoryProvider.overrideWith((ref) => mockIssueRepo),
            pullRequestsRepositoryProvider.overrideWith((ref) => mockPrRepo),
          ],
          child: const MainApp(),
        ),
      );

      // Act: Search for repositories
      await tester.enterText(find.byType(TextField), 'flutter');
      await tester.pumpAndSettle();

      // Assert: Search results appear
      expect(find.text('flutter'), findsWidgets);

      // Act: Tap on the repository to view details
      await tester.tap(find.text('flutter'));
      await tester.pumpAndSettle();

      // Assert: Details are shown
      expect(find.text('Flutter framework'), findsOneWidget);
      // License may be in a different widget, so use a more flexible finder
      expect(
        find.byWidgetPredicate((widget) {
          if (widget is Text) {
            return widget.data?.contains('BSD') ?? false;
          }
          return false;
        }),
        findsWidgets,
      );

      // Act: Navigate to issues tab/list
      await tester.tap(find.text('Issues'));
      await tester.pumpAndSettle();

      // Assert: Issues are shown
      expect(find.text('Sample issue'), findsOneWidget);

      // Act: Navigate to PRs tab/list
      await tester.tap(find.text('Pull Requests'));
      await tester.pumpAndSettle();

      // Assert: PRs are shown
      expect(find.text('Sample PR'), findsOneWidget);
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/features/repo_details/presentation/views/pull_requests_list_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:githubapi/features/repo_details/domain/repositories/pull_requests_repository.dart';
import 'package:githubapi/features/repo_details/data/models/pull_request_model.dart';
import 'package:githubapi/features/repo_details/data/models/user_model.dart';
import 'package:githubapi/features/repo_details/presentation/providers/pull_requests_provider.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockPullRequestsRepository extends Mock
    implements PullRequestsRepository {}

void main() {
  testWidgets('shows pull requests list and toggles state', (
    WidgetTester tester,
  ) async {
    await mockNetworkImagesFor(() async {
      final mockRepo = MockPullRequestsRepository();
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
        () => mockRepo.fetchPullRequests(
          'flutter',
          'flutter',
          state: any(named: 'state'),
        ),
      ).thenAnswer((_) async => prs);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            pullRequestsRepositoryProvider.overrideWith((ref) => mockRepo),
          ],
          child: const MaterialApp(
            home: PullRequestsListScreen(owner: 'flutter', repo: 'flutter'),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Sample PR'), findsOneWidget);
      expect(find.text('open'), findsOneWidget);
      // Toggle to closed
      await tester.tap(find.text('Closed'));
      await tester.pumpAndSettle();
      // Should still show the same PR (mocked)
      expect(find.text('Sample PR'), findsOneWidget);
    });
  });
}

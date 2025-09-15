import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/features/repo_details/presentation/views/issues_list_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:githubapi/features/repo_details/domain/repositories/issue_repository.dart';
import 'package:githubapi/features/repo_details/data/models/issue_model.dart';
import 'package:githubapi/features/repo_details/presentation/providers/issues_provider.dart';
import 'package:githubapi/features/repo_details/data/models/user_model.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockIssueRepository extends Mock implements IssueRepository {}

void main() {
  testWidgets('shows issues list', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      final mockRepo = MockIssueRepository();
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
      when(
        () => mockRepo.fetchIssues('flutter', 'flutter'),
      ).thenAnswer((_) async => issues);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [issueRepositoryProvider.overrideWith((ref) => mockRepo)],
          child: const MaterialApp(
            home: IssuesListScreen(owner: 'flutter', repo: 'flutter'),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('Sample issue'), findsOneWidget);
      expect(find.text('#101 • user1'), findsOneWidget);
      expect(find.text('open'), findsOneWidget);
    });
  });
}

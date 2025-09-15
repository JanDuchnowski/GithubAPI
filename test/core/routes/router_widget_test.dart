import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:githubapi/core/routes/router.dart';
import 'package:githubapi/features/search/presentation/search_screen.dart';
import 'package:githubapi/features/repo_details/presentation/views/repo_details_screen.dart';
import 'package:githubapi/features/repo_details/domain/repositories/repo_details_repository.dart';
import 'package:githubapi/features/repo_details/domain/entities/repo_details_entity.dart';
import 'package:githubapi/features/repo_details/presentation/providers/repo_details_provider.dart';
import 'package:githubapi/features/search/domain/search_repository.dart';
import 'package:githubapi/features/search/presentation/search_provider.dart';

class MockRepoDetailsRepository extends Mock implements RepoDetailsRepository {}

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  group('Router Widget Navigation Tests', () {
    late MockRepoDetailsRepository mockRepoDetailsRepository;
    late MockSearchRepository mockSearchRepository;

    setUp(() {
      mockRepoDetailsRepository = MockRepoDetailsRepository();
      mockSearchRepository = MockSearchRepository();

      // Setup default mock responses
      when(
        () => mockRepoDetailsRepository.fetchRepoDetails(any(), any()),
      ).thenAnswer(
        (_) async => RepoDetailsEntity(
          name: 'test-repo',
          fullName: 'test-owner/test-repo',
          description: 'Test repository',
          stargazersCount: 123,
          watchersCount: 456,
          forksCount: 789,
          language: 'Dart',
          license: 'MIT',
          updatedAt: '2024-01-01T00:00:00Z',
          ownerLogin: 'test-owner',
          ownerAvatarUrl: 'https://example.com/avatar.png',
        ),
      );

      when(
        () => mockSearchRepository.searchRepositories(any()),
      ).thenAnswer((_) async => []);
    });

    testWidgets('navigates to SearchScreen on root path', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              githubSearchRepositoryProvider.overrideWithValue(
                mockSearchRepository,
              ),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Verify that we're on the SearchScreen
        expect(find.byType(SearchScreen), findsOneWidget);
      });
    });

    testWidgets('navigates to RepoDetailsScreen with correct parameters', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              repoDetailsRepositoryProvider.overrideWithValue(
                mockRepoDetailsRepository,
              ),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Navigate to repo details
        router.go('/repo/flutter/flutter');
        await tester.pumpAndSettle();

        // Verify that we're on the RepoDetailsScreen
        expect(find.byType(RepoDetailsScreen), findsOneWidget);
      });
    });

    testWidgets('handles path parameters correctly in repo route', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        const testOwner = 'testowner';
        const testRepo = 'testrepo';

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              repoDetailsRepositoryProvider.overrideWithValue(
                mockRepoDetailsRepository,
              ),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Navigate to specific repo
        router.go('/repo/$testOwner/$testRepo');
        await tester.pumpAndSettle();

        // Find the RepoDetailsScreen widget
        final repoDetailsWidget = tester.widget<RepoDetailsScreen>(
          find.byType(RepoDetailsScreen),
        );

        // Verify the parameters are passed correctly
        expect(repoDetailsWidget.owner, equals(testOwner));
        expect(repoDetailsWidget.repo, equals(testRepo));
      });
    });

    testWidgets('handles special characters in repo route parameters', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        const testOwner = 'test-owner.1';
        const testRepo = 'test_repo-2';

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              repoDetailsRepositoryProvider.overrideWithValue(
                mockRepoDetailsRepository,
              ),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Navigate to repo with special characters
        router.go('/repo/$testOwner/$testRepo');
        await tester.pumpAndSettle();

        // Find the RepoDetailsScreen widget
        final repoDetailsWidget = tester.widget<RepoDetailsScreen>(
          find.byType(RepoDetailsScreen),
        );

        // Verify the parameters with special characters are handled correctly
        expect(repoDetailsWidget.owner, equals(testOwner));
        expect(repoDetailsWidget.repo, equals(testRepo));
      });
    });

    testWidgets('successfully navigates to repo details screen', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              repoDetailsRepositoryProvider.overrideWithValue(
                mockRepoDetailsRepository,
              ),
              githubSearchRepositoryProvider.overrideWithValue(
                mockSearchRepository,
              ),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Navigate to repo details
        router.go('/repo/flutter/flutter');
        await tester.pumpAndSettle();
        expect(find.byType(RepoDetailsScreen), findsOneWidget);

        // Verify the repo details screen has correct parameters
        final repoDetailsWidget = tester.widget<RepoDetailsScreen>(
          find.byType(RepoDetailsScreen),
        );
        expect(repoDetailsWidget.owner, equals('flutter'));
        expect(repoDetailsWidget.repo, equals('flutter'));
      });
    });

    testWidgets('maintains state when navigating between routes', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              repoDetailsRepositoryProvider.overrideWithValue(
                mockRepoDetailsRepository,
              ),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Navigate to repo details
        router.go('/repo/owner1/repo1');
        await tester.pumpAndSettle();

        // Navigate to different repo
        router.go('/repo/owner2/repo2');
        await tester.pumpAndSettle();

        // Verify we're on the new repo details screen
        final repoDetailsWidget = tester.widget<RepoDetailsScreen>(
          find.byType(RepoDetailsScreen),
        );
        expect(repoDetailsWidget.owner, equals('owner2'));
        expect(repoDetailsWidget.repo, equals('repo2'));
      });
    });

    testWidgets('handles URL encoding in parameters', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              repoDetailsRepositoryProvider.overrideWithValue(
                mockRepoDetailsRepository,
              ),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Test with URL encoded characters
        const encodedOwner = 'test%20owner';
        const encodedRepo = 'test%2Drepo';

        router.go('/repo/$encodedOwner/$encodedRepo');
        await tester.pumpAndSettle();

        // The parameters should be decoded by GoRouter
        final repoDetailsWidget = tester.widget<RepoDetailsScreen>(
          find.byType(RepoDetailsScreen),
        );
        expect(repoDetailsWidget.owner, equals('test owner'));
        expect(repoDetailsWidget.repo, equals('test-repo'));
      });
    });

    testWidgets('handles navigation with query parameters', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              repoDetailsRepositoryProvider.overrideWithValue(
                mockRepoDetailsRepository,
              ),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Navigate with query parameters
        router.go('/repo/owner/repo?tab=issues');
        await tester.pumpAndSettle();

        // Should still show the repo details screen
        expect(find.byType(RepoDetailsScreen), findsOneWidget);

        final repoDetailsWidget = tester.widget<RepoDetailsScreen>(
          find.byType(RepoDetailsScreen),
        );
        expect(repoDetailsWidget.owner, equals('owner'));
        expect(repoDetailsWidget.repo, equals('repo'));
      });
    });
  });

  group('Router Error Handling Widget Tests', () {
    testWidgets('handles invalid routes gracefully in UI', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        final mockSearchRepo = MockSearchRepository();
        when(
          () => mockSearchRepo.searchRepositories(any()),
        ).thenAnswer((_) async => []);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              githubSearchRepositoryProvider.overrideWithValue(mockSearchRepo),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Try to navigate to an invalid route
        router.go('/invalid/route');
        await tester.pumpAndSettle();

        // Should not crash the app and might redirect to search or show an error page
        expect(tester.takeException(), isNull);
      });
    });

    testWidgets('handles missing path parameters in UI', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        final mockSearchRepo = MockSearchRepository();
        when(
          () => mockSearchRepo.searchRepositories(any()),
        ).thenAnswer((_) async => []);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              githubSearchRepositoryProvider.overrideWithValue(mockSearchRepo),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Try navigation with incomplete parameters
        router.go('/repo/');
        await tester.pumpAndSettle();

        // Should not crash the app
        expect(tester.takeException(), isNull);

        router.go('/repo/owner');
        await tester.pumpAndSettle();

        // Should not crash the app
        expect(tester.takeException(), isNull);
      });
    });
  });

  group('Router Navigation Performance Tests', () {
    testWidgets('handles rapid navigation changes without issues', (
      WidgetTester tester,
    ) async {
      await mockNetworkImagesFor(() async {
        final mockRepoDetailsRepo = MockRepoDetailsRepository();
        final mockSearchRepo = MockSearchRepository();

        when(
          () => mockRepoDetailsRepo.fetchRepoDetails(any(), any()),
        ).thenAnswer(
          (_) async => RepoDetailsEntity(
            name: 'test-repo',
            fullName: 'test-owner/test-repo',
            description: 'Test repository',
            stargazersCount: 123,
            watchersCount: 456,
            forksCount: 789,
            language: 'Dart',
            license: 'MIT',
            updatedAt: '2024-01-01T00:00:00Z',
            ownerLogin: 'test-owner',
            ownerAvatarUrl: 'https://example.com/avatar.png',
          ),
        );

        when(
          () => mockSearchRepo.searchRepositories(any()),
        ).thenAnswer((_) async => []);

        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              repoDetailsRepositoryProvider.overrideWithValue(
                mockRepoDetailsRepo,
              ),
              githubSearchRepositoryProvider.overrideWithValue(mockSearchRepo),
            ],
            child: MaterialApp.router(routerConfig: router),
          ),
        );

        // Rapid navigation sequence
        router.go('/repo/owner1/repo1');
        router.go('/');
        router.go('/repo/owner2/repo2');
        await tester.pumpAndSettle();

        // Should end up on the last navigation target without errors
        expect(find.byType(RepoDetailsScreen), findsOneWidget);
        final repoDetailsWidget = tester.widget<RepoDetailsScreen>(
          find.byType(RepoDetailsScreen),
        );
        expect(repoDetailsWidget.owner, equals('owner2'));
        expect(repoDetailsWidget.repo, equals('repo2'));

        // No exceptions should have been thrown
        expect(tester.takeException(), isNull);
      });
    });
  });
}

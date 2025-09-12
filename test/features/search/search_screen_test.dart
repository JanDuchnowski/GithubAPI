import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/features/search/presentation/search_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:githubapi/features/search/domain/search_repository.dart';
import 'package:githubapi/features/search/domain/repository_entity.dart';
import 'package:githubapi/features/search/presentation/search_provider.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockSearchRepository extends Mock implements SearchRepository {}

void main() {
  testWidgets('shows search results and handles empty state', (
    WidgetTester tester,
  ) async {
    await mockNetworkImagesFor(() async {
      final mockRepo = MockSearchRepository();
      final testRepos = [
        RepositoryEntity(
          id: 1,
          name: 'flutter',
          fullName: 'flutter/flutter',
          description: 'Flutter framework',
          stargazersCount: 123,
          htmlUrl: 'https://github.com/flutter/flutter',
          ownerLogin: 'flutter',
          ownerAvatarUrl:
              'https://avatars.githubusercontent.com/u/14101776?v=4',
        ),
      ];
      when(
        () => mockRepo.searchRepositories('flutter'),
      ).thenAnswer((_) async => testRepos);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            githubSearchRepositoryProvider.overrideWith((ref) => mockRepo),
          ],
          child: const MaterialApp(home: SearchScreen()),
        ),
      );
      await tester.enterText(find.byType(TextField), 'flutter');
      await tester.pumpAndSettle();
      expect(find.text('flutter/flutter'), findsOneWidget);
      expect(find.text('Flutter framework'), findsOneWidget);
    });
  });

  testWidgets('shows empty state when no results', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      final mockRepo = MockSearchRepository();
      when(
        () => mockRepo.searchRepositories('none'),
      ).thenAnswer((_) async => []);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            githubSearchRepositoryProvider.overrideWith((ref) => mockRepo),
          ],
          child: const MaterialApp(home: SearchScreen()),
        ),
      );
      await tester.enterText(find.byType(TextField), 'none');
      await tester.pumpAndSettle();
      expect(find.text('No repositories found.'), findsOneWidget);
    });
  });
}

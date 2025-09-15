import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:githubapi/features/repo_details/presentation/views/repo_details_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:githubapi/features/repo_details/domain/repositories/repo_details_repository.dart';
import 'package:githubapi/features/repo_details/domain/entities/repo_details_entity.dart';
import 'package:githubapi/features/repo_details/presentation/providers/repo_details_provider.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockRepoDetailsRepository extends Mock implements RepoDetailsRepository {}

void main() {
  testWidgets('shows repo details and info chips', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      final mockRepo = MockRepoDetailsRepository();
      final details = RepoDetailsEntity(
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
      when(
        () => mockRepo.fetchRepoDetails('flutter', 'flutter'),
      ).thenAnswer((_) async => details);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            repoDetailsRepositoryProvider.overrideWith((ref) => mockRepo),
          ],
          child: const MaterialApp(
            home: RepoDetailsScreen(owner: 'flutter', repo: 'flutter'),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.text('flutter/flutter'), findsOneWidget);
      expect(find.text('Flutter framework'), findsOneWidget);
      expect(find.text('BSD'), findsOneWidget);
      expect(find.text('Dart'), findsOneWidget);
      expect(find.text('123'), findsWidgets); // stars
      expect(find.text('45'), findsWidgets); // forks
      expect(find.text('67'), findsWidgets); // watchers
    });
  });
}

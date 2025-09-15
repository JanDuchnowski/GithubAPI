import 'package:githubapi/features/repo_details/presentation/views/repo_details_screen.dart';
import 'package:githubapi/features/search/presentation/search_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SearchScreen()),
    GoRoute(
      path: '/repo/:owner/:repo',
      builder: (context, state) {
        final owner = state.pathParameters['owner']!;
        final repo = state.pathParameters['repo']!;
        return RepoDetailsScreen(owner: owner, repo: repo);
      },
    ),
  ],
);

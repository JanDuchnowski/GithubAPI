import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:githubapi/features/repo_details/presentation/views/repo_details_screen.dart';
import 'package:githubapi/features/search/presentation/search_screen.dart';

import 'package:go_router/go_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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

    return ProviderScope(
      child: MaterialApp.router(
        title: 'GitHub Explorer',
        theme: ThemeData(primarySwatch: Colors.blue),
        routerConfig: router,
      ),
    );
  }
}

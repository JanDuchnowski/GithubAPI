import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import './search_provider.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchQueryProvider);
    final resultsAsync = ref.watch(searchResultsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search Repositories')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search GitHub repositories',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) =>
                  ref.read(searchQueryProvider.notifier).state = value,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: resultsAsync.when(
                data: (repos) => repos.isEmpty && query.isNotEmpty
                    ? const Center(child: Text('No repositories found.'))
                    : ListView.separated(
                        itemCount: repos.length,
                        separatorBuilder: (_, __) => const Divider(),
                        itemBuilder: (context, i) {
                          final repo = repos[i];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                repo.ownerAvatarUrl,
                              ),
                            ),
                            title: Text(repo.fullName),
                            subtitle: Text(repo.description ?? ''),

                            onTap: () {
                              context.push(
                                '/repo/${repo.ownerLogin}/${repo.name}',
                              );
                            },
                          );
                        },
                      ),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => Center(child: Text('Error: $e')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

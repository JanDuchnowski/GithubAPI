import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/repo_details_provider.dart';
import 'issues_list_screen.dart';
import 'pull_requests_list_screen.dart';

class RepoDetailsScreen extends ConsumerWidget {
  final String owner;
  final String repo;
  const RepoDetailsScreen({super.key, required this.owner, required this.repo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailsAsync = ref.watch(
      repoDetailsProvider((owner: owner, repo: repo)),
    );
    return Scaffold(
      appBar: AppBar(title: Text('$owner/$repo')),
      body: detailsAsync.when(
        data: (details) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(details.ownerAvatarUrl),
                    radius: 32,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          details.fullName,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          details.ownerLogin,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (details.description.isNotEmpty)
                Text(
                  details.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  _InfoChip(
                    icon: Icons.star,
                    label: 'Stars',
                    value: details.stargazersCount.toString(),
                  ),
                  _InfoChip(
                    icon: Icons.call_split,
                    label: 'Forks',
                    value: details.forksCount.toString(),
                  ),
                  _InfoChip(
                    icon: Icons.remove_red_eye,
                    label: 'Watchers',
                    value: details.watchersCount.toString(),
                  ),
                  if (details.language.isNotEmpty)
                    _InfoChip(
                      icon: Icons.code,
                      label: 'Language',
                      value: details.language,
                    ),
                  if (details.license != null && details.license!.isNotEmpty)
                    _InfoChip(
                      icon: Icons.book,
                      label: 'License',
                      value: details.license!,
                    ),
                  _InfoChip(
                    icon: Icons.update,
                    label: 'Updated',
                    value: details.updatedAt,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.error_outline),
                    label: const Text('Open Issues'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              IssuesListScreen(owner: owner, repo: repo),
                        ),
                      );
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.merge_type),
                    label: const Text('Pull Requests'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              PullRequestsListScreen(owner: owner, repo: repo),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoChip({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Chip(avatar: Icon(icon, size: 16), label: Text('$label: $value'));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/pull_requests_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PullRequestsListScreen extends ConsumerStatefulWidget {
  final String owner;
  final String repo;
  const PullRequestsListScreen({
    super.key,
    required this.owner,
    required this.repo,
  });

  @override
  ConsumerState<PullRequestsListScreen> createState() =>
      _PullRequestsListScreenState();
}

class _PullRequestsListScreenState
    extends ConsumerState<PullRequestsListScreen> {
  String _selectedState = 'open';

  @override
  Widget build(BuildContext context) {
    final prsAsync = ref.watch(
      pullRequestsProvider((
        owner: widget.owner,
        repo: widget.repo,
        state: _selectedState,
      )),
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Pull Requests')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ToggleButtons(
              isSelected: [
                _selectedState == 'open',
                _selectedState == 'closed',
                _selectedState == 'all',
              ],
              onPressed: (index) {
                setState(() {
                  _selectedState = ['open', 'closed', 'all'][index];
                });
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Open'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Closed'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('All'),
                ),
              ],
            ),
          ),
          Expanded(
            child: prsAsync.when(
              data: (prs) {
                if (prs.isEmpty) {
                  return Center(child: Text("No Pull Requests"));
                }
                return Center(
                  child: ListView.builder(
                    itemCount: prs.length,
                    itemBuilder: (context, index) {
                      final pr = prs[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(pr.user.avatarUrl),
                        ),
                        title: Text(pr.title),
                        subtitle: Text('#${pr.number} • ${pr.user.login}'),
                        trailing: Text(pr.state),
                        onTap: () => _openPR(context, pr.htmlUrl),
                      );
                    },
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }

  void _openPR(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open the link.')));
    }
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/issues_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class IssuesListScreen extends ConsumerWidget {
  final String owner;
  final String repo;
  const IssuesListScreen({super.key, required this.owner, required this.repo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final issuesAsync = ref.watch(issuesProvider((owner: owner, repo: repo)));
    return Scaffold(
      appBar: AppBar(title: Text('Issues')),
      body: issuesAsync.when(
        data: (issues) {
          if (issues.isEmpty) {
            return Center(child: Text("No issues"));
          }

          return ListView.builder(
            itemCount: issues.length,
            itemBuilder: (context, index) {
              final issue = issues[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(issue.user.avatarUrl),
                ),
                title: Text(issue.title),
                subtitle: Text('#${issue.number} • ${issue.user.login}'),
                trailing: Text(issue.state),
                onTap: () => _openIssue(context, issue.htmlUrl),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, stackTrace) {
          log("Error: $e, stackTrace: $stackTrace");
          return Center(child: Text('Error: $e'));
        },
      ),
    );
  }

  void _openIssue(BuildContext context, String url) async {
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

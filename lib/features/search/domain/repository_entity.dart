class RepositoryEntity {
  final int id;
  final String name;
  final String fullName;
  final String? description;
  final int stargazersCount;
  final String htmlUrl;
  final String ownerLogin;
  final String ownerAvatarUrl;

  RepositoryEntity({
    required this.id,
    required this.name,
    required this.fullName,
    required this.description,
    required this.stargazersCount,
    required this.htmlUrl,
    required this.ownerLogin,
    required this.ownerAvatarUrl,
  });
}

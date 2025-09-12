class RepoDetailsEntity {
  final String name;
  final String fullName;
  final String description;
  final int stargazersCount;
  final int forksCount;
  final int watchersCount;
  final String language;
  final String? license;
  final String updatedAt;
  final String ownerLogin;
  final String ownerAvatarUrl;

  RepoDetailsEntity({
    required this.name,
    required this.fullName,
    required this.description,
    required this.stargazersCount,
    required this.forksCount,
    required this.watchersCount,
    required this.language,
    required this.license,
    required this.updatedAt,
    required this.ownerLogin,
    required this.ownerAvatarUrl,
  });
}

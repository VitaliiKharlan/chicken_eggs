class LeaderboardItem {
  final String username;
  final int score;
  final bool isCurrentUser;

  LeaderboardItem({
    required this.username,
    required this.score,
    this.isCurrentUser = false,
  });
}

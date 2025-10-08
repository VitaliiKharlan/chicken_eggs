import 'dart:math';
import '../model/leaderboard_item.dart';


final Random _random = Random();

final List<LeaderboardItem> mockLeaderboard = [
  ...List.generate(20, (index) {
  final int score = _random.nextInt(201) * 10;
  return LeaderboardItem(username:'Player${index + 1}', score: score);

}),
  LeaderboardItem(
    username: 'You',
    score: 1340,
    isCurrentUser: true,
  ),
  ]..sort((a, b) => b.score.compareTo(a.score));

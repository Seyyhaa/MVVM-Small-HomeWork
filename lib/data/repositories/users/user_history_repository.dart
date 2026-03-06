abstract class UserHistoryRepository {
  List<String> fetchRecentSongId();

  void addSongToHistory(String id);
}

import 'package:my_app/data/repositories/users/user_history_repository.dart';

class UserHistoryRepositoryMock implements UserHistoryRepository {
  final List<String> recentSong = ['101','102'];
  @override
  void addSongToHistory(String id) {
    // TODO: implement addSongToHistory
    if (!recentSong.contains(id)) {
      recentSong.insert(0, id);
    }
  }

  @override
  List<String> fetchRecentSongId() {
    // TODO: implement fetchRecentSongId
    return recentSong;
  }
}

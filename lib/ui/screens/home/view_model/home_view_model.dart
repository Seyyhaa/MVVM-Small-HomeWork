import 'package:flutter/material.dart';
import 'package:my_app/data/repositories/songs/song_repository.dart';
import 'package:my_app/data/repositories/users/user_history_repository.dart';
import 'package:my_app/model/songs/song.dart';
import 'package:my_app/ui/states/player_state.dart';

class HomeViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final UserHistoryRepository userHistoryRepository;
  final PlayerState playerState;

  List<Song> recentSong = [];
  List<Song> recommendedSong = [];

  HomeViewModel(
    this.songRepository,
    this.userHistoryRepository,
    this.playerState,
  ) {
    init();
    playerState.addListener(notifyListeners);
  }

  void init() async {
    final recentId = userHistoryRepository.fetchRecentSongId();

    recentSong = recentId
        .map((id) => songRepository.fetchSongById(id)) //[Song,null,Song,Song]
        .whereType<Song>() //[Song,Song,Song]
        .toList();

    recommendedSong = songRepository.fetchSongs();
    notifyListeners();
  }

  bool isPlaying(Song song) => playerState.currentSong?.id == song.id;

  void toggle(Song song) {
    if (isPlaying(song)) {
      playerState.stop();
    } else {
      playerState.start(song);
    }
  }
}

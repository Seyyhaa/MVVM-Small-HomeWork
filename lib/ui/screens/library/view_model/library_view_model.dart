import 'package:flutter/material.dart';
import 'package:my_app/data/repositories/songs/song_repository.dart';
import 'package:my_app/model/songs/song.dart';
import 'package:my_app/ui/states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository repository;
  final PlayerState playerState;

  List<Song> _songs = [];

  LibraryViewModel(this.repository, this.playerState) {
    init();
    playerState.addListener(notifyListeners);
  }

  Future<void> init() async {
    _songs = await repository.fetchSongs();
    notifyListeners();
  }

  List<Song> get songs => _songs;

  Song? get currentSong => playerState.currentSong;

  void play(Song song) {
    playerState.start(song);
  }

  void stop() {
    playerState.stop();
  }

  bool isPlaying(Song song) {
    return playerState.currentSong == song;
  }

   void toggle(Song song) {
    if (isPlaying(song)) {
      stop();
    } else {
      play(song);
    }
  }
}

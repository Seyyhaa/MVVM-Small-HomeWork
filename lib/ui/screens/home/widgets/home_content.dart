import 'package:flutter/material.dart';
import 'package:my_app/model/songs/song.dart';
import 'package:my_app/ui/screens/home/view_model/home_view_model.dart';
import 'package:my_app/ui/states/settings_state.dart';
import 'package:my_app/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final settingsState = context.read<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Home", style: AppTextStyles.heading),
          SizedBox(height: 30),
          Text("Your recent songs"),
          Expanded(
            child: ListView(
              children: [
                ...vm.recentSong.map(
                  (song) => SongTile(
                    song: song,
                    isPlaying: vm.isPlaying(song),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("You might also like"),
                ...vm.recommendedSong.map(
                  (song) => SongTile(
                    song: song,
                    isPlaying: vm.isPlaying(song),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
  });

  final Song song;
  final bool isPlaying;


  @override
  Widget build(BuildContext context) {
    return ListTile(
     title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: const TextStyle(color: Colors.amber),
      ),
    );
  }
}

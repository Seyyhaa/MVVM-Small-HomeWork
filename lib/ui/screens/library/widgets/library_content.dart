import 'package:flutter/material.dart';
import 'package:my_app/model/songs/song.dart';
import 'package:my_app/ui/screens/library/view_model/library_view_model.dart';
import 'package:my_app/ui/states/settings_state.dart';
import 'package:my_app/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LibraryViewModel>();
    final settingsState = context.read<AppSettingsState>();

    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: vm.songs.length,
              itemBuilder: (context, index) => SongTile(
                song: vm.songs[index],
                isPlaying: vm.isPlaying(vm.songs[index]),
                onTap: () {
                  vm.toggle(vm.songs[index]);
                },
              ),
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
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}

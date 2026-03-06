import 'package:flutter/material.dart';
import 'package:my_app/data/repositories/songs/song_repository.dart';
import 'package:my_app/data/repositories/users/user_history_repository.dart';
import 'package:my_app/ui/screens/home/view_model/home_view_model.dart';
import 'package:my_app/ui/screens/home/widgets/home_content.dart';
import 'package:my_app/ui/states/player_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(
     context.read<SongRepository>(),
      context.read<UserHistoryRepository>(),
        context.read<PlayerState>(),
      ),
      child: const HomeContent(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bible_quiz_game/constants.dart';
import 'player_progress.dart';

class GamePoint extends StatelessWidget {
  const GamePoint({super.key});

  @override
  Widget build(BuildContext context) {
    final playerProgress = context.watch<PlayerProgress>();

    return ElevatedButton.icon(
      onPressed: () {},
      icon: diamond(size: 20),
      label: Text("${playerProgress.points}"),
    );
  }
}

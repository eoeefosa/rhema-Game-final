import 'package:flutter/material.dart';

/// An extremely silly example of a game state.
///
/// Tracks only a single variable, [progress], and calls [onWin] when
/// the value of [progress] reaches [goal].
class LevelState extends ChangeNotifier {
  final VoidCallback onWin;
  final bool questionisFinish;

  LevelState({required this.onWin, required this.questionisFinish});

  void evaluate() {
    print('Evaluate from level State called ');
    if (questionisFinish) {
      print('Question is finished Evaluate from level State called ');
      onWin();
    }
  }
}

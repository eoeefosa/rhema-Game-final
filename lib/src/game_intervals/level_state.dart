import 'package:flutter/material.dart';

/// An extremely silly example of a game state.
///
/// Tracks only a single variable, [progress], and calls [onWin] when
/// the value of [progress] reaches [goal].
class LevelState extends ChangeNotifier {
  final VoidCallback onWin;
  final bool questionisFinish;

  LevelState({required this.onWin, this.questionisFinish = false});

  void evaluate() {
    if (questionisFinish) {
      onWin();
    }
  }
}

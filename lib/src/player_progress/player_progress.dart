import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/provider/questions.dart';
import 'package:rhemabiblequiz/src/player_progress/persistence/player_progress.dart';
import 'package:rhemabiblequiz/src/style/constants.dart';


class PlayerProgress extends ChangeNotifier {
  // static const maxHighestScorePerPlayer = 10;
  final PlayerProgressPersistence _store;
  int _highestLevelReached = 0;
  int _points = AppConstants.gamePoints;

  PlayerProgress(PlayerProgressPersistence store) : _store = store;

  int get highestLevelReached => _highestLevelReached;

  int get points => _points;
  Future<void> getLatestFromStore() async {
    final level = await _store.getHighestLevelReached();
    final gamepoint = await _store.getPoint();
    if (level > _highestLevelReached) {
      _highestLevelReached = level;
      notifyListeners();
    } else if (level < _highestLevelReached) {
      await _store.saveHighestLevelReached(_highestLevelReached);
    }

    if (gamepoint > _points) {
      _points = gamepoint;
      notifyListeners();
    } else if (_points > gamepoint) {
      await _store.savePoint(_points);
    }
  }

  /// Resets the player's progress so it's like if they just started
  /// playing the game for the first time.
  void reset() {
    _highestLevelReached = 0;
    _points = AppConstants.gamePoints;
    notifyListeners();
    _store.saveHighestLevelReached(_highestLevelReached);
    _store.savePoint(_points);
  }

// TODO: CHECK IF YOU WILL USE THIS
  int get division {
    if (_points < 1200) return 3;
    if (_points < 2000) return 2;
    return 1;
  }

  void addPoints(int addedPoints) {
    _points += addedPoints;
    notifyListeners();
    unawaited(_store.savePoint(_points));
  }

  void nextLevel() {
    // TODO: MIGHT CHANGE THIS
    if (_highestLevelReached == Questions().questions.last.level) return;
    _highestLevelReached++;
  }

  /// Registers [level] as reached.
  ///
  /// If this is higher than [highestLevelReached], it will update that
  /// value and save it to the injected persistence store.
  void setLevelReached(int level) {
    /// check if level is possible
    if (level == Questions().questions.last.level) return;

    if (level > _highestLevelReached) {
      _highestLevelReached = level;
      notifyListeners();
      unawaited(_store.saveHighestLevelReached(level));
    }
  }

  void setPoint(int points) {
    if (points > _points) {
      _points = points;
      notifyListeners();
      unawaited(_store.savePoint(points));
    }
  }
}

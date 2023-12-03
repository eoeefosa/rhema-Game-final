import 'dart:async';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rhemabiblequiz/src/bible_quiz_game/provider/questions.dart';
import 'package:rhemabiblequiz/src/player_progress/persistence/player_progress.dart';
import 'package:rhemabiblequiz/src/style/constants.dart';

class PlayerProgress extends ChangeNotifier {
  // static const maxHighestScorePerPlayer = 10;
  final PlayerProgressPersistence _store;
  int _highestLevelReached = 0;
  int _points = AppConstants.gamePoints;
  int _totalstars = 0;
  int totalLevel = Questions().questions.last.level;
  List<int> _ratings = generateRatings(11);

  static List<int> generateRatings(int number) {
    return List.generate(number, (index) => 0);
  }

  int get totalstars => _totalstars;
  List<int> get ratings => _ratings;
  int get maxstarRequired => totalLevel * 3;

  void addStar({required int level, required int star}) {
    int prevRating = _ratings[level];
    if (prevRating < star) {
      _ratings[level] = star;
      _totalstars = _ratings.sum;
      updateLevel();
      notifyListeners();
    }
  }

  PlayerProgress(PlayerProgressPersistence store) : _store = store;

  int get highestLevelReached => _highestLevelReached;

  int get points => _points;
  Future<void> getLatestFromStore() async {
    final level = await _store.getHighestLevelReached();
    final gamepoint = await _store.getPoint();
    final gameStars = await _store.getStars();
    final saverating = await _store.getLevelRating(_highestLevelReached);
    //  UPDATE LEVEL
    if (level > _highestLevelReached) {
      _highestLevelReached = level;
      notifyListeners();
    } else if (level < _highestLevelReached) {
      await _store.saveHighestLevelReached(_highestLevelReached);
    }

    // UPDATE GAME POINT
    if (gamepoint > _points) {
      _points = gamepoint;
      notifyListeners();
    } else if (_points > gamepoint) {
      await _store.savePoint(_points);
    }
    // UPDATE STAR
    if (gameStars > _totalstars) {
      _totalstars = gameStars;
      notifyListeners();
    } else if (_totalstars > gameStars) {
      await _store.saveStars(_totalstars);
    }
    // UPDATE RATING
    if (_ratings[_highestLevelReached] > saverating) {
      _ratings[_highestLevelReached] = saverating;
      notifyListeners();
    } else if (_ratings[_highestLevelReached] < saverating) {
      await _store.saveRating(
        resetRatings: false,
        rating: _ratings[_highestLevelReached],
        levelindex: _highestLevelReached,
      );
    }
  }

  /// Resets the player's progress so it's like if they just started
  /// playing the game for the first time.
  void reset() {
    final int prevhighestlevel = _highestLevelReached;
    _highestLevelReached = 0;
    _points = AppConstants.gamePoints;
    _ratings = generateRatings(totalLevel);
    _points = AppConstants.gamePoints;
    _totalstars = 0;

    _store.saveHighestLevelReached(_highestLevelReached);
    _store.savePoint(_points);
    _store.saveStars(0);
    _store.saveRating(
        levelindex: prevhighestlevel, rating: 0, resetRatings: true);
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

  int sumofStart(int stageindex) {
    int half = ((stageindex + 1) * 3 / 2).floor();
    return half + stageindex + 1;
  }

  void updateLevel() {
    var requiredstar = sumofStart(_highestLevelReached);
    if (_totalstars < requiredstar) {
      _highestLevelReached++;
      notifyListeners();
    }
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

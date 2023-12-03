import 'package:rhemabiblequiz/src/player_progress/persistence/player_progress.dart';
import 'package:rhemabiblequiz/src/style/constants.dart';

/// An in-memory implementation oƒ [PLayerProgressPersistence].
/// Usefull for testing

class MemoryOnlyPlayerProgressPersistence implements PlayerProgressPersistence {
  int level = 0;
  int gamepoint = AppConstants.gamePoints;
  @override
  Future<int> getHighestLevelReached() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return level;
  }

  @override
  Future<void> saveHighestLevelReached(int level) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    this.level = level;
  }

  @override
  Future<int> getPoint() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return gamepoint;
  }

  @override
  Future<void> savePoint(int point) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    gamepoint = point;
  }
}

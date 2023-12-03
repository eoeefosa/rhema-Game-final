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
  
  @override
  Future<int> getLevelRating(int level) {
    // TODO: implement getLevelRating
    throw UnimplementedError();
  }
  
  @override
  Future<int> getStars() {
    // TODO: implement getStars
    throw UnimplementedError();
  }
  
  @override
  Future<void> saveRating({int? rating, int? levelindex, bool? resetRatings}) {
    // TODO: implement saveRating
    throw UnimplementedError();
  }
  
  @override
  Future<void> saveStars(int totalStar) {
    // TODO: implement saveStars
    throw UnimplementedError();
  }
}

// An implementation of [PlayerProgressPersistence] that uses
//  `package:shared_oreference`

import 'package:rhemabiblequiz/src/style/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rhemabiblequiz/src/player_progress/persistence/player_progress.dart';

class LocalStoragePlayerProgressPersistence extends PlayerProgressPersistence {
  final Future<SharedPreferences> instanceFuture =
      SharedPreferences.getInstance();
  @override
  Future<int> getHighestLevelReached() async {
    final prefs = await instanceFuture;
    return prefs.getInt('highestLevelReached') ?? 0;
  }

  @override
  Future<void> saveHighestLevelReached(int level) async {
    final prefs = await instanceFuture;
    await prefs.setInt('highestLevelReached', level);
  }

  @override
  Future<int> getPoint() async {
    final prefs = await instanceFuture;
    return prefs.getInt('gamepoints') ?? AppConstants.gamePoints;
  }

  @override
  Future<void> savePoint(int point) async {
    final prefs = await instanceFuture;
    await prefs.setInt('gamepoints', point);
  }

  @override
  Future<int> getLevelRating(int level) async {
    final prefs = await instanceFuture;
    return prefs.getInt('LevelRating$level') ?? 0;
  }

  @override
  Future<int> getStars() async {
    final prefs = await instanceFuture;
    return prefs.getInt('Stars') ?? 0;
  }

  @override
  Future<void> saveStars(int totalStar) async {
    final prefs = await instanceFuture;
    await prefs.setInt('Stars', totalStar);
  }

  @override
  Future<void> saveRating(
      {int rating = 0,
      required int levelindex,
      bool resetRatings = false}) async {
    print(
        'from local_Storage_persistence rating=$rating, resetRating=$resetRatings');
    final prefs = await instanceFuture;
    if (resetRatings) {
      for (int level = 0; level < levelindex + 1; level++) {
        prefs.remove('LevelRating$level');
      }
    }
    {
      await prefs.setInt('LevelRating$levelindex', rating);
    }
  }
}

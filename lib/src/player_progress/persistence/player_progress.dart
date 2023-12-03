abstract class PlayerProgressPersistence {
  Future<int> getHighestLevelReached();
  Future<int> getPoint();
  Future<int> getStars();
  Future<int> getLevelRating(int level);

  Future<void> saveHighestLevelReached(int level);
  Future<void> savePoint(int point);
  Future<void> saveStars(int totalStar);

  /// when reseting rating=0, levelindex=highestlevelindex
  Future<void> saveRating({
     required int rating,
    required int levelindex,
     required bool resetRatings,
  });
}

abstract class PlayerProgressPersistence {
  Future<int> getHighestLevelReached();

  Future<void> saveHighestLevelReached(int level);
  Future<void> savePoint(int point);
  Future<int> getPoint();
}

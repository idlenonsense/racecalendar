import '../models/race_model.dart' as models;

/// Заглушка базы данных для веба (ничего не делает)
class AppDatabase {
  Future<void> insertRace(models.RaceModel race, int season) async {}
  Future<void> insertCircuit(models.CircuitModel circuit) async {}
  Future<List<models.RaceModel>> getRacesForSeason(int season) async => [];
  Future<void> clearAll() async {}
}
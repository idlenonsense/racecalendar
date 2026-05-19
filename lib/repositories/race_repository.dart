import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../database/database.dart';
import '../models/race_model.dart' as models;
import '../services/f1_api_client.dart';

part 'race_repository.g.dart';

class RaceRepository {
  late final F1ApiClient _apiClient;
  late final AppDatabase _database;

  RaceRepository() {
    _apiClient = F1ApiClient();
    _database = AppDatabase();
  }

  Future<List<models.RaceModel>> getCurrentSeasonRaces() async {
    const int currentSeason = 2026;

    try {
      print('🌐 Пытаемся загрузить данные из API...');
      final races = await _apiClient.fetchCurrentSeasonRaces();
      print('✅ Успешно загружено ${races.length} гонок из API');
      await _saveRacesToDb(races, currentSeason);
      return races;
    } catch (e) {
      print('❌ Ошибка загрузки из API: $e');
      print('💾 Пытаемся загрузить из кэша...');
      final cachedRaces = await _database.getRacesForSeason(currentSeason);
      if (cachedRaces.isEmpty) {
        print('❌ Кэш пуст!');
        throw Exception('Нет данных в кэше и нет подключения к интернету');
      }
      print('✅ Загружено ${cachedRaces.length} гонок из кэша');
      return cachedRaces;
    }
  }

  Future<void> _saveRacesToDb(List<models.RaceModel> races, int season) async {
    for (var race in races) {
      await _database.insertCircuit(race.circuit);
      await _database.insertRace(race, season);
    }
  }

  Future<void> clearCache() async {
    await _database.clearAll();
  }

  Future<models.RaceModel> getRaceByID(String raceID) async {
    try {
      print('🌐 Пытаемся загрузить данные из API...');
      final race = await _apiClient.fetchRaceDetails(raceID);
      return race;
    } catch (e) {
      print('❌ Ошибка загрузки из API: $e');
      throw Exception('Нет подключения к интернету');
    }
  }
}

@Riverpod(keepAlive: true)
RaceRepository raceRepository(RaceRepositoryRef ref) {
  return RaceRepository();
}


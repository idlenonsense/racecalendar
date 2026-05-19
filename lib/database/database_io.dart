import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tables.dart';
import '../models/race_model.dart' as models;

part 'database_io.g.dart';

@DriftDatabase(tables: [Races, Circuits])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> insertRace(models.RaceModel race, int season) async {
    final companion = RacesCompanion(
      raceId: Value(race.raceId),
      round: Value(race.round),
      raceName: Value(race.raceName),
      season: Value(season),
      circuitId: Value(race.circuit.circuitId),
      raceDate: Value(race.schedule.race?.date),
      qualyDate: Value(race.schedule.qualy?.date),
      fp1Date: Value(race.schedule.fp1?.date),
      fp2Date: Value(race.schedule.fp2?.date),
      fp3Date: Value(race.schedule.fp3?.date),
      sprintQualyDate: Value(race.schedule.sprintQualy?.date),
      sprintRaceDate: Value(race.schedule.sprintRace?.date),
    );
    await into(races).insertOnConflictUpdate(companion);
  }

  Future<void> insertCircuit(models.CircuitModel circuit) async {
    final companion = CircuitsCompanion(
      circuitId: Value(circuit.circuitId),
      circuitName: Value(circuit.circuitName),
      country: Value(circuit.country),
      city: Value(circuit.city),
      circuitLength: Value(circuit.circuitLength),
      lapRecord: Value(circuit.lapRecord),
      firstParticipationYear: Value(circuit.firstParticipationYear),
      corners: Value(circuit.corners),
      url: Value(circuit.url),
    );
    await into(circuits).insertOnConflictUpdate(companion);
  }

  // Получение всех гонок для сезона
  Future<List<models.RaceModel>> getRacesForSeason(int season) async {
    final raceRows = await (select(races)
      ..where((tbl) => tbl.season.equals(season))
      ..orderBy([(t) => OrderingTerm(expression: t.round)]))
        .get();

    List<models.RaceModel> result = [];
    for (var raceRow in raceRows) {
      final circuitRow = await (select(circuits)
        ..where((t) => t.circuitId.equals(raceRow.circuitId)))
          .getSingleOrNull();

      if (circuitRow != null) {
        result.add(raceRow.toModel(circuitRow.toModel()));
      }
    }
    return result;
  }

  Future<void> clearAll() async {
    await delete(races).go();
    await delete(circuits).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'f1_calendar.sqlite'));
    return NativeDatabase(file);
  });
}

extension RaceRowToModel on Race {
  models.RaceModel toModel(models.CircuitModel circuitModel) {
    return models.RaceModel(
      raceId: raceId,
      raceName: raceName,
      round: round,
      circuit: circuitModel,
      schedule: models.RaceSchedule(
        race: raceDate != null ? models.SessionDetails(date: raceDate!) : null,
        qualy: qualyDate != null ? models.SessionDetails(date: qualyDate!) : null,
        fp1: fp1Date != null ? models.SessionDetails(date: fp1Date!) : null,
        fp2: fp2Date != null ? models.SessionDetails(date: fp2Date!) : null,
        fp3: fp3Date != null ? models.SessionDetails(date: fp3Date!) : null,
        sprintQualy: sprintQualyDate != null ? models.SessionDetails(date: sprintQualyDate!) : null,
        sprintRace: sprintRaceDate != null ? models.SessionDetails(date: sprintRaceDate!) : null,
      ),
      laps: null,
    );
  }
}

extension CircuitRowToModel on Circuit {
  models.CircuitModel toModel() {
    return models.CircuitModel(
      circuitId: circuitId,
      circuitName: circuitName,
      country: country,
      city: city,
      circuitLength: circuitLength,
      lapRecord: lapRecord,
      firstParticipationYear: firstParticipationYear,
      corners: corners,
      fastestLapDriverId: null,
      fastestLapTeamId: null,
      fastestLapYear: null,
      url: url,
    );
  }
}
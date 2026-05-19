import 'package:drift/drift.dart';

class Races extends Table {
  TextColumn get raceId => text().unique()();
  IntColumn get round => integer()();
  TextColumn get raceName => text().nullable()();
  IntColumn get season => integer()();
  TextColumn get circuitId => text()();

  DateTimeColumn get raceDate => dateTime().nullable()();

  DateTimeColumn get qualyDate => dateTime().nullable()();
  DateTimeColumn get fp1Date => dateTime().nullable()();
  DateTimeColumn get fp2Date => dateTime().nullable()();
  DateTimeColumn get fp3Date => dateTime().nullable()();
  DateTimeColumn get sprintQualyDate => dateTime().nullable()();
  DateTimeColumn get sprintRaceDate => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {raceId};
}

class Circuits extends Table {
  TextColumn get circuitId => text().unique()();
  TextColumn get circuitName => text()();
  TextColumn get country => text()();
  TextColumn get city => text()();
  TextColumn get circuitLength => text()();
  TextColumn get lapRecord => text().nullable()();
  IntColumn get firstParticipationYear => integer()();
  IntColumn get corners => integer()();
  TextColumn get url => text()();

  @override
  Set<Column> get primaryKey => {circuitId};
}
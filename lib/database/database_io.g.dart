// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_io.dart';

// ignore_for_file: type=lint
class $RacesTable extends Races with TableInfo<$RacesTable, Race> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _raceIdMeta = const VerificationMeta('raceId');
  @override
  late final GeneratedColumn<String> raceId = GeneratedColumn<String>(
    'race_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _roundMeta = const VerificationMeta('round');
  @override
  late final GeneratedColumn<int> round = GeneratedColumn<int>(
    'round',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _raceNameMeta = const VerificationMeta(
    'raceName',
  );
  @override
  late final GeneratedColumn<String> raceName = GeneratedColumn<String>(
    'race_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seasonMeta = const VerificationMeta('season');
  @override
  late final GeneratedColumn<int> season = GeneratedColumn<int>(
    'season',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _circuitIdMeta = const VerificationMeta(
    'circuitId',
  );
  @override
  late final GeneratedColumn<String> circuitId = GeneratedColumn<String>(
    'circuit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _raceDateMeta = const VerificationMeta(
    'raceDate',
  );
  @override
  late final GeneratedColumn<DateTime> raceDate = GeneratedColumn<DateTime>(
    'race_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _qualyDateMeta = const VerificationMeta(
    'qualyDate',
  );
  @override
  late final GeneratedColumn<DateTime> qualyDate = GeneratedColumn<DateTime>(
    'qualy_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fp1DateMeta = const VerificationMeta(
    'fp1Date',
  );
  @override
  late final GeneratedColumn<DateTime> fp1Date = GeneratedColumn<DateTime>(
    'fp1_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fp2DateMeta = const VerificationMeta(
    'fp2Date',
  );
  @override
  late final GeneratedColumn<DateTime> fp2Date = GeneratedColumn<DateTime>(
    'fp2_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fp3DateMeta = const VerificationMeta(
    'fp3Date',
  );
  @override
  late final GeneratedColumn<DateTime> fp3Date = GeneratedColumn<DateTime>(
    'fp3_date',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sprintQualyDateMeta = const VerificationMeta(
    'sprintQualyDate',
  );
  @override
  late final GeneratedColumn<DateTime> sprintQualyDate =
      GeneratedColumn<DateTime>(
        'sprint_qualy_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _sprintRaceDateMeta = const VerificationMeta(
    'sprintRaceDate',
  );
  @override
  late final GeneratedColumn<DateTime> sprintRaceDate =
      GeneratedColumn<DateTime>(
        'sprint_race_date',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    raceId,
    round,
    raceName,
    season,
    circuitId,
    raceDate,
    qualyDate,
    fp1Date,
    fp2Date,
    fp3Date,
    sprintQualyDate,
    sprintRaceDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'races';
  @override
  VerificationContext validateIntegrity(
    Insertable<Race> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('race_id')) {
      context.handle(
        _raceIdMeta,
        raceId.isAcceptableOrUnknown(data['race_id']!, _raceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_raceIdMeta);
    }
    if (data.containsKey('round')) {
      context.handle(
        _roundMeta,
        round.isAcceptableOrUnknown(data['round']!, _roundMeta),
      );
    } else if (isInserting) {
      context.missing(_roundMeta);
    }
    if (data.containsKey('race_name')) {
      context.handle(
        _raceNameMeta,
        raceName.isAcceptableOrUnknown(data['race_name']!, _raceNameMeta),
      );
    }
    if (data.containsKey('season')) {
      context.handle(
        _seasonMeta,
        season.isAcceptableOrUnknown(data['season']!, _seasonMeta),
      );
    } else if (isInserting) {
      context.missing(_seasonMeta);
    }
    if (data.containsKey('circuit_id')) {
      context.handle(
        _circuitIdMeta,
        circuitId.isAcceptableOrUnknown(data['circuit_id']!, _circuitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_circuitIdMeta);
    }
    if (data.containsKey('race_date')) {
      context.handle(
        _raceDateMeta,
        raceDate.isAcceptableOrUnknown(data['race_date']!, _raceDateMeta),
      );
    }
    if (data.containsKey('qualy_date')) {
      context.handle(
        _qualyDateMeta,
        qualyDate.isAcceptableOrUnknown(data['qualy_date']!, _qualyDateMeta),
      );
    }
    if (data.containsKey('fp1_date')) {
      context.handle(
        _fp1DateMeta,
        fp1Date.isAcceptableOrUnknown(data['fp1_date']!, _fp1DateMeta),
      );
    }
    if (data.containsKey('fp2_date')) {
      context.handle(
        _fp2DateMeta,
        fp2Date.isAcceptableOrUnknown(data['fp2_date']!, _fp2DateMeta),
      );
    }
    if (data.containsKey('fp3_date')) {
      context.handle(
        _fp3DateMeta,
        fp3Date.isAcceptableOrUnknown(data['fp3_date']!, _fp3DateMeta),
      );
    }
    if (data.containsKey('sprint_qualy_date')) {
      context.handle(
        _sprintQualyDateMeta,
        sprintQualyDate.isAcceptableOrUnknown(
          data['sprint_qualy_date']!,
          _sprintQualyDateMeta,
        ),
      );
    }
    if (data.containsKey('sprint_race_date')) {
      context.handle(
        _sprintRaceDateMeta,
        sprintRaceDate.isAcceptableOrUnknown(
          data['sprint_race_date']!,
          _sprintRaceDateMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {raceId};
  @override
  Race map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Race(
      raceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}race_id'],
      )!,
      round: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}round'],
      )!,
      raceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}race_name'],
      ),
      season: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}season'],
      )!,
      circuitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}circuit_id'],
      )!,
      raceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}race_date'],
      ),
      qualyDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}qualy_date'],
      ),
      fp1Date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fp1_date'],
      ),
      fp2Date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fp2_date'],
      ),
      fp3Date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}fp3_date'],
      ),
      sprintQualyDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sprint_qualy_date'],
      ),
      sprintRaceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}sprint_race_date'],
      ),
    );
  }

  @override
  $RacesTable createAlias(String alias) {
    return $RacesTable(attachedDatabase, alias);
  }
}

class Race extends DataClass implements Insertable<Race> {
  final String raceId;
  final int round;
  final String? raceName;
  final int season;
  final String circuitId;
  final DateTime? raceDate;
  final DateTime? qualyDate;
  final DateTime? fp1Date;
  final DateTime? fp2Date;
  final DateTime? fp3Date;
  final DateTime? sprintQualyDate;
  final DateTime? sprintRaceDate;
  const Race({
    required this.raceId,
    required this.round,
    this.raceName,
    required this.season,
    required this.circuitId,
    this.raceDate,
    this.qualyDate,
    this.fp1Date,
    this.fp2Date,
    this.fp3Date,
    this.sprintQualyDate,
    this.sprintRaceDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['race_id'] = Variable<String>(raceId);
    map['round'] = Variable<int>(round);
    if (!nullToAbsent || raceName != null) {
      map['race_name'] = Variable<String>(raceName);
    }
    map['season'] = Variable<int>(season);
    map['circuit_id'] = Variable<String>(circuitId);
    if (!nullToAbsent || raceDate != null) {
      map['race_date'] = Variable<DateTime>(raceDate);
    }
    if (!nullToAbsent || qualyDate != null) {
      map['qualy_date'] = Variable<DateTime>(qualyDate);
    }
    if (!nullToAbsent || fp1Date != null) {
      map['fp1_date'] = Variable<DateTime>(fp1Date);
    }
    if (!nullToAbsent || fp2Date != null) {
      map['fp2_date'] = Variable<DateTime>(fp2Date);
    }
    if (!nullToAbsent || fp3Date != null) {
      map['fp3_date'] = Variable<DateTime>(fp3Date);
    }
    if (!nullToAbsent || sprintQualyDate != null) {
      map['sprint_qualy_date'] = Variable<DateTime>(sprintQualyDate);
    }
    if (!nullToAbsent || sprintRaceDate != null) {
      map['sprint_race_date'] = Variable<DateTime>(sprintRaceDate);
    }
    return map;
  }

  RacesCompanion toCompanion(bool nullToAbsent) {
    return RacesCompanion(
      raceId: Value(raceId),
      round: Value(round),
      raceName: raceName == null && nullToAbsent
          ? const Value.absent()
          : Value(raceName),
      season: Value(season),
      circuitId: Value(circuitId),
      raceDate: raceDate == null && nullToAbsent
          ? const Value.absent()
          : Value(raceDate),
      qualyDate: qualyDate == null && nullToAbsent
          ? const Value.absent()
          : Value(qualyDate),
      fp1Date: fp1Date == null && nullToAbsent
          ? const Value.absent()
          : Value(fp1Date),
      fp2Date: fp2Date == null && nullToAbsent
          ? const Value.absent()
          : Value(fp2Date),
      fp3Date: fp3Date == null && nullToAbsent
          ? const Value.absent()
          : Value(fp3Date),
      sprintQualyDate: sprintQualyDate == null && nullToAbsent
          ? const Value.absent()
          : Value(sprintQualyDate),
      sprintRaceDate: sprintRaceDate == null && nullToAbsent
          ? const Value.absent()
          : Value(sprintRaceDate),
    );
  }

  factory Race.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Race(
      raceId: serializer.fromJson<String>(json['raceId']),
      round: serializer.fromJson<int>(json['round']),
      raceName: serializer.fromJson<String?>(json['raceName']),
      season: serializer.fromJson<int>(json['season']),
      circuitId: serializer.fromJson<String>(json['circuitId']),
      raceDate: serializer.fromJson<DateTime?>(json['raceDate']),
      qualyDate: serializer.fromJson<DateTime?>(json['qualyDate']),
      fp1Date: serializer.fromJson<DateTime?>(json['fp1Date']),
      fp2Date: serializer.fromJson<DateTime?>(json['fp2Date']),
      fp3Date: serializer.fromJson<DateTime?>(json['fp3Date']),
      sprintQualyDate: serializer.fromJson<DateTime?>(json['sprintQualyDate']),
      sprintRaceDate: serializer.fromJson<DateTime?>(json['sprintRaceDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'raceId': serializer.toJson<String>(raceId),
      'round': serializer.toJson<int>(round),
      'raceName': serializer.toJson<String?>(raceName),
      'season': serializer.toJson<int>(season),
      'circuitId': serializer.toJson<String>(circuitId),
      'raceDate': serializer.toJson<DateTime?>(raceDate),
      'qualyDate': serializer.toJson<DateTime?>(qualyDate),
      'fp1Date': serializer.toJson<DateTime?>(fp1Date),
      'fp2Date': serializer.toJson<DateTime?>(fp2Date),
      'fp3Date': serializer.toJson<DateTime?>(fp3Date),
      'sprintQualyDate': serializer.toJson<DateTime?>(sprintQualyDate),
      'sprintRaceDate': serializer.toJson<DateTime?>(sprintRaceDate),
    };
  }

  Race copyWith({
    String? raceId,
    int? round,
    Value<String?> raceName = const Value.absent(),
    int? season,
    String? circuitId,
    Value<DateTime?> raceDate = const Value.absent(),
    Value<DateTime?> qualyDate = const Value.absent(),
    Value<DateTime?> fp1Date = const Value.absent(),
    Value<DateTime?> fp2Date = const Value.absent(),
    Value<DateTime?> fp3Date = const Value.absent(),
    Value<DateTime?> sprintQualyDate = const Value.absent(),
    Value<DateTime?> sprintRaceDate = const Value.absent(),
  }) => Race(
    raceId: raceId ?? this.raceId,
    round: round ?? this.round,
    raceName: raceName.present ? raceName.value : this.raceName,
    season: season ?? this.season,
    circuitId: circuitId ?? this.circuitId,
    raceDate: raceDate.present ? raceDate.value : this.raceDate,
    qualyDate: qualyDate.present ? qualyDate.value : this.qualyDate,
    fp1Date: fp1Date.present ? fp1Date.value : this.fp1Date,
    fp2Date: fp2Date.present ? fp2Date.value : this.fp2Date,
    fp3Date: fp3Date.present ? fp3Date.value : this.fp3Date,
    sprintQualyDate: sprintQualyDate.present
        ? sprintQualyDate.value
        : this.sprintQualyDate,
    sprintRaceDate: sprintRaceDate.present
        ? sprintRaceDate.value
        : this.sprintRaceDate,
  );
  Race copyWithCompanion(RacesCompanion data) {
    return Race(
      raceId: data.raceId.present ? data.raceId.value : this.raceId,
      round: data.round.present ? data.round.value : this.round,
      raceName: data.raceName.present ? data.raceName.value : this.raceName,
      season: data.season.present ? data.season.value : this.season,
      circuitId: data.circuitId.present ? data.circuitId.value : this.circuitId,
      raceDate: data.raceDate.present ? data.raceDate.value : this.raceDate,
      qualyDate: data.qualyDate.present ? data.qualyDate.value : this.qualyDate,
      fp1Date: data.fp1Date.present ? data.fp1Date.value : this.fp1Date,
      fp2Date: data.fp2Date.present ? data.fp2Date.value : this.fp2Date,
      fp3Date: data.fp3Date.present ? data.fp3Date.value : this.fp3Date,
      sprintQualyDate: data.sprintQualyDate.present
          ? data.sprintQualyDate.value
          : this.sprintQualyDate,
      sprintRaceDate: data.sprintRaceDate.present
          ? data.sprintRaceDate.value
          : this.sprintRaceDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Race(')
          ..write('raceId: $raceId, ')
          ..write('round: $round, ')
          ..write('raceName: $raceName, ')
          ..write('season: $season, ')
          ..write('circuitId: $circuitId, ')
          ..write('raceDate: $raceDate, ')
          ..write('qualyDate: $qualyDate, ')
          ..write('fp1Date: $fp1Date, ')
          ..write('fp2Date: $fp2Date, ')
          ..write('fp3Date: $fp3Date, ')
          ..write('sprintQualyDate: $sprintQualyDate, ')
          ..write('sprintRaceDate: $sprintRaceDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    raceId,
    round,
    raceName,
    season,
    circuitId,
    raceDate,
    qualyDate,
    fp1Date,
    fp2Date,
    fp3Date,
    sprintQualyDate,
    sprintRaceDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Race &&
          other.raceId == this.raceId &&
          other.round == this.round &&
          other.raceName == this.raceName &&
          other.season == this.season &&
          other.circuitId == this.circuitId &&
          other.raceDate == this.raceDate &&
          other.qualyDate == this.qualyDate &&
          other.fp1Date == this.fp1Date &&
          other.fp2Date == this.fp2Date &&
          other.fp3Date == this.fp3Date &&
          other.sprintQualyDate == this.sprintQualyDate &&
          other.sprintRaceDate == this.sprintRaceDate);
}

class RacesCompanion extends UpdateCompanion<Race> {
  final Value<String> raceId;
  final Value<int> round;
  final Value<String?> raceName;
  final Value<int> season;
  final Value<String> circuitId;
  final Value<DateTime?> raceDate;
  final Value<DateTime?> qualyDate;
  final Value<DateTime?> fp1Date;
  final Value<DateTime?> fp2Date;
  final Value<DateTime?> fp3Date;
  final Value<DateTime?> sprintQualyDate;
  final Value<DateTime?> sprintRaceDate;
  final Value<int> rowid;
  const RacesCompanion({
    this.raceId = const Value.absent(),
    this.round = const Value.absent(),
    this.raceName = const Value.absent(),
    this.season = const Value.absent(),
    this.circuitId = const Value.absent(),
    this.raceDate = const Value.absent(),
    this.qualyDate = const Value.absent(),
    this.fp1Date = const Value.absent(),
    this.fp2Date = const Value.absent(),
    this.fp3Date = const Value.absent(),
    this.sprintQualyDate = const Value.absent(),
    this.sprintRaceDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RacesCompanion.insert({
    required String raceId,
    required int round,
    this.raceName = const Value.absent(),
    required int season,
    required String circuitId,
    this.raceDate = const Value.absent(),
    this.qualyDate = const Value.absent(),
    this.fp1Date = const Value.absent(),
    this.fp2Date = const Value.absent(),
    this.fp3Date = const Value.absent(),
    this.sprintQualyDate = const Value.absent(),
    this.sprintRaceDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : raceId = Value(raceId),
       round = Value(round),
       season = Value(season),
       circuitId = Value(circuitId);
  static Insertable<Race> custom({
    Expression<String>? raceId,
    Expression<int>? round,
    Expression<String>? raceName,
    Expression<int>? season,
    Expression<String>? circuitId,
    Expression<DateTime>? raceDate,
    Expression<DateTime>? qualyDate,
    Expression<DateTime>? fp1Date,
    Expression<DateTime>? fp2Date,
    Expression<DateTime>? fp3Date,
    Expression<DateTime>? sprintQualyDate,
    Expression<DateTime>? sprintRaceDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (raceId != null) 'race_id': raceId,
      if (round != null) 'round': round,
      if (raceName != null) 'race_name': raceName,
      if (season != null) 'season': season,
      if (circuitId != null) 'circuit_id': circuitId,
      if (raceDate != null) 'race_date': raceDate,
      if (qualyDate != null) 'qualy_date': qualyDate,
      if (fp1Date != null) 'fp1_date': fp1Date,
      if (fp2Date != null) 'fp2_date': fp2Date,
      if (fp3Date != null) 'fp3_date': fp3Date,
      if (sprintQualyDate != null) 'sprint_qualy_date': sprintQualyDate,
      if (sprintRaceDate != null) 'sprint_race_date': sprintRaceDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RacesCompanion copyWith({
    Value<String>? raceId,
    Value<int>? round,
    Value<String?>? raceName,
    Value<int>? season,
    Value<String>? circuitId,
    Value<DateTime?>? raceDate,
    Value<DateTime?>? qualyDate,
    Value<DateTime?>? fp1Date,
    Value<DateTime?>? fp2Date,
    Value<DateTime?>? fp3Date,
    Value<DateTime?>? sprintQualyDate,
    Value<DateTime?>? sprintRaceDate,
    Value<int>? rowid,
  }) {
    return RacesCompanion(
      raceId: raceId ?? this.raceId,
      round: round ?? this.round,
      raceName: raceName ?? this.raceName,
      season: season ?? this.season,
      circuitId: circuitId ?? this.circuitId,
      raceDate: raceDate ?? this.raceDate,
      qualyDate: qualyDate ?? this.qualyDate,
      fp1Date: fp1Date ?? this.fp1Date,
      fp2Date: fp2Date ?? this.fp2Date,
      fp3Date: fp3Date ?? this.fp3Date,
      sprintQualyDate: sprintQualyDate ?? this.sprintQualyDate,
      sprintRaceDate: sprintRaceDate ?? this.sprintRaceDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (raceId.present) {
      map['race_id'] = Variable<String>(raceId.value);
    }
    if (round.present) {
      map['round'] = Variable<int>(round.value);
    }
    if (raceName.present) {
      map['race_name'] = Variable<String>(raceName.value);
    }
    if (season.present) {
      map['season'] = Variable<int>(season.value);
    }
    if (circuitId.present) {
      map['circuit_id'] = Variable<String>(circuitId.value);
    }
    if (raceDate.present) {
      map['race_date'] = Variable<DateTime>(raceDate.value);
    }
    if (qualyDate.present) {
      map['qualy_date'] = Variable<DateTime>(qualyDate.value);
    }
    if (fp1Date.present) {
      map['fp1_date'] = Variable<DateTime>(fp1Date.value);
    }
    if (fp2Date.present) {
      map['fp2_date'] = Variable<DateTime>(fp2Date.value);
    }
    if (fp3Date.present) {
      map['fp3_date'] = Variable<DateTime>(fp3Date.value);
    }
    if (sprintQualyDate.present) {
      map['sprint_qualy_date'] = Variable<DateTime>(sprintQualyDate.value);
    }
    if (sprintRaceDate.present) {
      map['sprint_race_date'] = Variable<DateTime>(sprintRaceDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RacesCompanion(')
          ..write('raceId: $raceId, ')
          ..write('round: $round, ')
          ..write('raceName: $raceName, ')
          ..write('season: $season, ')
          ..write('circuitId: $circuitId, ')
          ..write('raceDate: $raceDate, ')
          ..write('qualyDate: $qualyDate, ')
          ..write('fp1Date: $fp1Date, ')
          ..write('fp2Date: $fp2Date, ')
          ..write('fp3Date: $fp3Date, ')
          ..write('sprintQualyDate: $sprintQualyDate, ')
          ..write('sprintRaceDate: $sprintRaceDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CircuitsTable extends Circuits with TableInfo<$CircuitsTable, Circuit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CircuitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _circuitIdMeta = const VerificationMeta(
    'circuitId',
  );
  @override
  late final GeneratedColumn<String> circuitId = GeneratedColumn<String>(
    'circuit_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _circuitNameMeta = const VerificationMeta(
    'circuitName',
  );
  @override
  late final GeneratedColumn<String> circuitName = GeneratedColumn<String>(
    'circuit_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _circuitLengthMeta = const VerificationMeta(
    'circuitLength',
  );
  @override
  late final GeneratedColumn<String> circuitLength = GeneratedColumn<String>(
    'circuit_length',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lapRecordMeta = const VerificationMeta(
    'lapRecord',
  );
  @override
  late final GeneratedColumn<String> lapRecord = GeneratedColumn<String>(
    'lap_record',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _firstParticipationYearMeta =
      const VerificationMeta('firstParticipationYear');
  @override
  late final GeneratedColumn<int> firstParticipationYear = GeneratedColumn<int>(
    'first_participation_year',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cornersMeta = const VerificationMeta(
    'corners',
  );
  @override
  late final GeneratedColumn<int> corners = GeneratedColumn<int>(
    'corners',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    circuitId,
    circuitName,
    country,
    city,
    circuitLength,
    lapRecord,
    firstParticipationYear,
    corners,
    url,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'circuits';
  @override
  VerificationContext validateIntegrity(
    Insertable<Circuit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('circuit_id')) {
      context.handle(
        _circuitIdMeta,
        circuitId.isAcceptableOrUnknown(data['circuit_id']!, _circuitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_circuitIdMeta);
    }
    if (data.containsKey('circuit_name')) {
      context.handle(
        _circuitNameMeta,
        circuitName.isAcceptableOrUnknown(
          data['circuit_name']!,
          _circuitNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_circuitNameMeta);
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('circuit_length')) {
      context.handle(
        _circuitLengthMeta,
        circuitLength.isAcceptableOrUnknown(
          data['circuit_length']!,
          _circuitLengthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_circuitLengthMeta);
    }
    if (data.containsKey('lap_record')) {
      context.handle(
        _lapRecordMeta,
        lapRecord.isAcceptableOrUnknown(data['lap_record']!, _lapRecordMeta),
      );
    }
    if (data.containsKey('first_participation_year')) {
      context.handle(
        _firstParticipationYearMeta,
        firstParticipationYear.isAcceptableOrUnknown(
          data['first_participation_year']!,
          _firstParticipationYearMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firstParticipationYearMeta);
    }
    if (data.containsKey('corners')) {
      context.handle(
        _cornersMeta,
        corners.isAcceptableOrUnknown(data['corners']!, _cornersMeta),
      );
    } else if (isInserting) {
      context.missing(_cornersMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {circuitId};
  @override
  Circuit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Circuit(
      circuitId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}circuit_id'],
      )!,
      circuitName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}circuit_name'],
      )!,
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      )!,
      circuitLength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}circuit_length'],
      )!,
      lapRecord: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lap_record'],
      ),
      firstParticipationYear: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}first_participation_year'],
      )!,
      corners: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}corners'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
    );
  }

  @override
  $CircuitsTable createAlias(String alias) {
    return $CircuitsTable(attachedDatabase, alias);
  }
}

class Circuit extends DataClass implements Insertable<Circuit> {
  final String circuitId;
  final String circuitName;
  final String country;
  final String city;
  final String circuitLength;
  final String? lapRecord;
  final int firstParticipationYear;
  final int corners;
  final String url;
  const Circuit({
    required this.circuitId,
    required this.circuitName,
    required this.country,
    required this.city,
    required this.circuitLength,
    this.lapRecord,
    required this.firstParticipationYear,
    required this.corners,
    required this.url,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['circuit_id'] = Variable<String>(circuitId);
    map['circuit_name'] = Variable<String>(circuitName);
    map['country'] = Variable<String>(country);
    map['city'] = Variable<String>(city);
    map['circuit_length'] = Variable<String>(circuitLength);
    if (!nullToAbsent || lapRecord != null) {
      map['lap_record'] = Variable<String>(lapRecord);
    }
    map['first_participation_year'] = Variable<int>(firstParticipationYear);
    map['corners'] = Variable<int>(corners);
    map['url'] = Variable<String>(url);
    return map;
  }

  CircuitsCompanion toCompanion(bool nullToAbsent) {
    return CircuitsCompanion(
      circuitId: Value(circuitId),
      circuitName: Value(circuitName),
      country: Value(country),
      city: Value(city),
      circuitLength: Value(circuitLength),
      lapRecord: lapRecord == null && nullToAbsent
          ? const Value.absent()
          : Value(lapRecord),
      firstParticipationYear: Value(firstParticipationYear),
      corners: Value(corners),
      url: Value(url),
    );
  }

  factory Circuit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Circuit(
      circuitId: serializer.fromJson<String>(json['circuitId']),
      circuitName: serializer.fromJson<String>(json['circuitName']),
      country: serializer.fromJson<String>(json['country']),
      city: serializer.fromJson<String>(json['city']),
      circuitLength: serializer.fromJson<String>(json['circuitLength']),
      lapRecord: serializer.fromJson<String?>(json['lapRecord']),
      firstParticipationYear: serializer.fromJson<int>(
        json['firstParticipationYear'],
      ),
      corners: serializer.fromJson<int>(json['corners']),
      url: serializer.fromJson<String>(json['url']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'circuitId': serializer.toJson<String>(circuitId),
      'circuitName': serializer.toJson<String>(circuitName),
      'country': serializer.toJson<String>(country),
      'city': serializer.toJson<String>(city),
      'circuitLength': serializer.toJson<String>(circuitLength),
      'lapRecord': serializer.toJson<String?>(lapRecord),
      'firstParticipationYear': serializer.toJson<int>(firstParticipationYear),
      'corners': serializer.toJson<int>(corners),
      'url': serializer.toJson<String>(url),
    };
  }

  Circuit copyWith({
    String? circuitId,
    String? circuitName,
    String? country,
    String? city,
    String? circuitLength,
    Value<String?> lapRecord = const Value.absent(),
    int? firstParticipationYear,
    int? corners,
    String? url,
  }) => Circuit(
    circuitId: circuitId ?? this.circuitId,
    circuitName: circuitName ?? this.circuitName,
    country: country ?? this.country,
    city: city ?? this.city,
    circuitLength: circuitLength ?? this.circuitLength,
    lapRecord: lapRecord.present ? lapRecord.value : this.lapRecord,
    firstParticipationYear:
        firstParticipationYear ?? this.firstParticipationYear,
    corners: corners ?? this.corners,
    url: url ?? this.url,
  );
  Circuit copyWithCompanion(CircuitsCompanion data) {
    return Circuit(
      circuitId: data.circuitId.present ? data.circuitId.value : this.circuitId,
      circuitName: data.circuitName.present
          ? data.circuitName.value
          : this.circuitName,
      country: data.country.present ? data.country.value : this.country,
      city: data.city.present ? data.city.value : this.city,
      circuitLength: data.circuitLength.present
          ? data.circuitLength.value
          : this.circuitLength,
      lapRecord: data.lapRecord.present ? data.lapRecord.value : this.lapRecord,
      firstParticipationYear: data.firstParticipationYear.present
          ? data.firstParticipationYear.value
          : this.firstParticipationYear,
      corners: data.corners.present ? data.corners.value : this.corners,
      url: data.url.present ? data.url.value : this.url,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Circuit(')
          ..write('circuitId: $circuitId, ')
          ..write('circuitName: $circuitName, ')
          ..write('country: $country, ')
          ..write('city: $city, ')
          ..write('circuitLength: $circuitLength, ')
          ..write('lapRecord: $lapRecord, ')
          ..write('firstParticipationYear: $firstParticipationYear, ')
          ..write('corners: $corners, ')
          ..write('url: $url')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    circuitId,
    circuitName,
    country,
    city,
    circuitLength,
    lapRecord,
    firstParticipationYear,
    corners,
    url,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Circuit &&
          other.circuitId == this.circuitId &&
          other.circuitName == this.circuitName &&
          other.country == this.country &&
          other.city == this.city &&
          other.circuitLength == this.circuitLength &&
          other.lapRecord == this.lapRecord &&
          other.firstParticipationYear == this.firstParticipationYear &&
          other.corners == this.corners &&
          other.url == this.url);
}

class CircuitsCompanion extends UpdateCompanion<Circuit> {
  final Value<String> circuitId;
  final Value<String> circuitName;
  final Value<String> country;
  final Value<String> city;
  final Value<String> circuitLength;
  final Value<String?> lapRecord;
  final Value<int> firstParticipationYear;
  final Value<int> corners;
  final Value<String> url;
  final Value<int> rowid;
  const CircuitsCompanion({
    this.circuitId = const Value.absent(),
    this.circuitName = const Value.absent(),
    this.country = const Value.absent(),
    this.city = const Value.absent(),
    this.circuitLength = const Value.absent(),
    this.lapRecord = const Value.absent(),
    this.firstParticipationYear = const Value.absent(),
    this.corners = const Value.absent(),
    this.url = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CircuitsCompanion.insert({
    required String circuitId,
    required String circuitName,
    required String country,
    required String city,
    required String circuitLength,
    this.lapRecord = const Value.absent(),
    required int firstParticipationYear,
    required int corners,
    required String url,
    this.rowid = const Value.absent(),
  }) : circuitId = Value(circuitId),
       circuitName = Value(circuitName),
       country = Value(country),
       city = Value(city),
       circuitLength = Value(circuitLength),
       firstParticipationYear = Value(firstParticipationYear),
       corners = Value(corners),
       url = Value(url);
  static Insertable<Circuit> custom({
    Expression<String>? circuitId,
    Expression<String>? circuitName,
    Expression<String>? country,
    Expression<String>? city,
    Expression<String>? circuitLength,
    Expression<String>? lapRecord,
    Expression<int>? firstParticipationYear,
    Expression<int>? corners,
    Expression<String>? url,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (circuitId != null) 'circuit_id': circuitId,
      if (circuitName != null) 'circuit_name': circuitName,
      if (country != null) 'country': country,
      if (city != null) 'city': city,
      if (circuitLength != null) 'circuit_length': circuitLength,
      if (lapRecord != null) 'lap_record': lapRecord,
      if (firstParticipationYear != null)
        'first_participation_year': firstParticipationYear,
      if (corners != null) 'corners': corners,
      if (url != null) 'url': url,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CircuitsCompanion copyWith({
    Value<String>? circuitId,
    Value<String>? circuitName,
    Value<String>? country,
    Value<String>? city,
    Value<String>? circuitLength,
    Value<String?>? lapRecord,
    Value<int>? firstParticipationYear,
    Value<int>? corners,
    Value<String>? url,
    Value<int>? rowid,
  }) {
    return CircuitsCompanion(
      circuitId: circuitId ?? this.circuitId,
      circuitName: circuitName ?? this.circuitName,
      country: country ?? this.country,
      city: city ?? this.city,
      circuitLength: circuitLength ?? this.circuitLength,
      lapRecord: lapRecord ?? this.lapRecord,
      firstParticipationYear:
          firstParticipationYear ?? this.firstParticipationYear,
      corners: corners ?? this.corners,
      url: url ?? this.url,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (circuitId.present) {
      map['circuit_id'] = Variable<String>(circuitId.value);
    }
    if (circuitName.present) {
      map['circuit_name'] = Variable<String>(circuitName.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (circuitLength.present) {
      map['circuit_length'] = Variable<String>(circuitLength.value);
    }
    if (lapRecord.present) {
      map['lap_record'] = Variable<String>(lapRecord.value);
    }
    if (firstParticipationYear.present) {
      map['first_participation_year'] = Variable<int>(
        firstParticipationYear.value,
      );
    }
    if (corners.present) {
      map['corners'] = Variable<int>(corners.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CircuitsCompanion(')
          ..write('circuitId: $circuitId, ')
          ..write('circuitName: $circuitName, ')
          ..write('country: $country, ')
          ..write('city: $city, ')
          ..write('circuitLength: $circuitLength, ')
          ..write('lapRecord: $lapRecord, ')
          ..write('firstParticipationYear: $firstParticipationYear, ')
          ..write('corners: $corners, ')
          ..write('url: $url, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RacesTable races = $RacesTable(this);
  late final $CircuitsTable circuits = $CircuitsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [races, circuits];
}

typedef $$RacesTableCreateCompanionBuilder =
    RacesCompanion Function({
      required String raceId,
      required int round,
      Value<String?> raceName,
      required int season,
      required String circuitId,
      Value<DateTime?> raceDate,
      Value<DateTime?> qualyDate,
      Value<DateTime?> fp1Date,
      Value<DateTime?> fp2Date,
      Value<DateTime?> fp3Date,
      Value<DateTime?> sprintQualyDate,
      Value<DateTime?> sprintRaceDate,
      Value<int> rowid,
    });
typedef $$RacesTableUpdateCompanionBuilder =
    RacesCompanion Function({
      Value<String> raceId,
      Value<int> round,
      Value<String?> raceName,
      Value<int> season,
      Value<String> circuitId,
      Value<DateTime?> raceDate,
      Value<DateTime?> qualyDate,
      Value<DateTime?> fp1Date,
      Value<DateTime?> fp2Date,
      Value<DateTime?> fp3Date,
      Value<DateTime?> sprintQualyDate,
      Value<DateTime?> sprintRaceDate,
      Value<int> rowid,
    });

class $$RacesTableFilterComposer extends Composer<_$AppDatabase, $RacesTable> {
  $$RacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get raceId => $composableBuilder(
    column: $table.raceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get round => $composableBuilder(
    column: $table.round,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get raceName => $composableBuilder(
    column: $table.raceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get season => $composableBuilder(
    column: $table.season,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get circuitId => $composableBuilder(
    column: $table.circuitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get raceDate => $composableBuilder(
    column: $table.raceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get qualyDate => $composableBuilder(
    column: $table.qualyDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fp1Date => $composableBuilder(
    column: $table.fp1Date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fp2Date => $composableBuilder(
    column: $table.fp2Date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get fp3Date => $composableBuilder(
    column: $table.fp3Date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sprintQualyDate => $composableBuilder(
    column: $table.sprintQualyDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sprintRaceDate => $composableBuilder(
    column: $table.sprintRaceDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RacesTableOrderingComposer
    extends Composer<_$AppDatabase, $RacesTable> {
  $$RacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get raceId => $composableBuilder(
    column: $table.raceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get round => $composableBuilder(
    column: $table.round,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get raceName => $composableBuilder(
    column: $table.raceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get season => $composableBuilder(
    column: $table.season,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get circuitId => $composableBuilder(
    column: $table.circuitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get raceDate => $composableBuilder(
    column: $table.raceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get qualyDate => $composableBuilder(
    column: $table.qualyDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fp1Date => $composableBuilder(
    column: $table.fp1Date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fp2Date => $composableBuilder(
    column: $table.fp2Date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get fp3Date => $composableBuilder(
    column: $table.fp3Date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sprintQualyDate => $composableBuilder(
    column: $table.sprintQualyDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sprintRaceDate => $composableBuilder(
    column: $table.sprintRaceDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RacesTableAnnotationComposer
    extends Composer<_$AppDatabase, $RacesTable> {
  $$RacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get raceId =>
      $composableBuilder(column: $table.raceId, builder: (column) => column);

  GeneratedColumn<int> get round =>
      $composableBuilder(column: $table.round, builder: (column) => column);

  GeneratedColumn<String> get raceName =>
      $composableBuilder(column: $table.raceName, builder: (column) => column);

  GeneratedColumn<int> get season =>
      $composableBuilder(column: $table.season, builder: (column) => column);

  GeneratedColumn<String> get circuitId =>
      $composableBuilder(column: $table.circuitId, builder: (column) => column);

  GeneratedColumn<DateTime> get raceDate =>
      $composableBuilder(column: $table.raceDate, builder: (column) => column);

  GeneratedColumn<DateTime> get qualyDate =>
      $composableBuilder(column: $table.qualyDate, builder: (column) => column);

  GeneratedColumn<DateTime> get fp1Date =>
      $composableBuilder(column: $table.fp1Date, builder: (column) => column);

  GeneratedColumn<DateTime> get fp2Date =>
      $composableBuilder(column: $table.fp2Date, builder: (column) => column);

  GeneratedColumn<DateTime> get fp3Date =>
      $composableBuilder(column: $table.fp3Date, builder: (column) => column);

  GeneratedColumn<DateTime> get sprintQualyDate => $composableBuilder(
    column: $table.sprintQualyDate,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get sprintRaceDate => $composableBuilder(
    column: $table.sprintRaceDate,
    builder: (column) => column,
  );
}

class $$RacesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RacesTable,
          Race,
          $$RacesTableFilterComposer,
          $$RacesTableOrderingComposer,
          $$RacesTableAnnotationComposer,
          $$RacesTableCreateCompanionBuilder,
          $$RacesTableUpdateCompanionBuilder,
          (Race, BaseReferences<_$AppDatabase, $RacesTable, Race>),
          Race,
          PrefetchHooks Function()
        > {
  $$RacesTableTableManager(_$AppDatabase db, $RacesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> raceId = const Value.absent(),
                Value<int> round = const Value.absent(),
                Value<String?> raceName = const Value.absent(),
                Value<int> season = const Value.absent(),
                Value<String> circuitId = const Value.absent(),
                Value<DateTime?> raceDate = const Value.absent(),
                Value<DateTime?> qualyDate = const Value.absent(),
                Value<DateTime?> fp1Date = const Value.absent(),
                Value<DateTime?> fp2Date = const Value.absent(),
                Value<DateTime?> fp3Date = const Value.absent(),
                Value<DateTime?> sprintQualyDate = const Value.absent(),
                Value<DateTime?> sprintRaceDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RacesCompanion(
                raceId: raceId,
                round: round,
                raceName: raceName,
                season: season,
                circuitId: circuitId,
                raceDate: raceDate,
                qualyDate: qualyDate,
                fp1Date: fp1Date,
                fp2Date: fp2Date,
                fp3Date: fp3Date,
                sprintQualyDate: sprintQualyDate,
                sprintRaceDate: sprintRaceDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String raceId,
                required int round,
                Value<String?> raceName = const Value.absent(),
                required int season,
                required String circuitId,
                Value<DateTime?> raceDate = const Value.absent(),
                Value<DateTime?> qualyDate = const Value.absent(),
                Value<DateTime?> fp1Date = const Value.absent(),
                Value<DateTime?> fp2Date = const Value.absent(),
                Value<DateTime?> fp3Date = const Value.absent(),
                Value<DateTime?> sprintQualyDate = const Value.absent(),
                Value<DateTime?> sprintRaceDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RacesCompanion.insert(
                raceId: raceId,
                round: round,
                raceName: raceName,
                season: season,
                circuitId: circuitId,
                raceDate: raceDate,
                qualyDate: qualyDate,
                fp1Date: fp1Date,
                fp2Date: fp2Date,
                fp3Date: fp3Date,
                sprintQualyDate: sprintQualyDate,
                sprintRaceDate: sprintRaceDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RacesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RacesTable,
      Race,
      $$RacesTableFilterComposer,
      $$RacesTableOrderingComposer,
      $$RacesTableAnnotationComposer,
      $$RacesTableCreateCompanionBuilder,
      $$RacesTableUpdateCompanionBuilder,
      (Race, BaseReferences<_$AppDatabase, $RacesTable, Race>),
      Race,
      PrefetchHooks Function()
    >;
typedef $$CircuitsTableCreateCompanionBuilder =
    CircuitsCompanion Function({
      required String circuitId,
      required String circuitName,
      required String country,
      required String city,
      required String circuitLength,
      Value<String?> lapRecord,
      required int firstParticipationYear,
      required int corners,
      required String url,
      Value<int> rowid,
    });
typedef $$CircuitsTableUpdateCompanionBuilder =
    CircuitsCompanion Function({
      Value<String> circuitId,
      Value<String> circuitName,
      Value<String> country,
      Value<String> city,
      Value<String> circuitLength,
      Value<String?> lapRecord,
      Value<int> firstParticipationYear,
      Value<int> corners,
      Value<String> url,
      Value<int> rowid,
    });

class $$CircuitsTableFilterComposer
    extends Composer<_$AppDatabase, $CircuitsTable> {
  $$CircuitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get circuitId => $composableBuilder(
    column: $table.circuitId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get circuitName => $composableBuilder(
    column: $table.circuitName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get circuitLength => $composableBuilder(
    column: $table.circuitLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lapRecord => $composableBuilder(
    column: $table.lapRecord,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get firstParticipationYear => $composableBuilder(
    column: $table.firstParticipationYear,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get corners => $composableBuilder(
    column: $table.corners,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CircuitsTableOrderingComposer
    extends Composer<_$AppDatabase, $CircuitsTable> {
  $$CircuitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get circuitId => $composableBuilder(
    column: $table.circuitId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get circuitName => $composableBuilder(
    column: $table.circuitName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get circuitLength => $composableBuilder(
    column: $table.circuitLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lapRecord => $composableBuilder(
    column: $table.lapRecord,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get firstParticipationYear => $composableBuilder(
    column: $table.firstParticipationYear,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get corners => $composableBuilder(
    column: $table.corners,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CircuitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CircuitsTable> {
  $$CircuitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get circuitId =>
      $composableBuilder(column: $table.circuitId, builder: (column) => column);

  GeneratedColumn<String> get circuitName => $composableBuilder(
    column: $table.circuitName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get circuitLength => $composableBuilder(
    column: $table.circuitLength,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lapRecord =>
      $composableBuilder(column: $table.lapRecord, builder: (column) => column);

  GeneratedColumn<int> get firstParticipationYear => $composableBuilder(
    column: $table.firstParticipationYear,
    builder: (column) => column,
  );

  GeneratedColumn<int> get corners =>
      $composableBuilder(column: $table.corners, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);
}

class $$CircuitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CircuitsTable,
          Circuit,
          $$CircuitsTableFilterComposer,
          $$CircuitsTableOrderingComposer,
          $$CircuitsTableAnnotationComposer,
          $$CircuitsTableCreateCompanionBuilder,
          $$CircuitsTableUpdateCompanionBuilder,
          (Circuit, BaseReferences<_$AppDatabase, $CircuitsTable, Circuit>),
          Circuit,
          PrefetchHooks Function()
        > {
  $$CircuitsTableTableManager(_$AppDatabase db, $CircuitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CircuitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CircuitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CircuitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> circuitId = const Value.absent(),
                Value<String> circuitName = const Value.absent(),
                Value<String> country = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<String> circuitLength = const Value.absent(),
                Value<String?> lapRecord = const Value.absent(),
                Value<int> firstParticipationYear = const Value.absent(),
                Value<int> corners = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CircuitsCompanion(
                circuitId: circuitId,
                circuitName: circuitName,
                country: country,
                city: city,
                circuitLength: circuitLength,
                lapRecord: lapRecord,
                firstParticipationYear: firstParticipationYear,
                corners: corners,
                url: url,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String circuitId,
                required String circuitName,
                required String country,
                required String city,
                required String circuitLength,
                Value<String?> lapRecord = const Value.absent(),
                required int firstParticipationYear,
                required int corners,
                required String url,
                Value<int> rowid = const Value.absent(),
              }) => CircuitsCompanion.insert(
                circuitId: circuitId,
                circuitName: circuitName,
                country: country,
                city: city,
                circuitLength: circuitLength,
                lapRecord: lapRecord,
                firstParticipationYear: firstParticipationYear,
                corners: corners,
                url: url,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CircuitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CircuitsTable,
      Circuit,
      $$CircuitsTableFilterComposer,
      $$CircuitsTableOrderingComposer,
      $$CircuitsTableAnnotationComposer,
      $$CircuitsTableCreateCompanionBuilder,
      $$CircuitsTableUpdateCompanionBuilder,
      (Circuit, BaseReferences<_$AppDatabase, $CircuitsTable, Circuit>),
      Circuit,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RacesTableTableManager get races =>
      $$RacesTableTableManager(_db, _db.races);
  $$CircuitsTableTableManager get circuits =>
      $$CircuitsTableTableManager(_db, _db.circuits);
}

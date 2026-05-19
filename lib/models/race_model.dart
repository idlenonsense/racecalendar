class CircuitModel {
  final String circuitId;
  final String circuitName;
  final String country;
  final String city;
  final String circuitLength;
  final String? lapRecord;
  final int firstParticipationYear;
  final int corners;
  final String? fastestLapDriverId;
  final String? fastestLapTeamId;
  final int? fastestLapYear;
  final String url;

  CircuitModel({
    required this.circuitId,
    required this.circuitName,
    required this.country,
    required this.city,
    required this.circuitLength,
    this.lapRecord,
    required this.firstParticipationYear,
    required this.corners,
    this.fastestLapDriverId,
    this.fastestLapTeamId,
    this.fastestLapYear,
    required this.url,
  });

  factory CircuitModel.fromJson(Map<String, dynamic> json) {
    return CircuitModel(
      circuitId: json['circuitId'] as String,
      circuitName: json['circuitName'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      circuitLength: json['circuitLength'] as String,
      lapRecord: json['lapRecord'] as String?,
      firstParticipationYear: json['firstParticipationYear'] as int,
      corners: json['corners'] as int,
      fastestLapDriverId: json['fastestLapDriverId'] as String?,
      fastestLapTeamId: json['fastestLapTeamId'] as String?,
      fastestLapYear: json['fastestLapYear'] as int?,
      url: json['url'] as String,
    );
  }
}

class RaceModel {
  final String raceId;
  final String? raceName;
  final int round;
  final CircuitModel circuit;
  final RaceSchedule schedule;
  final int? laps;

  RaceModel({
    required this.raceId,
    this.raceName,
    required this.round,
    required this.circuit,
    required this.schedule,
    this.laps,
  });

  factory RaceModel.fromJson(Map<String, dynamic> json) {
    return RaceModel(
      raceId: json['raceId'] as String,
      raceName: json['raceName'] as String?,
      round: json['round'] as int,
      circuit: CircuitModel.fromJson(json['circuit'] as Map<String, dynamic>),
      schedule: RaceSchedule.fromJson(json['schedule'] as Map<String, dynamic>),
      laps: json['laps'] as int?,
    );
  }

  // Вычисляемое свойство для отображения названия Гран-при
  String get displayName => raceName ?? '${circuit.city} Grand Prix';
}

// Класс для Schedule (расписание)
class RaceSchedule {
  final SessionDetails? race;
  final SessionDetails? qualy;
  final SessionDetails? fp1;
  final SessionDetails? fp2;
  final SessionDetails? fp3;
  final SessionDetails? sprintQualy;
  final SessionDetails? sprintRace;

  RaceSchedule({
    this.race,
    this.qualy,
    this.fp1,
    this.fp2,
    this.fp3,
    this.sprintQualy,
    this.sprintRace,
  });

  factory RaceSchedule.fromJson(Map<String, dynamic> json) {
    DateTime? parseDate(String? dateStr) {
      if (dateStr == null || dateStr.isEmpty) return null;
      return DateTime.tryParse(dateStr);
    }

    SessionDetails? createSession(Map<String, dynamic>? sessionJson) {
      if (sessionJson == null) return null;
      final date = parseDate(sessionJson['date'] as String?);
      return date != null ? SessionDetails(date: date) : null;
    }

    return RaceSchedule(
      race: createSession(json['race'] as Map<String, dynamic>?),
      qualy: createSession(json['qualy'] as Map<String, dynamic>?),
      fp1: createSession(json['fp1'] as Map<String, dynamic>?),
      fp2: createSession(json['fp2'] as Map<String, dynamic>?),
      fp3: createSession(json['fp3'] as Map<String, dynamic>?),
      sprintQualy: createSession(json['sprintQualy'] as Map<String, dynamic>?),
      sprintRace: createSession(json['sprintRace'] as Map<String, dynamic>?),
    );
  }
}

// Детали одной сессии (дата)
class SessionDetails {
  final DateTime date;
  // В ответе API есть поле time, но оно null, поэтому пока не используем

  SessionDetails({required this.date});
}

// Главный ответ API (корневой объект)
class ApiResponse {
  final String api;
  final String url;
  final int limit;
  final int offset;
  final int total;
  final int season;
  final Championship championship;
  final List<RaceModel> races;

  ApiResponse({
    required this.api,
    required this.url,
    required this.limit,
    required this.offset,
    required this.total,
    required this.season,
    required this.championship,
    required this.races,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      api: json['api'] as String,
      url: json['url'] as String,
      limit: json['limit'] as int,
      offset: json['offset'] as int,
      total: json['total'] as int,
      season: json['season'] as int,
      championship: Championship.fromJson(json['championship'] as Map<String, dynamic>),
      races: (json['races'] as List)
          .map((e) => RaceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Championship {
  final String championshipId;
  final String championshipName;
  final String url;
  final int year;

  Championship({
    required this.championshipId,
    required this.championshipName,
    required this.url,
    required this.year,
  });

  factory Championship.fromJson(Map<String, dynamic> json) {
    return Championship(
      championshipId: json['championshipId'] as String,
      championshipName: json['championshipName'] as String,
      url: json['url'] as String,
      year: json['year'] as int,
    );
  }
}
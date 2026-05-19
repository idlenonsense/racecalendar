class PilotModel {
  final String id;
  final String name;
  final String team;
  final String number;
  final String country;
  final String imageUrl;

  PilotModel({
    required this.id,
    required this.name,
    required this.team,
    required this.number,
    required this.country,
    this.imageUrl = '',
  });
}
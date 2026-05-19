class CarModel {
  final String id;
  final String team;
  final String model;
  final String engine;
  final String imageUrl;

  CarModel({
    required this.id,
    required this.team,
    required this.model,
    required this.engine,
    this.imageUrl = '',
  });
}
import 'planet_story_model.dart';

class PlanetModel {
  final String name;
  final String image;
  final String icPlanet;
  final String initial;
  final String description;
  final String object3d;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String type;
  final List<String> photos;
  final List<PlanetStoryModel> stories;

  PlanetModel({
    required this.name,
    required this.image,
    required this.icPlanet,
    required this.object3d,
    required this.initial,
    required this.description,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.type,
    required this.photos,
    required this.stories,
  });

  factory PlanetModel.fromJson(Map<String, dynamic> json) {
    return PlanetModel(
      name: json['name'],
      image: json['image'],
      icPlanet: json['icPlanet'],
      initial: json['initial'],
      description: json['description'],
      object3d: json['object3d'],
      rotationPeriod: json['rotationPeriod'],
      orbitalPeriod: json['orbitalPeriod'],
      diameter: json['diameter'],
      type: json['type'],
      photos: List<String>.from(json['photos']),
      stories:
          (json['stories'] as List)
              .map((e) => PlanetStoryModel.fromJson(e))
              .toList(),
    );
  }
}

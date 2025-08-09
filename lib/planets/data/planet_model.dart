import 'planet_story_model.dart';
import '../../utils/json_utils.dart';

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
    required this.initial,
    required this.description,
    required this.object3d,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.type,
    required this.photos,
    required this.stories,
  });

  factory PlanetModel.fromJson(Map<String, dynamic> json) {
    return PlanetModel(
      name: safeString(json['name']),
      image: safeString(json['image']),
      icPlanet: safeString(json['icPlanet']),
      initial: safeString(json['initial']),
      description: safeString(json['description']),
      object3d: safeString(json['object3d']),
      rotationPeriod: safeString(json['rotationPeriod']),
      orbitalPeriod: safeString(json['orbitalPeriod']),
      diameter: safeString(json['diameter']),
      type: safeString(json['type']),
      photos: safeStringList(json['photos']),
      stories: (json['stories'] as List<dynamic>? ?? [])
          .map((e) => PlanetStoryModel.fromJson(e))
          .toList(),
    );
  }
}

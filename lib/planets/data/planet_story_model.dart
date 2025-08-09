import '../../utils/json_utils.dart';

class PlanetStoryModel {
  final String title;
  final String image;
  final String detail;
  final String date;
  final String? spaceStation;
  final String? imgSpaceStation;

  PlanetStoryModel({
    required this.title,
    required this.image,
    required this.detail,
    required this.date,
    this.spaceStation,
    this.imgSpaceStation,
  });

  factory PlanetStoryModel.fromJson(Map<String, dynamic> json) {
    return PlanetStoryModel(
      spaceStation: safeString(json['spaceStation']),
      imgSpaceStation: safeString(json['imgSpaceStation']),
      date: safeString(json['date']),
      title: safeString(json['title']),
      image: safeString(json['image']),
      detail: safeString(json['detail']),
    );
  }
}

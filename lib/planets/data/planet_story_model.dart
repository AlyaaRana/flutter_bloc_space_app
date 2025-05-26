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
      spaceStation: json['spaceStation'] ?? "",
      imgSpaceStation: json['imgSpaceStation'] ?? "",
      date: json['date'],
      title: json['title'],
      image: json['image'],
      detail: json['detail'],
    );
  }
}

import 'astronaut_detail_model.dart';

class Astronaut {
  final String name;
  final String image;
  final String status;
  final AstronautDetail detail;

  Astronaut({
    required this.name,
    required this.image,
    required this.status,
    required this.detail,
  });

  factory Astronaut.fromJson(Map<String, dynamic> json) {
    return Astronaut(
      name: json['name'] ?? '',
      image: json['profile_image'] ?? '',
      status: json['status']['name'] ?? 'Unknown',
      detail: AstronautDetail.fromJson(json),
    );
  }
}

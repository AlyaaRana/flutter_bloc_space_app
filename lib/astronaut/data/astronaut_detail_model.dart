class AstronautDetail {
  final String bio;
  final String firstFlight;
  final String lastFlight;
  final int spacewalkCount;
  final String agency;
  final String nationality;
  final List<String> flights;
  final String nasaCareer;

  AstronautDetail({
    required this.bio,
    required this.firstFlight,
    required this.lastFlight,
    required this.spacewalkCount,
    required this.nationality,
    required this.flights,
    required this.nasaCareer,
    required this.agency,
  });

  factory AstronautDetail.fromJson(Map<String, dynamic> json) {
    return AstronautDetail(
      bio: json['bio'] ?? '',
      firstFlight: json['first_flight'] ?? 'N/A',
      lastFlight: json['last_flight'] ?? 'N/A',
      spacewalkCount: json['spacewalks'] ?? 0,
      agency: json['agency']['name'] ?? 'Unknown',
      nationality: json['nationality'] ?? 'Unknown',
      flights: List<String>.from(
        json['flights'].map((flight) => flight['name'] ?? ''),
      ),
      nasaCareer:
          json['date_of_birth'] != null && json['date_of_death'] != null
              ? '${json['date_of_birth']} - ${json['date_of_death']}'
              : 'Still Active',
    );
  }
}

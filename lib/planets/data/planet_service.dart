import 'dart:convert';
import 'package:flutter/services.dart';

import 'planet_model.dart';

class PlanetService {
  Future<List<PlanetModel>> loadPlanets() async {
    String jsonString = await rootBundle.loadString(
      'assets/planets/data/planets.json',
    );

    List<dynamic> jsonResponse = jsonDecode(jsonString);

    List<PlanetModel> planets =
        jsonResponse.map((planet) => PlanetModel.fromJson(planet)).toList();

    return planets;
  }
}

// Example of using Dio for API
// Future<List<PlanetModel>> loadPlanetsFromApi() async {
//   try {
//     final response = await dio.get('your_api_url_here');
//     List<dynamic> data = response.data;
//     return data.map((planet) => PlanetModel.fromJson(planet)).toList();
//   } catch (e) {
//     throw Exception('Failed to load data from API');
//   }
// }

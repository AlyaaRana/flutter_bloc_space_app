import 'dart:convert';
import 'package:flutter/services.dart';
import 'planet_model.dart';
import 'planet_service.dart';

class PlanetRepository {
  final PlanetService planetService;

  PlanetRepository({required this.planetService});

  Future<List<PlanetModel>> getPlanetsFromJson() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/planets.json',
      );
      final List<dynamic> data = json.decode(response);
      return data.map((json) => PlanetModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Error loading planets from JSON: $e');
    }
  }
}

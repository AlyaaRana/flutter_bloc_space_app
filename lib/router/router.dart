import 'package:flutter/material.dart';
import 'package:spacenea/planets/screens/planets_screen.dart';
import '../explore_space/screens/explore_screen.dart';
import '../home/screens/home_screen.dart';
import '../planets/data/planet_model.dart';
import '../planets/screens/detail_planet.dart';
import '../planets/screens/planet_page.dart'; // Make sure this is the correct import

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/explore-space':
        return MaterialPageRoute(builder: (_) => ExploreSpaceScreen());
      case '/planets-explore':
      // Check if a planet was passed as argument
        PlanetModel? selectedPlanet;
        if (settings.arguments is PlanetModel) {
          selectedPlanet = settings.arguments as PlanetModel;
        }

        // Use PlanetPage instead of PlanetScreen and pass the selected planet
        return MaterialPageRoute(
          builder: (_) => PlanetPage(selectedPlanet: selectedPlanet),
        );
      case '/planets-detail':
        if (settings.arguments is PlanetModel) {
          final planet = settings.arguments as PlanetModel;
          return MaterialPageRoute(
            builder: (_) => DetailPlanetScreen(planet: planet),
          );
        } else {
          return _errorRoute("Invalid arguments for '/planets-detail'");
        }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _errorRoute(String message) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 18, color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
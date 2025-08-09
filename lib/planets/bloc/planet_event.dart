part of 'planet_bloc.dart';


@immutable
abstract class PlanetEvent {}

class LoadPlanetsEvent extends PlanetEvent {}

// New event to load planets with a specific selected planet
class LoadPlanetsWithSelectedEvent extends PlanetEvent {
  final PlanetModel selectedPlanet;

  LoadPlanetsWithSelectedEvent(this.selectedPlanet);
}

class SelectPlanet extends PlanetEvent {
  final PlanetModel planet;

  SelectPlanet(this.planet);
}

class ToggleDropdown extends PlanetEvent {}

class CloseDropdown extends PlanetEvent {}

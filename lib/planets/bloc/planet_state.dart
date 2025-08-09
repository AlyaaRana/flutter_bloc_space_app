part of 'planet_bloc.dart';

@immutable
sealed class PlanetState {}

final class PlanetInitial extends PlanetState {}

final class PlanetsLoadingState extends PlanetState {}

final class PlanetsLoadedState extends PlanetState {
  final List<PlanetModel> planets;
  final PlanetModel selectedPlanet;
  final bool isDropdownOpen;

  PlanetsLoadedState({
    required this.planets,
    required this.selectedPlanet,
    this.isDropdownOpen = false,
  });

  PlanetsLoadedState copyWith({
    List<PlanetModel>? planets,
    PlanetModel? selectedPlanet,
    bool? isDropdownOpen,
  }) {
    return PlanetsLoadedState(
      planets: planets ?? this.planets,
      selectedPlanet: selectedPlanet ?? this.selectedPlanet,
      isDropdownOpen: isDropdownOpen ?? this.isDropdownOpen,
    );
  }
}

final class PlanetsErrorState extends PlanetState {
  final String message;
  PlanetsErrorState(this.message);
}

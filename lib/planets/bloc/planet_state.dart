part of 'planet_bloc.dart';

@immutable
sealed class PlanetState {}

final class PlanetInitial extends PlanetState {}

final class PlanetsLoadingState extends PlanetState {}

final class PlanetsLoadedState extends PlanetState {
  final List<PlanetModel> planets;
  PlanetsLoadedState(this.planets);
}

final class PlanetsErrorState extends PlanetState {
  final String message;
  PlanetsErrorState(this.message);
}

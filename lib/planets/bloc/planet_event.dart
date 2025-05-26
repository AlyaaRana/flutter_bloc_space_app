part of 'planet_bloc.dart';

@immutable
sealed class PlanetEvent {}

final class LoadPlanetsEvent extends PlanetEvent {}

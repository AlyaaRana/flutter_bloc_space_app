part of 'astronaut_bloc.dart';

@immutable
sealed class AstronautState {}

final class AstronautInitial extends AstronautState {}

final class AstronautLoadingState extends AstronautState {}

final class AstronautLoadedState extends AstronautState {
  final List<dynamic> astronauts;
  AstronautLoadedState(this.astronauts);
}

final class AstronautErrorState extends AstronautState {
  final String message;
  AstronautErrorState(this.message);
}

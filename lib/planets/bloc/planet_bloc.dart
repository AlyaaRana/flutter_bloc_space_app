import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/planet_repository.dart';
import '../data/planet_model.dart';

part 'planet_event.dart';
part 'planet_state.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  final PlanetRepository planetRepository;
  PlanetBloc(this.planetRepository) : super(PlanetInitial()) {
    on<LoadPlanetsEvent>(_onLoadPlanets);
  }

  FutureOr<void> _onLoadPlanets(
    LoadPlanetsEvent event,
    Emitter<PlanetState> emit,
  ) async {
    emit(PlanetsLoadingState());
    try {
      List<PlanetModel> planets = await planetRepository.getPlanetsFromJson();
      emit(PlanetsLoadedState(planets));
    } catch (e) {
      emit(PlanetsErrorState("Failed to load planets"));
    }
  }
}

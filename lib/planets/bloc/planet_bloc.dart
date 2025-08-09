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
    on<SelectPlanet>(_onSelectPlanet);
    on<ToggleDropdown>(_onToggleDropdown);
    on<CloseDropdown>(_onCloseDropdown);
    on<LoadPlanetsWithSelectedEvent>(_onLoadPlanetsWithSelected);
  }

  FutureOr<void> _onLoadPlanets(
      LoadPlanetsEvent event,
      Emitter<PlanetState> emit,
      ) async {
    emit(PlanetsLoadingState());
    try {
      List<PlanetModel> planets = await planetRepository.getPlanetsFromJson();

      if (planets.isNotEmpty) {
        emit(PlanetsLoadedState(
          planets: planets,
          selectedPlanet: planets.first, // Set default selected planet
        ));
      } else {
        emit(PlanetsErrorState('No planets found'));
      }
    } catch (e, st) {
      final msg = 'Failed to load planets: $e';
      print(msg);
      print(st);
      emit(PlanetsErrorState(msg));
    }
  }

  // New method to load planets with a specific selected planet
  FutureOr<void> _onLoadPlanetsWithSelected(
      LoadPlanetsWithSelectedEvent event,
      Emitter<PlanetState> emit,
      ) async {
    emit(PlanetsLoadingState());
    try {
      List<PlanetModel> planets = await planetRepository.getPlanetsFromJson();

      if (planets.isNotEmpty) {
        // Find the selected planet in the list, or use first as default
        PlanetModel selectedPlanet = planets.firstWhere(
              (planet) => planet.name == event.selectedPlanet.name,
          orElse: () => planets.first,
        );

        emit(PlanetsLoadedState(
          planets: planets,
          selectedPlanet: selectedPlanet,
        ));
      } else {
        emit(PlanetsErrorState('No planets found'));
      }
    } catch (e, st) {
      final msg = 'Failed to load planets: $e';
      print(msg);
      print(st);
      emit(PlanetsErrorState(msg));
    }
  }

  void _onToggleDropdown(ToggleDropdown event, Emitter<PlanetState> emit) {
    final currentState = state;
    print("ToggleDropdown called, current state: $currentState");

    if (currentState is PlanetsLoadedState) {
      print("Current isDropdownOpen: ${currentState.isDropdownOpen}");
      emit(currentState.copyWith(
        isDropdownOpen: !currentState.isDropdownOpen,
      ));
      print("New isDropdownOpen: ${!currentState.isDropdownOpen}");
    }
  }

  void _onSelectPlanet(SelectPlanet event, Emitter<PlanetState> emit) {
    final currentState = state;
    print("SelectPlanet called: ${event.planet.name}");

    if (currentState is PlanetsLoadedState) {
      emit(currentState.copyWith(
        selectedPlanet: event.planet,
        isDropdownOpen: false,
      ));
      print("Planet selected and dropdown closed");
    }
  }

  void _onCloseDropdown(CloseDropdown event, Emitter<PlanetState> emit) {
    final currentState = state;
    print("CloseDropdown called");

    if (currentState is PlanetsLoadedState) {
      emit(currentState.copyWith(isDropdownOpen: false));
      print("Dropdown closed");
    }
  }
}
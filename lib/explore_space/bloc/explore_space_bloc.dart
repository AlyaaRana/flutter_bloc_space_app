import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacenea/explore_space/bloc/explore_space_event.dart';
import 'package:spacenea/explore_space/bloc/explore_space_state.dart';


class ExploreSpaceBloc extends Bloc<ExploreSpaceEvent, ExploreSpaceState> {
  ExploreSpaceBloc() : super(ExploreSpaceInitialState()) {
    on<ExploreSpaceEvent>(_onLoadExploreSpaceEvent);
  }

  Future<void> _onLoadExploreSpaceEvent(
      ExploreSpaceEvent event, Emitter<ExploreSpaceState> emit) async {
    emit(ExploreSpaceLoadingState());
    try {
      await Future.delayed(Duration(seconds: 2));
      emit(ExploreSpaceLoadedState(["Data 1", "Data 2", "Data 3"]));
    } catch (e) {
      emit(ExploreSpaceErrorState("Error loading data"));
    }
  }
}
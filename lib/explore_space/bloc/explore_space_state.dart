abstract class ExploreSpaceState {}

class ExploreSpaceInitialState extends ExploreSpaceState {}

class ExploreSpaceLoadingState extends ExploreSpaceState {}

class ExploreSpaceLoadedState extends ExploreSpaceState {
  final List<String> data;
  ExploreSpaceLoadedState(this.data);
}

class ExploreSpaceErrorState extends ExploreSpaceState {
  final String message;
  ExploreSpaceErrorState(this.message);
}

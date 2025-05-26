abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final String greeting;
  HomeLoadedState(this.greeting);
}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}

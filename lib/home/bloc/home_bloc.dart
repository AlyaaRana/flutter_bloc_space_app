import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeLoadingState()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(HomeLoadingState());
      final now = DateTime.now();
      final greeting = _getGreeting(now);
      await Future.delayed(Duration(seconds: 1));
      emit(HomeLoadedState(greeting));
    });
  }

  String _getGreeting(DateTime now) {
    final hour = now.hour;
    if (hour < 12) return "Good Morning, Alyaa ☀️";
    if (hour < 18) return "Good Afternoon, Alyaa 🌤️";
    return "Good Evening, Alyaa 🌙";
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'astronaut_event.dart';
part 'astronaut_state.dart';

class AstronautBloc extends Bloc<AstronautEvent, AstronautState> {
  AstronautBloc() : super(AstronautInitial()) {
    on<AstronautEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

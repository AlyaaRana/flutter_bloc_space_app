import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../planets/data/planet_service.dart';
import '../../planets/data/planet_repository.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import 'home_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Builder(
        builder: (context) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.read<HomeBloc>().add(LoadHomeEvent());
          });
          return HomePage();
        },
      ),
    );
  }
}

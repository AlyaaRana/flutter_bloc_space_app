import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/planet_service.dart';
import '../data/planet_repository.dart';
import '../bloc/planet_bloc.dart';
import 'planet_page.dart';

class PlanetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              PlanetBloc(PlanetRepository(planetService: PlanetService()))
                ..add(LoadPlanetsEvent()),
      child: PlanetPage(),
    );
  }
}

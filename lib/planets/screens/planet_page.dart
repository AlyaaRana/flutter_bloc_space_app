import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/app_colors.dart';
import '../bloc/planet_bloc.dart';
import '../data/planet_model.dart';
import '../sections/header_explore.dart';
import '../sections/stories_section.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<PlanetBloc, PlanetState>(
        builder: (context, state) {
          if (state is PlanetsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PlanetsLoadedState) {
            final planet = state.planets.first;

            return SafeArea(
              child: Column(
                children: [HeaderExplore(planet: planet), StoriesSection()],
              ),
            );
          } else if (state is PlanetsErrorState) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text("Welcome!"));
        },
      ),
    );
  }
}

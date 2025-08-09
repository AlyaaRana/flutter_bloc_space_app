import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/app_colors.dart';
import '../bloc/planet_bloc.dart';
import '../data/planet_model.dart';
import '../sections/header_explore.dart';
import '../sections/stories_section.dart';

class PlanetPage extends StatelessWidget {
  final PlanetModel? selectedPlanet;

  const PlanetPage({super.key, this.selectedPlanet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocBuilder<PlanetBloc, PlanetState>(
        builder: (context, state) {
          // Initialize bloc when widget is built
          if (state is PlanetInitial) {
            if (selectedPlanet != null) {
              context.read<PlanetBloc>().add(LoadPlanetsWithSelectedEvent(selectedPlanet!));
            } else {
              context.read<PlanetBloc>().add(LoadPlanetsEvent());
            }
            return Center(child: CircularProgressIndicator());
          }

          if (state is PlanetsLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PlanetsLoadedState) {
            return SafeArea(
              child: Column(
                children: [
                  HeaderExplore(),
                  StoriesSection()
                ],
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
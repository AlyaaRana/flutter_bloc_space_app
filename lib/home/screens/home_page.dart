import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacenea/home/sections/astronaut_section.dart';
import 'package:spacenea/home/sections/planet_section.dart';
import 'package:spacenea/home/sections/greetings.dart';
import 'package:spacenea/home/sections/hero_card.dart';
import 'package:spacenea/theme/app_colors.dart';

import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../../planets/bloc/planet_bloc.dart';
import '../../astronaut/bloc/astronaut_bloc.dart';
import '../../planets/data/planet_service.dart';
import '../../planets/data/planet_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()..add(LoadHomeEvent())),
        BlocProvider(
          create:
              (_) =>
                  PlanetBloc(PlanetRepository(planetService: PlanetService()))
                    ..add(LoadPlanetsEvent()),
        ),
        BlocProvider(create: (_) => AstronautBloc()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return _buildLoading();
            } else if (state is HomeLoadedState) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Greetings(),
                      HeroCard(),
                      _buildPlanetSection(),
                      _buildAstronautSection(),
                    ],
                  ),
                ),
              );
            } else if (state is HomeErrorState) {
              return _buildError(state.message);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());

  Widget _buildError(String message) =>
      Center(child: Text(message, style: TextStyle(color: Colors.red)));

  Widget _buildPlanetSection() {
    return BlocBuilder<PlanetBloc, PlanetState>(
      builder: (context, state) {
        if (state is PlanetsLoadingState) {
          return _buildLoading();
        } else if (state is PlanetsLoadedState) {
          return const PlanetSection(planets: []);
        } else if (state is PlanetsErrorState) {
          return _buildError(state.message);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildAstronautSection() {
    return BlocBuilder<AstronautBloc, AstronautState>(
      builder: (context, state) {
        if (state is AstronautLoadingState) {
          return _buildLoading();
        } else if (state is AstronautLoadedState) {
          return const AstronautSection();
        } else if (state is AstronautErrorState) {
          return _buildError(state.message);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

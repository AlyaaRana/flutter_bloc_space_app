import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacenea/planets/bloc/planet_bloc.dart';
import 'package:spacenea/planets/data/planet_repository.dart';
import 'package:spacenea/planets/data/planet_service.dart';
import 'router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Global PlanetBloc - accessible from all routes
        BlocProvider<PlanetBloc>(
          create: (context) => PlanetBloc(
              PlanetRepository(planetService: PlanetService())
          )..add(LoadPlanetsEvent()),
        ),

      ],
      child: MaterialApp(
        title: 'Space App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}

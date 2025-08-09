import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacenea/planets/data/planet_model.dart';
import 'package:spacenea/planets/bloc/planet_bloc.dart';
import 'package:spacenea/theme/app_text_styles.dart';
import '../../theme/app_images.dart';
import '../../widgets/sub_title.dart';

class PlanetSection extends StatelessWidget {
  final List<PlanetModel> planets;

  const PlanetSection({super.key, required this.planets});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    if (planets.isEmpty) {
      return Column(
        children: [
          SubTitle(subTitle: "Explore the Planet", onTapMore: () {}),
          const SizedBox(height: 20),
          const Text(
            "No planets available",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      );
    }

    return Column(
      children: [
        SubTitle(subTitle: "Explore the Planet", onTapMore: () {}),
        CarouselSlider.builder(
          itemCount: planets.length,
          options: CarouselOptions(aspectRatio: 1),
          itemBuilder: (context, index, realIndex) {
            final planet = planets[index];
            return GestureDetector(
              onTap: () {
                // Set selected planet in bloc before navigation
                context.read<PlanetBloc>().add(SelectPlanet(planet));

                // Navigate to planet explore page
                Navigator.pushNamed(context, '/planets-explore');
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 500,
                width: screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  image: DecorationImage(
                    image: AssetImage(planet.image ?? "assets/image/Mars.png"),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      print("Error loading image: $exception");
                    },
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(planet.name ?? "MARS", style: AppTextStyles.titlePlanet),
                    Text(planet.initial, style: AppTextStyles.subTitlePlanet),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
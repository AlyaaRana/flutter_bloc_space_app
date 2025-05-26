import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spacenea/planets/data/planet_model.dart';
import 'package:spacenea/theme/app_text_styles.dart';
import '../../theme/app_images.dart';
import '../../widgets/sub_title.dart';

class PlanetSection extends StatelessWidget {
  final List<PlanetModel> planets;
  const PlanetSection({super.key, required this.planets});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubTitle(subTitle: "Explore the Planet", onTapMore: () {}),
        CarouselSlider.builder(
          itemCount: 10,
          options: CarouselOptions(aspectRatio: 1.2),
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/planets-explore');
              },
              child: Container(
                height: 440,
                width: 330,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.sliderPlanet),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      print("Error loading image: $exception");
                    },
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mars", style: AppTextStyles.titlePlanet),
                    SizedBox(height: 10),
                    Text("The Red Planet", style: AppTextStyles.subTitlePlanet),
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

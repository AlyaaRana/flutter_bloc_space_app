import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spacenea/theme/app_icons.dart';
import 'package:spacenea/theme/app_text_styles.dart';
import '../../theme/app_colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PlanetDetails extends StatelessWidget {
  final String planetName;
  final String initialPlanet;
  final String icPlanet;
  final String description;
  final String rotationPeriod;
  final String distance;
  final String diameter;
  final String type;
  final List<String> photos;

  const PlanetDetails({
    super.key,
    required this.planetName,
    required this.initialPlanet,
    required this.icPlanet,
    required this.description,
    required this.rotationPeriod,
    required this.distance,
    required this.diameter,
    required this.type,
    required this.photos,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(planetName, style: AppTextStyles.titlePlanet),
                  SizedBox(height: 10),
                  Text(initialPlanet, style: AppTextStyles.titlePlanet),
                ],
              ),
              Image.asset(icPlanet),
            ],
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              infoBox(AppIcons.rotationPeriod, rotationPeriod),
              infoBox(AppIcons.orbitalPeriod, distance),
              infoBox(AppIcons.planetType, type),
              infoBox(AppIcons.diameter, diameter),
            ],
          ),
          const SizedBox(height: 20),
          Text(description, style: AppTextStyles.descPlanet),
          const SizedBox(height: 20),
          Text("Related Images", style: AppTextStyles.h3),
          const SizedBox(height: 15),
          CarouselSlider(
            items:
                photos
                    .map(
                      (photo) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(photo),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .toList(),
            options: CarouselOptions(
              // Set the desired options for the carousel
              height: 194,
              // Set the height of the carousel
              autoPlay: true, // Enable auto-play
              autoPlayCurve: Curves.easeInOut, // Set the auto-play curve
              autoPlayAnimationDuration: Duration(
                milliseconds: 500,
              ), // Set the auto-play animation duration
              aspectRatio: 16 / 9, // Set the aspect ratio of each item
              viewportFraction: 0.8, // Set the viewport fraction for each item
              initialPage: 0, // Set the initial page index
              enlargeStrategy:
                  CenterPageEnlargeStrategy
                      .height, // Perbesar berdasarkan tinggi
            ),
          ),
        ],
      ),
    );
  }

  Widget infoBox(String iconPath, String label) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        const SizedBox(width: 10),
        Text(label, style: AppTextStyles.infoPlanet),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spacenea/planets/data/planet_model.dart';
import 'package:spacenea/theme/app_icons.dart';

import '../../theme/app_images.dart';
import '../../theme/app_text_styles.dart';
import '../../widgets/sub_title.dart';

class HeaderExplore extends StatelessWidget {
  final PlanetModel planet;
  const HeaderExplore({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text("Explore", style: AppTextStyles.titlePlanetHeader),
                    SizedBox(width: 3),
                    SvgPicture.asset(AppIcons.arrowUp),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppIcons.location),
                    SizedBox(width: 5),
                    Text(planet.name, style: AppTextStyles.titleExplore),
                  ],
                ),
              ],
            ),
            SvgPicture.asset(AppIcons.searchIcon),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/planets-detail', arguments: planet);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 387,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(planet.image),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    print("Error loading image: $exception");
                  },
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(planet.name, style: AppTextStyles.titlePlanet),
                      SizedBox(height: 10),
                      Text(planet.initial, style: AppTextStyles.subTitlePlanet),
                    ],
                  ),
                  Spacer(),
                  Image.asset(AppImages.nasaLogo),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

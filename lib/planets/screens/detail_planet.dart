import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spacenea/theme/app_icons.dart';
import 'package:spacenea/theme/app_text_styles.dart';

import '../../widgets/detail_app_bar.dart';
import '../data/planet_model.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_images.dart';
import '../sections/planet_details.dart';
import '../sections/planet_header.dart';

class DetailPlanetScreen extends StatelessWidget {
  final PlanetModel planet;

  const DetailPlanetScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: DetailAppBar(
        title: planet.name,
        titleStyle: AppTextStyles.titleDetailPlanet,
        actions: [_buildCircularIcon(AppIcons.vid3d)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlanetHeader(imageAsset: planet.image),
            PlanetDetails(
              planetName: planet.name,
              description: planet.description,
              rotationPeriod: planet.rotationPeriod,
              distance: planet.orbitalPeriod,
              diameter: planet.diameter,
              type: planet.type,
              initialPlanet: planet.initial,
              icPlanet: planet.icPlanet,
              photos: planet.photos,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularIcon(String assetPath) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(child: SvgPicture.asset(assetPath)),
    );
  }

  Widget infoBox(Icon, String label) {
    return Row(
      children: [
        SvgPicture(Icon),
        const SizedBox(width: 10),
        Text(label, style: AppTextStyles.infoPlanet),
      ],
    );
  }
}

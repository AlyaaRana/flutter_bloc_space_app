import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spacenea/theme/app_colors.dart';
import '../data/planet_model.dart';
import '../sections/planet_details.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_text_styles.dart';

class PlanetDetailsPage extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TextStyle? titleStyle;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;
  final String imageAsset;
  final PlanetModel planet;

  const PlanetDetailsPage({
    super.key,
    this.title,
    this.titleStyle,
    this.actions,
    this.onBackPressed, required this.imageAsset, required this.planet,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          title ?? "",
          style: titleStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: GestureDetector(
          onTap: onBackPressed ?? () => Navigator.of(context).pop(),
          child: _buildCircularIcon(AppIcons.arrowBack),
        ),
        actions: actions,
      ),
      body: Stack(
        children: [
          Container(color: AppColors.background),
          Positioned(
            top: 0, // jarak dari atas layar
            left: 0,
            right: 0,
            child: Container(
              height: 440,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            top: 370,
            left: 0,
            right: 0,
            child: PlanetDetails(
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
          ),
        ],
      )
    );
  }

  Widget _buildCircularIcon(String assetPath) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: SvgPicture.asset(
          assetPath,
          width: 30,
          height: 30,
        ),
      ),
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

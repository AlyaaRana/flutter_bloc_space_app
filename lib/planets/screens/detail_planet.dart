import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../theme/app_icons.dart';
import '../../theme/app_text_styles.dart';
import '../widgets/3d_object_popup.dart';
import 'planet_detail_page.dart';
import '../data/planet_model.dart';

class DetailPlanetScreen extends StatelessWidget {
  final PlanetModel planet;

  const DetailPlanetScreen({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    return PlanetDetailsPage(
      title: planet.name,
      titleStyle: AppTextStyles.titleDetailPlanet,
      imageAsset: planet.image,
      planet: planet,
      actions: [_buildCircularIcon(context, AppIcons.vid3d)],
    );
  }

  Widget _buildCircularIcon(BuildContext context, String assetPath) {
    return GestureDetector(
      onTap: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: '',
          transitionDuration: const Duration(milliseconds: 300),
          pageBuilder: (context, anim1, anim2) {
            return SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Material(
                    color: Colors.transparent,
                    child: IntrinsicHeight(
                      child: PopUpObject3d(planet: planet),
                    ),
                  ),
                ),
              ),
            );
          },
          transitionBuilder: (context, anim1, anim2, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, -1),
                end: Offset.zero,
              ).animate(anim1),
              child: child,
            );
          },
        );
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(child: SvgPicture.asset(assetPath)),
      ),
    );
  }
}

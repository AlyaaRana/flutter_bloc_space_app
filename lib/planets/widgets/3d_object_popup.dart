import 'package:flutter/material.dart';
import '../../theme/app_text_styles.dart';
import '../data/planet_model.dart';
import '../screens/3d_planet.dart';

class PopUpObject3d extends StatelessWidget {
  final PlanetModel planet;

  const PopUpObject3d({
    super.key,
    required this.planet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Show object in 3D', style: AppTextStyles.title3DPopUp),
          const SizedBox(height: 15),
          Text(
            'For this feature, you need an ARCore-enabled device, which must also be updated. After clicking open, you will be redirected to an app from Google that allows you to view the objects',
            style: AppTextStyles.desc3DPopUp,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Text('Close', style: AppTextStyles.buttonPopUp),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlanetObject3d(
                        object3dPath: planet.object3d,
                        planetName: planet.name,
                      ),
                    ),
                  );
                },
                child: Text('Open', style: AppTextStyles.buttonPopUp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

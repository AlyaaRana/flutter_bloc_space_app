import 'package:flutter/material.dart';

class PlanetHeader extends StatelessWidget {
  final String imageAsset;

  const PlanetHeader({super.key, required this.imageAsset});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

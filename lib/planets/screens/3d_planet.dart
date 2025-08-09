import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class PlanetObject3d extends StatelessWidget {
  final String object3dPath;
  final String planetName;

  const PlanetObject3d({
    super.key,
    required this.object3dPath,
    required this.planetName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$planetName 3D View')),
      body: ModelViewer(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        src: object3dPath,
        alt: 'A 3D model of $planetName',
        ar: true,
        autoRotate: true,
        disableZoom: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:spacenea/planets/sections/stories_header.dart';
import 'package:spacenea/planets/sections/stories_section.dart';

import '../../widgets/detail_app_bar.dart';
import '../data/planet_model.dart';

class PlanetStories extends StatelessWidget {
  final PlanetModel planet;
  const PlanetStories({super.key, required this.planet});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DetailAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StoriesHeader(
              date: '',
              storiesName: '',
              storiesImage: '',
              planetName: '',
            ),
            StoriesSection(),
          ],
        ),
      ),
    );
  }
}

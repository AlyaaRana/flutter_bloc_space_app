import 'package:flutter/material.dart';
import 'package:spacenea/theme/app_colors.dart';

import '../../theme/app_text_styles.dart';

class StoriesDetails extends StatelessWidget {
  final String developer, desc;
  const StoriesDetails({
    super.key,
    required this.developer,
    required this.desc,
  });
  //jangan lupa panggil model nya buat storiees
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.6,
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          internationalSpaceStation(
            "NASA’s Marshall Space Flight Center",
            "assets/images/iss.png",
          ),
          SizedBox(height: 30),
          Text(developer, style: AppTextStyles.h3),
          SizedBox(height: 15),
          Text(desc, style: AppTextStyles.descPlanet),
        ],
      ),
    );
  }

  Widget internationalSpaceStation(String name, String image) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 10, top: 5, bottom: 5),
      height: 50,
      color: Colors.white,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(image),
          Text(name, style: AppTextStyles.descPlanet),
        ],
      ),
    );
  }
}

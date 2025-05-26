import 'package:flutter/material.dart';
import 'package:spacenea/theme/app_text_styles.dart';

class StoriesHeader extends StatelessWidget {
  final String storiesName;
  final String storiesImage;
  final String planetName;
  final String date;
  const StoriesHeader({
    super.key,
    required this.storiesName,
    required this.storiesImage,
    required this.planetName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(storiesImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
        //intinya ini dipaling bawah dari header diatas bottom sheet
        Column(
          children: [
            _planetName(planetName),
            SizedBox(height: 10),
            Text(storiesName, style: AppTextStyles.titleNews),
            SizedBox(height: 10),
            Text(date, style: AppTextStyles.date),
          ],
        ),
      ],
    );
  }

  Widget _planetName(String name) {
    return Opacity(
      opacity: 0.5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(name, style: AppTextStyles.planetNameStories),
      ),
    );
  }
}

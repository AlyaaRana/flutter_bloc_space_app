import 'package:flutter/material.dart';
import '../../theme/app_images.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/app_colors.dart';


class HeroCard extends StatelessWidget {
  const HeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.whiteHero,
        borderRadius: BorderRadius.circular(20),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '🚀 Learn and Grow with the Universe!',
                      style: AppTextStyles.h1,
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'So come, young explorers, lets not ignore. The universe calls us, with wonders galore!',
                      style: TextStyle(fontSize: 12, color: AppColors.secondary50),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/explore-space');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Explore here !!',
                          style: AppTextStyles.headerButton,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 186,
              child: Stack(
                children: [
                  Container(
                    width: 190,
                    height: 186,
                    child: Image.asset(
                      AppImages.heroImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:spacenea/theme/app_images.dart';
import 'package:spacenea/theme/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/app_icons.dart';

class ObjectSpace extends StatelessWidget {
  const ObjectSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 530,
      width: 390,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //title
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        "Teleskop Luar Angkasa James Webb",
                        style: AppTextStyles.titleExplore,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      Text(
                        "1,5 juta km dari bumi",
                        style: AppTextStyles.subTitleExplore,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SvgPicture.asset(
                    AppIcons.infoIcon,
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),

            //desc
            //image
            Image.asset(AppImages.teleksopJames),
          ],
        ),
      ),
    );
  }
}

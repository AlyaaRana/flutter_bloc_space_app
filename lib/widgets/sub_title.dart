import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

class SubTitle extends StatelessWidget {
  final String subTitle;
  final VoidCallback? onTapMore;
  final String? moreText;
  final Widget? moreIconOrImage;

  const SubTitle({
    super.key,
    required this.subTitle,
    this.onTapMore,
    this.moreText = "More",
    this.moreIconOrImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            bottom: 20.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subTitle, style: AppTextStyles.h3),
              if (onTapMore != null)
                InkWell(
                  onTap: onTapMore,
                  child: Row(
                    children: [
                      if (moreIconOrImage != null) moreIconOrImage!,
                      if (moreText != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(moreText!, style: AppTextStyles.more),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

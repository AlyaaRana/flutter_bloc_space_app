import 'package:flutter/material.dart';

import '../../widgets/sub_title.dart';

class AstronautSection extends StatelessWidget {
  const AstronautSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SubTitle(subTitle: "Astronaut of legends", onTapMore: () {}),
      ],
    );
  }
}

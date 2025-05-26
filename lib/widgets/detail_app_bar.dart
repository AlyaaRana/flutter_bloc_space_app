import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../theme/app_icons.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final TextStyle? titleStyle;
  final List<Widget>? actions;
  final VoidCallback? onBackPressed;

  const DetailAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.actions,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? "", style: titleStyle),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: onBackPressed ?? () => Navigator.of(context).pop(),
        child: _buildCircularIcon(AppIcons.arrowBack),
      ),
      actions: actions,
    );
  }

  Widget _buildCircularIcon(String assetPath) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(child: SvgPicture.asset(assetPath)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

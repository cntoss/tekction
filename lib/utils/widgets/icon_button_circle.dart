import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class IconButtonCircle extends StatelessWidget {
  const IconButtonCircle({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.bgColor,
    this.width,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
    this.padding,
  }) : super(key: key);
  final double? iconWidth;
  final double? iconHeight;
  final Color? iconColor;
  final String icon;
  final Color? bgColor;
  final double? width;
  final double? padding;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: bgColor, //?? LightTheme.data.primaryColor,
        padding: padding != null ? EdgeInsets.all(padding!) : EdgeInsets.zero,
      ),
      child: SvgPicture.asset(
        icon,
        height: iconHeight,
        width: iconWidth,
        color: iconColor,
      ),
    );
  }
}

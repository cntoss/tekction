import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

import 'icon_button_circle.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          shape: BoxShape.circle),
      padding: const EdgeInsets.all(Dimens.dp8),
      child: IconButtonCircle(
        bgColor: Colors.white,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}

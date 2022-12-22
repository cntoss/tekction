import 'package:flutter/material.dart';

class PrimaryButtonIcon extends StatelessWidget {
  const PrimaryButtonIcon({
    super.key,
    required this.label,
    required this.iconData,
    this.textStyle,
    this.onPressed,
    this.buttonColor,
    this.iconColor,
  });

  /// Callback when button is pressed.
  final VoidCallback? onPressed;

  /// Button Text.
  final String label;

  /// Button Color.
  final Color? buttonColor;

  /// Icon Color.
  final Color? iconColor;

  /// Text style.
  final TextStyle? textStyle;

  /// Icon data.
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: buttonColor ?? const Color(0xffEF5858),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              iconData,
              color: iconColor ?? Colors.white,
            ),
            const SizedBox(width: 16),
            Text(
              label,
              style: textStyle ??
                  const TextStyle(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

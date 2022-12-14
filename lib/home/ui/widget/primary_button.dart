import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, this.onPressed, required this.label, this.textStyle});

  /// Callback when button is pressed.
  final VoidCallback? onPressed;

  /// Button Text.
  final String label;

  /// Text style.
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: const Color(0xffEF5858),
        ),
        child: Text(
          label,
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}

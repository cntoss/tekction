import 'package:flutter/material.dart';

import 'regular_text.dart';

class InputLabel extends StatelessWidget {
  final String? label;
  final bool? isRequired;
  final Color? labelColor;
  const InputLabel({
    Key? key,
    this.label,
    this.isRequired,
    this.labelColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (label == null) return const SizedBox();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RegularText(
              label ?? '',
              style: TextStyle(
                  color: labelColor ??
                      Theme.of(context).textTheme.headline5!.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            const SizedBox(width: 8),
            isRequired == true
                ? RegularText(
                    "required",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 10,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

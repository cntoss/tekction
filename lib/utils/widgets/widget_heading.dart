import 'package:flutter/material.dart';

import 'heading_text_title.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        HeadingTextTitle(title),
        const SizedBox(height: 60),
      ],
    );
  }
}

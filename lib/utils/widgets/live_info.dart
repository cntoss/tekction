import 'package:flutter/material.dart';

class LiveInfo extends StatelessWidget {
  const LiveInfo({
    super.key,
    required this.iconData,
    required this.text,
  });

  /// Icon data.
  final IconData iconData;

  /// Info.
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      width: 57,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        children: [
          Icon(
            iconData,
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

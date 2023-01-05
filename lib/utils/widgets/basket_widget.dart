import 'package:flutter/material.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: 30,
        height: 40,
        child: Icon(
          Icons.card_travel,
          size: 28,
          color: Colors.white,
        ),
      ),
      const Positioned(
        bottom: 0,
        left: 0,
        child: CircleAvatar(
          maxRadius: 11,
          backgroundColor: Colors.red,
          child: Text(
            '1',
            style: TextStyle(color: Colors.white),
          ),
        ),
      )
    ]);
  }
}

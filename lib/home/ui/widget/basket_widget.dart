import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resource/asset_manager.dart';

class BasketWidget extends StatelessWidget {
  const BasketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: 30,
        height: 40,
        child: SvgPicture.asset(
          SvgAsset.basket,
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

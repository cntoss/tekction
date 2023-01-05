import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class ItemMenu extends StatelessWidget {
  /// The `color` arguments  activeIcon [BottomNavigationBarItem]
  /// The `assetPath` arguments   asset path icon  [BottomNavigationBarItem]
  const ItemMenu(
      {Key? key,
      required this.assetPath,
      required this.color,
      required this.isActive})
      : super(key: key);
  final String assetPath;
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,
            color: color,
            height: 21,
            width: 21,
          ),
          Visibility(
            visible: isActive,
            child: Container(
              margin: const EdgeInsets.only(top: 10.75),
              height: 4,
              width: 4,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: StaticColors.activeIcon),
            ),
          ),
        ],
      ),
    );
  }
}

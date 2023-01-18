import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

class ItemLiveMenu extends StatelessWidget {
  /// The `color` arguments  activeIcon [BottomNavigationBarItem]
  /// The `assetPath` arguments   asset path icon  [BottomNavigationBarItem]
  const ItemLiveMenu({Key? key, required this.assetPath, required this.color})
      : super(key: key);
  final String assetPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(72)),
          gradient: LinearGradient(
              colors: [ColorManager.activeIcon, ColorManager.gradient4])),
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      child: SvgPicture.asset(
        assetPath,
        color: color,
        height: 17,
        width: 17,
      ),
    );
  }
}

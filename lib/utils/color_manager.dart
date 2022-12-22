import 'package:flutter/material.dart';

class ColorManager {
  static Color blue = HexColor.fromHex("#03174c");
  static Color darkBlue = HexColor.fromHex("#354570");
  static Color formTextColor = HexColor.fromHex("#A1A4B2");
  static Color purple = HexColor.fromHex("#8E97FD");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}

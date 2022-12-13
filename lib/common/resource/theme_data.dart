import 'package:flutter/material.dart';

import '../../service/locator.dart';

ThemeData getApplicationTheme(context) {
  final SizeConfig sizeConfig = locator<SizeConfig>();
  sizeConfig.init(context);
  return ThemeData();
}

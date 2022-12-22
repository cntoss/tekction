import 'package:data_config/data_config.dart';
import 'package:flutter/material.dart';
import 'package:injection/injection.dart';

ThemeData getApplicationTheme(context) {
  final SizeConfig sizeConfig = locator<SizeConfig>();
  sizeConfig.init(context);
  return ThemeData();
}

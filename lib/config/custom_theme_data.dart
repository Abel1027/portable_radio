import 'package:flutter/material.dart';
import 'package:portable_radio/config/custom_color.dart';

class CustomThemeData {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: CustomColor.primary,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: CustomColor.white)),
    iconTheme: const IconThemeData(color: CustomColor.white),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: CustomColor.white,
    ),
  );
}

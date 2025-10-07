import 'package:flutter/material.dart';
import 'package:portable_radio/config/radio_color.dart';

class CustomThemeData {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: RadioColor.primary,
    textTheme: const TextTheme(bodyMedium: TextStyle(color: RadioColor.white)),
  );
}

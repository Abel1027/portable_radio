import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:portable_radio/config/custom_theme_data.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(theme: CustomThemeData.themeData),
    run: testMain,
  );
}

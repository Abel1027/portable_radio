import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portable_radio/config/custom_theme_data.dart';
import 'package:portable_radio/di/provider.dart';
import 'package:portable_radio/l10n/generated/app_localizations.dart';
import 'package:portable_radio/presentation/organism/radio_player.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemeData.themeData,
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      home: Scaffold(body: RadioPlayer()),
    );
  }
}

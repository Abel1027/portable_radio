import 'package:flutter/material.dart';
import 'package:portable_radio/config/custom_theme_data.dart';
import 'package:portable_radio/l10n/generated/app_localizations.dart';

class TestWrapper extends StatelessWidget {
  const TestWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomThemeData.themeData,
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      home: Scaffold(body: child),
    );
  }
}

extension TestWrapperExtension on Widget {
  Widget useTestWrapper() {
    return TestWrapper(child: this);
  }
}

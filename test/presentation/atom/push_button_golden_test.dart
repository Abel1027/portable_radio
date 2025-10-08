import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portable_radio/presentation/atom/push_button.dart';

void main() {
  group(PushButton, () {
    goldenTest(
      'renders correctly',
      fileName: 'push_button_golden',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'pressed',
            child: const PushButton(
              isPressed: true,
              onPressed: null,
              icon: Icons.play_arrow,
            ),
          ),
        ],
      ),
    );
  });
}

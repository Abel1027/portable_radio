import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portable_radio/presentation/atom/knob_button.dart';

void main() {
  group(KnobButton, () {
    goldenTest(
      'renders correctly',
      fileName: 'knob_button_golden',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'initial',
            child: KnobButton(
              value: 0,
              minValue: 0,
              maxValue: 100,
              label: 'Knob',
              onChanged: (_) {},
            ),
          ),
          GoldenTestScenario(
            name: 'rotated',
            child: KnobButton(
              value: 50,
              minValue: 0,
              maxValue: 100,
              label: 'Knob',
              onChanged: (_) {},
            ),
          ),
        ],
      ),
    );
  });
}

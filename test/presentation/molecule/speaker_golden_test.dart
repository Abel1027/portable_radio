import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portable_radio/presentation/molecule/speaker.dart';

void main() {
  group(Speaker, () {
    goldenTest(
      'renders correctly',
      fileName: 'speaker_golden',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(name: 'small', child: const Speaker(size: 200)),
          GoldenTestScenario(name: 'big', child: const Speaker(size: 400)),
        ],
      ),
    );
  });
}

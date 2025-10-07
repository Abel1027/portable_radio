import 'package:flutter/material.dart';
import 'package:flutter_oknob/flutter_oldschool_knob.dart';
import 'package:portable_radio/config/custom_size.dart';
import 'package:portable_radio/config/custom_color.dart';

class KnobButton extends StatelessWidget {
  const KnobButton({
    super.key,
    required this.value,
    required this.minValue,
    required this.maxValue,
    required this.label,
    required this.onChanged,
  });

  final double value;
  final double minValue;
  final double maxValue;
  final String label;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FlutterOKnob(
          knobvalue: value,
          onChanged: onChanged,
          size: CustomSize.xl * 3,
          markerColor: CustomColor.white,
          innerKnobGradient: LinearGradient(
            colors: [CustomColor.primary, CustomColor.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          sensitivity: 1,
          showKnobLabels: false,
          minValue: minValue,
          maxValue: maxValue,
          maxRotationAngle: maxValue,
        ),
        Text(label),
      ],
    );
  }
}

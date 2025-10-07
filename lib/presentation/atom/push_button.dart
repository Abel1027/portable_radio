import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';
import 'package:portable_radio/config/custom_size.dart';
import 'package:portable_radio/config/radio_color.dart';

class PushButton extends StatelessWidget {
  const PushButton({
    super.key,
    required this.isPressed,
    required this.onPressed,
    required this.icon,
    this.iconSize = CustomSize.xl,
    this.shape = Shape.rectangle,
  });

  final bool isPressed;
  final VoidCallback? onPressed;
  final IconData icon;
  final double iconSize;
  final Shape shape;

  @override
  Widget build(BuildContext context) {
    return Button.icon(
      onClick: onPressed,
      icon: icon,
      iconSize: iconSize,
      color: CustomColor.secondary,
      elevation: isPressed ? CustomSize.s : CustomSize.m,
      shape: shape,
      diameter: CustomSize.xl * 2,
    );
  }
}

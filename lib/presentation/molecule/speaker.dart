import 'package:flutter/material.dart';
import 'package:portable_radio/config/custom_size.dart';
import 'package:portable_radio/config/custom_color.dart';

class Speaker extends StatelessWidget {
  const Speaker({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    const holes = 14;
    const holeSize = CustomSize.m;

    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(CustomSize.l),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColor.black, width: CustomSize.s),
        borderRadius: BorderRadius.all(Radius.circular(CustomSize.xl)),
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: holes,
          mainAxisSpacing: CustomSize.m,
          crossAxisSpacing: CustomSize.m,
        ),
        itemCount: holes * holes,
        itemBuilder: (_, _) => Container(
          decoration: BoxDecoration(
            color: CustomColor.black,
            shape: BoxShape.circle,
          ),
          width: holeSize,
          height: holeSize,
        ),
      ),
    );
  }
}

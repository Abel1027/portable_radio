import 'package:flutter/material.dart';
import 'package:portable_radio/config/custom_size.dart';
import 'package:portable_radio/config/radio_color.dart';

class StationDetail extends StatelessWidget {
  const StationDetail({
    super.key,
    required this.direction,
    required this.imageUri,
    required this.imageSize,
    required this.name,
    required this.isFav,
    required this.onFavPressed,
  });

  final Axis direction;
  final Uri imageUri;
  final double imageSize;
  final String name;
  final bool isFav;
  final VoidCallback onFavPressed;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      children: [
        Image.network(imageUri.toString(), width: imageSize, height: imageSize),
        const SizedBox(width: CustomSize.s, height: CustomSize.s),
        Text(name),
        IconButton(
          visualDensity: VisualDensity.compact,
          onPressed: onFavPressed,
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: RadioColor.white,
          ),
        ),
      ],
    );
  }
}

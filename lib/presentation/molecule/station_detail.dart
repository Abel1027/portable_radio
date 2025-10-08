import 'package:flutter/material.dart';
import 'package:portable_radio/config/custom_size.dart';

class StationDetail extends StatelessWidget {
  const StationDetail({
    super.key,
    required this.direction,
    required this.imageUri,
    required this.imageSize,
    required this.name,
    required this.isFav,
    required this.onFavIconPressed,
    this.onFavStationPressed,
  });

  final Axis direction;
  final Uri imageUri;
  final double imageSize;
  final String name;
  final bool isFav;
  final VoidCallback onFavIconPressed;
  final VoidCallback? onFavStationPressed;

  @override
  Widget build(BuildContext context) {
    final isHorizontalAxis = direction == Axis.horizontal;

    return Flex(
      direction: direction,
      children: [
        InkWell(
          onTap: onFavStationPressed,
          child: Flex(
            direction: direction,
            children: [
              Image.network(
                imageUri.toString(),
                width: imageSize,
                height: imageSize,
                errorBuilder: (_, _, _) =>
                    Icon(Icons.error, size: imageSize, opticalSize: imageSize),
              ),
              const SizedBox(width: CustomSize.s, height: CustomSize.s),
              SizedBox(
                width: isHorizontalAxis ? imageSize * 2 : null,
                child: Text(
                  name,
                  maxLines: isHorizontalAxis ? 2 : 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          visualDensity: VisualDensity.compact,
          onPressed: onFavIconPressed,
          icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
        ),
      ],
    );
  }
}

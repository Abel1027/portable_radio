import 'package:flutter/material.dart';
import 'package:miv_buttons/miv_buttons.dart';
import 'package:portable_radio/config/custom_size.dart';
import 'package:portable_radio/domain/model/fav_radio_station.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/l10n/generated/app_localizations.dart';
import 'package:portable_radio/presentation/atom/knob_button.dart';
import 'package:portable_radio/presentation/atom/push_button.dart';
import 'package:portable_radio/presentation/molecule/speaker.dart';
import 'package:portable_radio/presentation/organism/screen.dart';

class RadioPlayer extends StatelessWidget {
  const RadioPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CustomSize.xl),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Speaker(),
              const SizedBox(width: CustomSize.xl),
              SizedBox(
                height: 200,
                width: 400,
                child: Screen(
                  currentFavStation: FavRadioStation(
                    station: RadioStation(
                      name: 'My Station',
                      uri: Uri.parse(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      ),
                      iconUri: Uri.parse(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      ),
                    ),
                    isFav: false,
                  ),
                  favoriteStations: {
                    FavRadioStation(
                      station: RadioStation(
                        name: 'My Station 1',
                        uri: Uri.parse(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                        ),
                        iconUri: Uri.parse(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                        ),
                      ),
                      isFav: false,
                    ),
                    FavRadioStation(
                      station: RadioStation(
                        name: 'My Station 2',
                        uri: Uri.parse(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                        ),
                        iconUri: Uri.parse(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                        ),
                      ),
                      isFav: false,
                    ),
                  },
                  onFavStationChanged: (_) {},
                ),
              ),
            ],
          ),
          const SizedBox(height: CustomSize.l),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: CustomSize.xl,
            children: [
              PushButton(
                isPressed: false,
                onPressed: () {},
                icon: Icons.power_settings_new,
                iconSize: CustomSize.xl,
                shape: Shape.circle,
              ),
              PushButton(
                isPressed: false,
                onPressed: () {},
                icon: Icons.play_arrow,
              ),
              PushButton(isPressed: false, onPressed: () {}, icon: Icons.pause),
              KnobButton(
                value: 0,
                label: S.of(context)!.tuner,
                onChanged: (_) {},
              ),
              KnobButton(
                value: 0,
                label: S.of(context)!.volume,
                onChanged: (_) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

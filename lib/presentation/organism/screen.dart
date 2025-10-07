import 'package:flutter/material.dart';
import 'package:portable_radio/config/custom_size.dart';
import 'package:portable_radio/config/radio_color.dart';
import 'package:portable_radio/domain/model/fav_radio_station.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/l10n/generated/app_localizations.dart';
import 'package:portable_radio/presentation/molecule/station_detail.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.currentFavStation,
    required this.favoriteStations,
    required this.onFavStationChanged,
  });

  final FavRadioStation currentFavStation;
  final Set<FavRadioStation> favoriteStations;
  final ValueChanged<RadioStation> onFavStationChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomSize.l),
      decoration: BoxDecoration(
        color: RadioColor.black,
        border: Border.all(color: RadioColor.secondary, width: CustomSize.s),
        borderRadius: BorderRadius.all(Radius.circular(CustomSize.xl)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: CustomSize.xl,
              vertical: CustomSize.l,
            ),
            child: StationDetail(
              direction: Axis.vertical,
              imageUri: currentFavStation.station.iconUri,
              imageSize: CustomSize.xl * 2,
              name: currentFavStation.station.name,
              isFav: currentFavStation.isFav,
              onFavPressed: () {
                onFavStationChanged(currentFavStation.station);
              },
            ),
          ),
          Container(
            width: CustomSize.s,
            margin: EdgeInsets.symmetric(horizontal: CustomSize.l),
            decoration: BoxDecoration(
              color: RadioColor.primary,
              borderRadius: BorderRadius.circular(CustomSize.xs),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(S.of(context)!.favorites),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      final favStation = favoriteStations.elementAt(index);

                      return StationDetail(
                        direction: Axis.horizontal,
                        imageUri: favStation.station.iconUri,
                        imageSize: CustomSize.xl,
                        name: favStation.station.name,
                        isFav: favStation.isFav,
                        onFavPressed: () {
                          onFavStationChanged(favStation.station);
                        },
                      );
                    },
                    separatorBuilder: (_, _) =>
                        const Divider(color: RadioColor.primary),
                    itemCount: favoriteStations.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:portable_radio/config/custom_size.dart';
import 'package:portable_radio/config/custom_color.dart';
import 'package:portable_radio/domain/model/fav_radio_station.dart';
import 'package:portable_radio/domain/model/radio_station.dart';
import 'package:portable_radio/l10n/generated/app_localizations.dart';
import 'package:portable_radio/presentation/molecule/station_detail.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.isOn,
    required this.isLoading,
    required this.currentFavStation,
    required this.favoriteStations,
    required this.onStationFavIconPressed,
    required this.onFavStationIconPressed,
    required this.onFavStationPressed,
  });

  final bool isOn;
  final bool isLoading;
  final FavRadioStation? currentFavStation;
  final List<RadioStation> favoriteStations;
  final ValueChanged<FavRadioStation> onStationFavIconPressed;
  final ValueChanged<RadioStation> onFavStationIconPressed;
  final ValueChanged<RadioStation> onFavStationPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(CustomSize.l),
      decoration: BoxDecoration(
        color: CustomColor.black,
        border: Border.all(color: CustomColor.secondary, width: CustomSize.s),
        borderRadius: BorderRadius.all(Radius.circular(CustomSize.xl)),
      ),
      child: isOn
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: CustomSize.xl,
                    vertical: CustomSize.l,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: currentFavStation == null
                        ? SizedBox.shrink()
                        : StationDetail(
                            direction: Axis.vertical,
                            imageUri: currentFavStation!.station.iconUri,
                            imageSize: CustomSize.xl * 1.5,
                            name: currentFavStation!.station.name,
                            isFav: currentFavStation!.isFav,
                            onFavIconPressed: () {
                              onStationFavIconPressed(currentFavStation!);
                            },
                          ),
                  ),
                ),
                Container(
                  width: CustomSize.s,
                  margin: EdgeInsets.symmetric(horizontal: CustomSize.l),
                  decoration: BoxDecoration(
                    color: CustomColor.primary,
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
                            final favStation = favoriteStations.elementAt(
                              index,
                            );

                            return StationDetail(
                              direction: Axis.horizontal,
                              imageUri: favStation.iconUri,
                              imageSize: CustomSize.xl,
                              name: favStation.name,
                              isFav: true,
                              onFavIconPressed: () {
                                onFavStationIconPressed(favStation);
                              },
                              onFavStationPressed: () {
                                onFavStationPressed(favStation);
                              },
                            );
                          },
                          separatorBuilder: (_, _) =>
                              const Divider(color: CustomColor.primary),
                          itemCount: favoriteStations.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : isLoading
          ? const Center(child: CircularProgressIndicator())
          : SizedBox.shrink(),
    );
  }
}

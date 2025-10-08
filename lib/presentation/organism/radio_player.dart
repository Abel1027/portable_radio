import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miv_buttons/miv_buttons.dart';
import 'package:portable_radio/config/custom_size.dart';
import 'package:portable_radio/di/provider.dart';
import 'package:portable_radio/domain/model/option.dart';
import 'package:portable_radio/l10n/generated/app_localizations.dart';
import 'package:portable_radio/presentation/atom/knob_button.dart';
import 'package:portable_radio/presentation/atom/push_button.dart';
import 'package:portable_radio/presentation/molecule/speaker.dart';
import 'package:portable_radio/presentation/organism/screen.dart';
import 'package:portable_radio/presentation/view_model/radio_player_cubit.dart';
import 'package:portable_radio/presentation/view_model/radio_player_state.dart';

class RadioPlayer extends StatelessWidget {
  const RadioPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = getIt<RadioPlayerCubit>();
    final speakerScreenHeight = MediaQuery.of(context).size.height * 0.5;

    return BlocBuilder<RadioPlayerCubit, RadioPlayerState>(
      bloc: cubit,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(CustomSize.xl),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Speaker(size: speakerScreenHeight),
                  const SizedBox(width: CustomSize.m),
                  SizedBox(
                    height: speakerScreenHeight,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Screen(
                      isOn: state.isOn && !state.isLoading,
                      isLoading: state.isLoading,
                      currentFavStation: state.currentFavStation.when(
                        none: () => null,
                        some: (value) => value,
                      ),
                      favoriteStations: state.favoriteStations,
                      onStationFavIconPressed: cubit.toggleStationFavorite,
                      onFavStationIconPressed: cubit.unmarkStationAsFavorite,
                      onFavStationPressed: cubit.selectFavStation,
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
                    isPressed: state.isOn,
                    onPressed: cubit.turnOnOff,
                    icon: Icons.power_settings_new,
                    iconSize: CustomSize.xl,
                    shape: Shape.circle,
                  ),
                  PushButton(
                    isPressed: state.isPlaying,
                    onPressed: cubit.play,
                    icon: Icons.play_arrow,
                  ),
                  PushButton(
                    isPressed: state.isPaused,
                    onPressed: cubit.pause,
                    icon: Icons.pause,
                  ),
                  KnobButton(
                    key: ValueKey(state.tunerClock),
                    value: state.tunerValue.toDouble(),
                    minValue: state.tunerMinValue.toDouble(),
                    maxValue: state.tunerMaxValue.toDouble(),
                    label: S.of(context)!.tuner,
                    onChanged: (value) {
                      cubit.changeTuner(value.toInt());
                    },
                  ),
                  KnobButton(
                    value: state.volume,
                    minValue: state.volumeMinValue,
                    maxValue: state.volumeMaxValue,
                    label: S.of(context)!.volume,
                    onChanged: cubit.changeVolume,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portable_radio/presentation/view_model/radio_player_cubit.dart';
import 'package:portable_radio/presentation/view_model/radio_player_state.dart';

class MockedRadioPlayerCubit extends Mock implements RadioPlayerCubit {
  void mockState(RadioPlayerState expected) {
    when(() => state).thenReturn(expected);
  }

  void mockStream(Stream<RadioPlayerState> expected) {
    when(() => stream).thenReturn(expected);
  }

  void mockStreamWithInitialState(
    Stream<RadioPlayerState> expected,
    RadioPlayerState initialState,
  ) {
    whenListen(this, expected, initialState: initialState);
  }

  void mockChangeTuner() {
    when(() => changeTuner(any())).thenAnswer((_) => Future.value());
  }
}

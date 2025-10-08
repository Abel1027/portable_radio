import 'package:just_audio/just_audio.dart';
import 'package:mocktail/mocktail.dart';

class MockedAudioPlayer extends Mock implements AudioPlayer {
  void mockSetUrl() {
    when(() => setUrl(any())).thenAnswer((_) => Future.value());
  }

  void mockSetUrlError(Exception expected) {
    when(() => setUrl(any())).thenThrow(expected);
  }

  void mockStop() {
    when(() => stop()).thenAnswer((_) => Future.value());
  }

  void mockPlay() {
    when(() => play()).thenAnswer((_) => Future.value());
  }

  void mockPause() {
    when(() => pause()).thenAnswer((_) => Future.value());
  }

  void mockSetVolume() {
    when(() => setVolume(any())).thenAnswer((_) => Future.value());
  }
}

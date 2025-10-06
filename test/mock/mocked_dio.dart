import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';

class MockedDio extends Mock implements Dio {
  void mockGet(Response expected) {
    when(() => get(any())).thenAnswer((_) async => expected);
  }
}

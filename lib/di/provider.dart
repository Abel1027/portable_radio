import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:portable_radio/di/provider.config.dart';

GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async => await getIt.init();

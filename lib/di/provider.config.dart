// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:portable_radio/data/mapper/data_radio_station_mapper.dart'
    as _i803;
import 'package:portable_radio/data/repository/radio_station_repository.dart'
    as _i302;
import 'package:portable_radio/di/module/dio_injectable_module.dart' as _i894;
import 'package:portable_radio/domain/use_case/get_available_radio_stations_use_case.dart'
    as _i687;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioInjectableModule = _$DioInjectableModule();
    gh.lazySingleton<_i361.Dio>(() => dioInjectableModule.dio);
    gh.lazySingleton<_i302.RadioStationRepository>(
        () => _i302.RadioStationRepository(
              gh<_i361.Dio>(),
              gh<_i803.DataRadioStationMapper>(),
            ));
    gh.lazySingleton<_i687.GetAvailableRadioStationsUseCase>(() =>
        _i687.GetAvailableRadioStationsUseCase(
            gh<_i302.RadioStationRepository>()));
    return this;
  }
}

class _$DioInjectableModule extends _i894.DioInjectableModule {}

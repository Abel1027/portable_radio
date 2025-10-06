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
import 'package:hive_flutter/hive_flutter.dart' as _i986;
import 'package:injectable/injectable.dart' as _i526;
import 'package:portable_radio/data/mapper/data_radio_station_mapper.dart'
    as _i803;
import 'package:portable_radio/data/repository/local_radio_station_repository.dart'
    as _i329;
import 'package:portable_radio/data/repository/remote_radio_station_repository.dart'
    as _i534;
import 'package:portable_radio/di/module/dio_injectable_module.dart' as _i894;
import 'package:portable_radio/di/module/hive_injectable_module.dart' as _i521;
import 'package:portable_radio/domain/use_case/get_available_radio_stations_use_case.dart'
    as _i687;
import 'package:portable_radio/domain/use_case/get_favorite_radio_stations_use_case.dart'
    as _i537;
import 'package:portable_radio/domain/use_case/save_favorite_radio_stations_use_case.dart'
    as _i367;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioInjectableModule = _$DioInjectableModule();
    final hiveInjectableModule = _$HiveInjectableModule();
    gh.lazySingleton<_i361.Dio>(() => dioInjectableModule.dio);
    gh.lazySingleton<_i329.LocalRadioStationRepository>(
      () => _i329.LocalRadioStationRepository(),
    );
    gh.lazySingleton<_i803.DataRadioStationMapper>(
      () => _i803.DataRadioStationMapper(),
    );
    await gh.lazySingletonAsync<_i986.HiveInterface>(
      () => hiveInjectableModule.hive(),
      preResolve: true,
    );
    gh.lazySingleton<_i367.SaveFavoriteRadioStationsUseCase>(
      () => _i367.SaveFavoriteRadioStationsUseCase(
        gh<_i329.LocalRadioStationRepository>(),
      ),
    );
    gh.lazySingleton<_i537.GetFavoriteRadioStationsUseCase>(
      () => _i537.GetFavoriteRadioStationsUseCase(
        gh<_i329.LocalRadioStationRepository>(),
      ),
    );
    gh.lazySingleton<_i534.RemoteRadioStationRepository>(
      () => _i534.RemoteRadioStationRepository(
        gh<_i361.Dio>(),
        gh<_i803.DataRadioStationMapper>(),
      ),
    );
    gh.lazySingleton<_i687.GetAvailableRadioStationsUseCase>(
      () => _i687.GetAvailableRadioStationsUseCase(
        gh<_i534.RemoteRadioStationRepository>(),
      ),
    );
    return this;
  }
}

class _$DioInjectableModule extends _i894.DioInjectableModule {}

class _$HiveInjectableModule extends _i521.HiveInjectableModule {}

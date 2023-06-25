// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import 'core/data/base_local_data_source.dart' as _i6;
import 'core/data/base_remote_data_source.dart' as _i7;
import 'core/data/base_repository.dart' as _i8;
import 'core/network/network_info.dart' as _i4;
import 'injection.dart' as _i9;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.NetworkInfo>(() => _i4.NetworkInfoImpl());
  await gh.factoryAsync<_i5.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i6.BaseLocalDataSource>(() => _i6.BaseLocalDataSourceImp(
      sharedPreferences: gh<_i5.SharedPreferences>()));
  gh.lazySingleton<_i7.BaseRemoteDataSource>(
      () => _i7.BaseRemoteDataSourceImpl(dio: gh<_i3.Dio>()));
  gh.lazySingleton<_i8.BaseRepository>(() => _i8.BaseRepositoryImpl(
        baseLocalDataSource: gh<_i6.BaseLocalDataSource>(),
        networkInfo: gh<_i4.NetworkInfo>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i9.RegisterModule {}

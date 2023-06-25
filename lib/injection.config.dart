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
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import 'core/data/base_local_data_source.dart' as _i8;
import 'core/data/base_remote_data_source.dart' as _i9;
import 'core/data/base_repository.dart' as _i10;
import 'core/network/network_info.dart' as _i4;
import 'features/pokemons/data/data_sources/local/pokemons_local_data_source.dart'
    as _i11;
import 'features/pokemons/data/data_sources/local/pokemons_local_data_source_imp.dart'
    as _i12;
import 'features/pokemons/data/data_sources/remote/pokemons_remote_data_source.dart'
    as _i5;
import 'features/pokemons/data/data_sources/remote/pokemons_remote_data_source_imp.dart'
    as _i6;
import 'features/pokemons/data/repositories/pokemons_repository_imp.dart'
    as _i14;
import 'features/pokemons/domain/repositories/pokemons_repository.dart' as _i13;
import 'features/pokemons/domain/use_cases/get_pokemons_use_case.dart' as _i15;
import 'features/pokemons/presentation/bloc/pokemons_bloc.dart' as _i16;
import 'injection.dart' as _i17;

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
  gh.lazySingleton<_i5.PokemonsRemoteDataSource>(
      () => _i6.PokemonsRemoteDataSourceImp(dio: gh<_i3.Dio>()));
  await gh.factoryAsync<_i7.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i8.BaseLocalDataSource>(() => _i8.BaseLocalDataSourceImp(
      sharedPreferences: gh<_i7.SharedPreferences>()));
  gh.lazySingleton<_i9.BaseRemoteDataSource>(
      () => _i9.BaseRemoteDataSourceImpl(dio: gh<_i3.Dio>()));
  gh.lazySingleton<_i10.BaseRepository>(() => _i10.BaseRepositoryImpl(
        baseLocalDataSource: gh<_i8.BaseLocalDataSource>(),
        networkInfo: gh<_i4.NetworkInfo>(),
      ));
  gh.lazySingleton<_i11.PokemonsLocalDataSource>(() =>
      _i12.PokemonsLocalDataSourceImp(
          sharedPreferences: gh<_i7.SharedPreferences>()));
  gh.lazySingleton<_i13.PokemonsRepository>(() => _i14.PokemonsRepositoryImp(
        gh<_i11.PokemonsLocalDataSource>(),
        gh<_i5.PokemonsRemoteDataSource>(),
        baseLocalDataSource: gh<_i8.BaseLocalDataSource>(),
        networkInfo: gh<_i4.NetworkInfo>(),
      ));
  gh.lazySingleton<_i15.GetPokemonsUseCase>(
      () => _i15.GetPokemonsUseCase(gh<_i13.PokemonsRepository>()));
  gh.factory<_i16.PokemonsBloc>(
      () => _i16.PokemonsBloc(gh<_i15.GetPokemonsUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i17.RegisterModule {}

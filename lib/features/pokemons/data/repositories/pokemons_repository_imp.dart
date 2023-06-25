import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/repositories/pokemons_repository.dart';
import '../data_sources/local/pokemons_local_data_source.dart';
import '../data_sources/remote/pokemons_remote_data_source.dart';

@LazySingleton(as: PokemonsRepository)
class PokemonsRepositoryImp extends BaseRepositoryImpl
    implements PokemonsRepository {
  final PokemonsLocalDataSource _local;
  final PokemonsRemoteDataSource _remote;

  PokemonsRepositoryImp(
    this._local,
    this._remote, {
    required super.baseLocalDataSource,
    required super.networkInfo,
  });

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons() async =>
      await requestWithToken<List<Pokemon>>(
        (_) => _remote.getPokemons(),
      );
}

import 'package:injectable/injectable.dart';

import '../../../../../core/data/base_remote_data_source.dart';
import '../../../../../core/util/constants.dart';
import '../../models/pokemon_model.dart';
import 'pokemons_remote_data_source.dart';

@LazySingleton(as: PokemonsRemoteDataSource)
class PokemonsRemoteDataSourceImp extends BaseRemoteDataSourceImpl
    implements PokemonsRemoteDataSource {
  PokemonsRemoteDataSourceImp({required super.dio});

  @override
  Future<List<PokemonModel>> getPokemons() async =>
      await performGetListRequest<PokemonModel>(
        endpoint: Endpoints.pokemons,
      );
}

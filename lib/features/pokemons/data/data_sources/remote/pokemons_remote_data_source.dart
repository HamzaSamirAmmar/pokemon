import '../../../../../core/data/base_remote_data_source.dart';
import '../../models/pokemon_model.dart';

abstract class PokemonsRemoteDataSource extends BaseRemoteDataSource {
  Future<List<PokemonModel>> getPokemons();
}

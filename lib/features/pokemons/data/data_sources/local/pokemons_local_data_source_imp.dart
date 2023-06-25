import 'package:injectable/injectable.dart';

import '../../../../../core/data/base_local_data_source.dart';
import 'pokemons_local_data_source.dart';

@LazySingleton(as: PokemonsLocalDataSource)
class PokemonsLocalDataSourceImp extends BaseLocalDataSourceImp
    implements PokemonsLocalDataSource {
  PokemonsLocalDataSourceImp({required super.sharedPreferences});
}

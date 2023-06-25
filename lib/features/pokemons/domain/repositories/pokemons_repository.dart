import 'package:dartz/dartz.dart';

import '../../../../core/data/base_repository.dart';
import '../../../../core/error/failures.dart';
import '../entities/pokemon.dart';

abstract class PokemonsRepository extends BaseRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons();
}

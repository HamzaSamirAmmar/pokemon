import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/pokemon.dart';
import '../repositories/pokemons_repository.dart';

@lazySingleton
class GetPokemonsUseCase implements UseCase<List<Pokemon>, NoParams> {
  final PokemonsRepository _repository;

  GetPokemonsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Pokemon>>> call(
    NoParams params,
  ) async =>
      await _repository.getPokemons();
}

import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';

import '../../../../core/bloc/base_state_mixin.dart';
import '../../domain/entities/pokemon.dart';

part 'pokemons_state.g.dart';

abstract class PokemonsState
    with BaseState
    implements Built<PokemonsState, PokemonsStateBuilder> {
  PokemonsState._();

  BuiltList<Pokemon> get pokemons;

  factory PokemonsState([Function(PokemonsStateBuilder b) updates]) =
      _$PokemonsState;

  factory PokemonsState.initial() {
    return PokemonsState(
      (b) => b
        ..isLoading = false
        ..message = ''
        ..error = false
        ..pokemons.replace([]),
    );
  }

  factory PokemonsState.failure({
    required String message,
    required PokemonsState currentState,
  }) {
    return currentState.rebuild(
      (b) => b
        ..isLoading = false
        ..error = true
        ..message = message,
    );
  }

  factory PokemonsState.success({
    required String message,
    required PokemonsState currentState,
  }) {
    return currentState.rebuild(
      (b) => b
        ..isLoading = false
        ..error = false
        ..message = message,
    );
  }

  factory PokemonsState.clearMessage({
    required PokemonsState currentState,
  }) {
    return currentState.rebuild(
      (b) => b..message = '',
    );
  }
}

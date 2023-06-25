import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/use_cases/get_pokemons_use_case.dart';
import 'pokemons_event.dart';
import 'pokemons_state.dart';

@injectable
class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final GetPokemonsUseCase _getPokemonsUseCase;

  void clearMessage() {
    add(ClearMessage());
  }

  void addGetPokemonsEvent() {
    add(GetPokemonsEvent());
  }

  @factoryMethod
  PokemonsBloc(this._getPokemonsUseCase) : super(PokemonsState.initial()) {
    on<PokemonsEvent>(
      (event, emit) async {
        /*** ClearMessage ***/
        if (event is ClearMessage) {
          emit(PokemonsState.clearMessage(currentState: state));
        }

        /*** GetPokemonsEvent **/
        if (event is GetPokemonsEvent) {
          emit(state.rebuild((b) => b..isLoading = true));

          final result = await _getPokemonsUseCase(NoParams());

          result.fold(
            (failure) => emit(
              PokemonsState.failure(
                message: failure.error,
                currentState: state,
              ),
            ),
            (pokemons) => emit(
              state.rebuild(
                (b) => b
                  ..isLoading = false
                  ..pokemons.addAll(pokemons),
              ),
            ),
          );
        }
      },
    );
  }
}

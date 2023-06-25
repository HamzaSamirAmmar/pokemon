import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/widgets/loader.dart';
import '../../../../injection.dart';
import '../bloc/pokemons_bloc.dart';
import '../bloc/pokemons_state.dart';
import '../widgets/pokemon_card.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({super.key});

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  final _bloc = sl<PokemonsBloc>();

  @override
  void initState() {
    _bloc.addGetPokemonsEvent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonsBloc, PokemonsState>(
      bloc: _bloc,
      builder: (context, state) {
        message(
          context: context,
          message: state.message,
          isError: state.error,
          bloc: _bloc,
        );
        return Scaffold(
          appBar: AppBar(
            title: const Text("Pokemons"),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.pokemons.length,
                  itemBuilder: (_, index) => PokemonCard(
                    pokemon: state.pokemons[index],
                  ),
                ),
              ),
              if (state.isLoading) const Loader(),
            ],
          ),
        );
      },
    );
  }
}

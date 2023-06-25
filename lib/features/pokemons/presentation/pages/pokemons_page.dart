import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/core/util/constants.dart';
import 'package:pokemon/core/widgets/custom_cached_network_image.dart';
import 'package:pokemon/core/widgets/loader.dart';

import '../../../../injection.dart';
import '../bloc/pokemons_bloc.dart';
import '../bloc/pokemons_state.dart';

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
                  itemBuilder: (_, index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    child: Container(
                      height: 120.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(0.2),
                            blurRadius: 25,
                            offset: const Offset(10, 10),
                          )
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomCachedNetworkImage(
                            width: 150.w,
                            imageUrl: state.pokemons[index].imageUrl,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            child: Text(
                              state.pokemons[index].name,
                              style: TextStyle(
                                fontSize: 18.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
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

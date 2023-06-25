import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/pokemon.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel extends Pokemon {
  static const String className = "PokemonModel";

  const PokemonModel({
    required super.name,
    required super.url,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
}

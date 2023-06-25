library base_list_response_model;

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../features/pokemons/data/models/pokemon_model.dart';
import '../../error/exceptions.dart';

part 'base_list_response_model.g.dart';

@JsonSerializable()
class BaseListResponseModel<T> {
  final int? count;

  final String? next;

  @JsonKey(name: 'results')
  @_Converter()
  final List<T>? data;

  BaseListResponseModel({
    this.count,
    this.next,
    this.data,
  });

  factory BaseListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseListResponseModelFromJson<T>(json);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    debugPrint('t is ${T.toString()}');

    if (json is Map<String, dynamic>) {
      /*** PokemonModel ***/
      if (T.toString() == PokemonModel.className) {
        return PokemonModel.fromJson(json) as T;
      }
    }

    debugPrint('_dataFromJson: parse error (BaseListResponseModel)');
    throw ParseException();
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object!;
  }
}

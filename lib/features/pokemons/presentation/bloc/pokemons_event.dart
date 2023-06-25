import 'package:built_value/built_value.dart';

part 'pokemons_event.g.dart';

abstract class PokemonsEvent {}

abstract class ClearMessage extends PokemonsEvent
    implements Built<ClearMessage, ClearMessageBuilder> {
  ClearMessage._();

  factory ClearMessage([Function(ClearMessageBuilder b) updates]) =
      _$ClearMessage;

  factory ClearMessage.initial() {
    return ClearMessage((b) => b);
  }
}

abstract class GetPokemonsEvent extends PokemonsEvent
    implements Built<GetPokemonsEvent, GetPokemonsEventBuilder> {
  GetPokemonsEvent._();

  factory GetPokemonsEvent([Function(GetPokemonsEventBuilder b) updates]) =
      _$GetPokemonsEvent;

  factory GetPokemonsEvent.initial() {
    return GetPokemonsEvent((b) => b);
  }
}

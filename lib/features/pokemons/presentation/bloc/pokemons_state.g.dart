// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemons_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PokemonsState extends PokemonsState {
  @override
  final BuiltList<Pokemon> pokemons;
  @override
  final bool isLoading;
  @override
  final bool error;
  @override
  final String message;

  factory _$PokemonsState([void Function(PokemonsStateBuilder)? updates]) =>
      (new PokemonsStateBuilder()..update(updates))._build();

  _$PokemonsState._(
      {required this.pokemons,
      required this.isLoading,
      required this.error,
      required this.message})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        pokemons, r'PokemonsState', 'pokemons');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'PokemonsState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, r'PokemonsState', 'error');
    BuiltValueNullFieldError.checkNotNull(message, r'PokemonsState', 'message');
  }

  @override
  PokemonsState rebuild(void Function(PokemonsStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PokemonsStateBuilder toBuilder() => new PokemonsStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PokemonsState &&
        pokemons == other.pokemons &&
        isLoading == other.isLoading &&
        error == other.error &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, pokemons.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, error.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PokemonsState')
          ..add('pokemons', pokemons)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('message', message))
        .toString();
  }
}

class PokemonsStateBuilder
    implements Builder<PokemonsState, PokemonsStateBuilder> {
  _$PokemonsState? _$v;

  ListBuilder<Pokemon>? _pokemons;
  ListBuilder<Pokemon> get pokemons =>
      _$this._pokemons ??= new ListBuilder<Pokemon>();
  set pokemons(ListBuilder<Pokemon>? pokemons) => _$this._pokemons = pokemons;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _error;
  bool? get error => _$this._error;
  set error(bool? error) => _$this._error = error;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  PokemonsStateBuilder();

  PokemonsStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _pokemons = $v.pokemons.toBuilder();
      _isLoading = $v.isLoading;
      _error = $v.error;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PokemonsState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PokemonsState;
  }

  @override
  void update(void Function(PokemonsStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PokemonsState build() => _build();

  _$PokemonsState _build() {
    _$PokemonsState _$result;
    try {
      _$result = _$v ??
          new _$PokemonsState._(
              pokemons: pokemons.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'PokemonsState', 'isLoading'),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, r'PokemonsState', 'error'),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'PokemonsState', 'message'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemons';
        pokemons.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PokemonsState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

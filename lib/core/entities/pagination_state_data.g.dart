// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_state_data.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PaginationStateData<T> extends PaginationStateData<T> {
  @override
  final BuiltList<T> items;
  @override
  final bool isLoading;
  @override
  final bool isFinished;
  @override
  final int currentPage;
  @override
  final int total;

  factory _$PaginationStateData(
          [void Function(PaginationStateDataBuilder<T>)? updates]) =>
      (new PaginationStateDataBuilder<T>()..update(updates))._build();

  _$PaginationStateData._(
      {required this.items,
      required this.isLoading,
      required this.isFinished,
      required this.currentPage,
      required this.total})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        items, r'PaginationStateData', 'items');
    BuiltValueNullFieldError.checkNotNull(
        isLoading, r'PaginationStateData', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        isFinished, r'PaginationStateData', 'isFinished');
    BuiltValueNullFieldError.checkNotNull(
        currentPage, r'PaginationStateData', 'currentPage');
    BuiltValueNullFieldError.checkNotNull(
        total, r'PaginationStateData', 'total');
    if (T == dynamic) {
      throw new BuiltValueMissingGenericsError(r'PaginationStateData', 'T');
    }
  }

  @override
  PaginationStateData<T> rebuild(
          void Function(PaginationStateDataBuilder<T>) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PaginationStateDataBuilder<T> toBuilder() =>
      new PaginationStateDataBuilder<T>()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PaginationStateData &&
        items == other.items &&
        isLoading == other.isLoading &&
        isFinished == other.isFinished &&
        currentPage == other.currentPage &&
        total == other.total;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, items.hashCode);
    _$hash = $jc(_$hash, isLoading.hashCode);
    _$hash = $jc(_$hash, isFinished.hashCode);
    _$hash = $jc(_$hash, currentPage.hashCode);
    _$hash = $jc(_$hash, total.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PaginationStateData')
          ..add('items', items)
          ..add('isLoading', isLoading)
          ..add('isFinished', isFinished)
          ..add('currentPage', currentPage)
          ..add('total', total))
        .toString();
  }
}

class PaginationStateDataBuilder<T>
    implements Builder<PaginationStateData<T>, PaginationStateDataBuilder<T>> {
  _$PaginationStateData<T>? _$v;

  ListBuilder<T>? _items;
  ListBuilder<T> get items => _$this._items ??= new ListBuilder<T>();
  set items(ListBuilder<T>? items) => _$this._items = items;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  bool? _isFinished;
  bool? get isFinished => _$this._isFinished;
  set isFinished(bool? isFinished) => _$this._isFinished = isFinished;

  int? _currentPage;
  int? get currentPage => _$this._currentPage;
  set currentPage(int? currentPage) => _$this._currentPage = currentPage;

  int? _total;
  int? get total => _$this._total;
  set total(int? total) => _$this._total = total;

  PaginationStateDataBuilder();

  PaginationStateDataBuilder<T> get _$this {
    final $v = _$v;
    if ($v != null) {
      _items = $v.items.toBuilder();
      _isLoading = $v.isLoading;
      _isFinished = $v.isFinished;
      _currentPage = $v.currentPage;
      _total = $v.total;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PaginationStateData<T> other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PaginationStateData<T>;
  }

  @override
  void update(void Function(PaginationStateDataBuilder<T>)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PaginationStateData<T> build() => _build();

  _$PaginationStateData<T> _build() {
    _$PaginationStateData<T> _$result;
    try {
      _$result = _$v ??
          new _$PaginationStateData<T>._(
              items: items.build(),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, r'PaginationStateData', 'isLoading'),
              isFinished: BuiltValueNullFieldError.checkNotNull(
                  isFinished, r'PaginationStateData', 'isFinished'),
              currentPage: BuiltValueNullFieldError.checkNotNull(
                  currentPage, r'PaginationStateData', 'currentPage'),
              total: BuiltValueNullFieldError.checkNotNull(
                  total, r'PaginationStateData', 'total'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PaginationStateData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

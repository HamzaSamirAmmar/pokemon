import 'package:equatable/equatable.dart';

class PaginateList<T extends Equatable> extends Equatable {
  final List<T> data;
  final int count;
  final int page;

  const PaginateList({
    required this.data,
    required this.page,
    required this.count,
  }) : super();

  void addChild(T entity) {
    data.add(entity);
  }

  void addAll(PaginateList<T> entities) {
    data.addAll(entities.data);
  }

  void replace(List<T> entities) {
    data.replaceRange(0, data.length, entities);
  }

  @override
  List<Object?> get props => [data, page];
}

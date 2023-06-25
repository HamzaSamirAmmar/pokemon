import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class PaginationParams extends Equatable {
  final int page;
  final int perPage;
  final String searchWord;

  const PaginationParams({
    required this.page,
    this.perPage = 8,
    this.searchWord = "",
  });

  @override
  List<Object?> get props => [page, perPage];
}

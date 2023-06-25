import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import "../network/network_info.dart";
import '../error/exceptions.dart';
import '../error/failures.dart';
import 'base_local_data_source.dart';

typedef FutureEitherOr<T> = Future<Either<Failure, T>> Function();

typedef RequestBody<T> = Future<T> Function(String token);

typedef LocalRequestBody<T> = Future<T> Function();

abstract class BaseRepository {
  Either<Failure, String> getToken();

  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body);

  Future<Either<Failure, T>> localRequest<T>(
    LocalRequestBody<T> body,
  );

  Future<Either<Failure, T>> requestWithToken<T>(
    RequestBody<T> body,
  );
}

@LazySingleton(as: BaseRepository)
class BaseRepositoryImpl implements BaseRepository {
  final BaseLocalDataSource baseLocalDataSource;
  final NetworkInfo networkInfo;

  BaseRepositoryImpl({
    required this.baseLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, T>> requestWithToken<T>(
    RequestBody<T> body,
  ) async {
    debugPrint('Request with token\n');
    return await checkNetwork<T>(
      () async {
        /// 1: Get the token

        final token = getToken();

        return await token.fold(
          (failure) {
            debugPrint('BaseRepository: Getting Token fail\n');

            return const Left(
              CacheFailure(error: 'Cannot get token'),
            );
          },
          (token) async {
            try {
              final T t = await body(token);
              return Right(t);
            } on NotFoundException catch (e) {
              return Left(NotFoundFailure(error: e.error));
            } on HandledException catch (e) {
              return Left(
                ServerFailure(error: e.error),
              );
            }
          },
        );
      },
    );
  }

  @override
  Future<Either<Failure, T>> localRequest<T>(LocalRequestBody<T> body) async {
    debugPrint('BaseRequest\n');

    ///  perform the request
    try {
      final T t = await body();
      return Right(t);
    } on HandledException catch (e) {
      return Left(
        CacheFailure(error: e.error),
      );
    }
  }

  @override
  Future<Either<Failure, T>> checkNetwork<T>(FutureEitherOr<T> body) async {
    if (await networkInfo.isConnected) {
      return body();
    } else {
      return const Left(ServerFailure(error: "No Internet Connection"));
    }
  }

  @override
  Either<Failure, String> getToken() {
    try {
      final token = baseLocalDataSource.token;

      debugPrint('Token is "$token"\n');

      return Right(token);
    } catch (e) {
      debugPrint('BaseRepository: Getting Token fail\n');

      return const Left(CacheFailure());
    }
  }
}

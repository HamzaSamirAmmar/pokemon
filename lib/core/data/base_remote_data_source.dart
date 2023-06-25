import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../error/exceptions.dart';
import '../error/status_code_handler.dart';
import '../network/models/base_list_response_model.dart';
import '../network/models/base_response_model.dart';
import '../util/constants.dart';

abstract class BaseRemoteDataSource {
  @protected
  Future<T> performPostRequest<T>({
    required String endpoint,
    dynamic data,
    String? token,
    Map<String, dynamic>? queryParameters,
  });

  @protected
  Future<T> performPutRequest<T>({
    required String endpoint,
    dynamic data,
    String? token,
    Map<String, dynamic>? queryParameters,
  });

  @protected
  Future<T> performDeleteRequest<T>({
    required String endpoint,
    dynamic data,
    String? token,
    Map<String, dynamic>? queryParameters,
  });

  @protected
  Future<T> performGetRequest<T>({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  });

  @protected
  Future<List<T>> performGetListRequest<T extends Equatable>({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  });
}

@LazySingleton(as: BaseRemoteDataSource)
class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio dio;

  BaseRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<T> performPostRequest<T>({
    required String endpoint,
    dynamic data,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    debugPrint("token is $token \n");
    debugPrint("performPostRequest\nSending request...\n");

    /// Sending the request
    return _handleRequest<T>(
      request: dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: GetOptions.getOptionsWithToken(token: token),
      ),
    );
  }

  @override
  Future<T> performPutRequest<T>({
    required String endpoint,
    dynamic data,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    debugPrint("token is $token \n");
    debugPrint("performPutRequest\nSending request...\n");

    /// Sending the request
    return _handleRequest<T>(
      request: dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: GetOptions.getOptionsWithToken(token: token),
      ),
    );
  }

  @override
  Future<T> performDeleteRequest<T>({
    required String endpoint,
    dynamic data,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    debugPrint("token is $token \n");
    debugPrint("performDeleteRequest\nSending request...\n");

    /// Sending the request
    return _handleRequest<T>(
      request: dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: GetOptions.getOptionsWithToken(token: token),
      ),
    );
  }

  @override
  Future<T> performGetRequest<T>({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParameters,
  }) async {
    debugPrint("token is $token \n");
    debugPrint("performGetRequest\nSending request...\n");

    /// Sending the request
    return _handleRequest<T>(
      request: dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: GetOptions.getOptionsWithToken(token: token),
      ),
    );
  }

  @override
  Future<List<T>> performGetListRequest<T extends Equatable>({
    required String endpoint,
    String? token,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    debugPrint("token is $token \n");
    debugPrint("performGetListRequest\nSending request...\n");

    /// Sending the request
    debugPrint("Sending request...\n");

    return _handleListRequest<T>(
      request: dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: GetOptions.getOptionsWithToken(token: token),
      ),
    );
  }

  Future<T> _handleRequest<T>({
    required Future<Response> request,
  }) async {
    try {
      final response = await request;

      /// 1. decode the response and get a base response model (status, message and data)
      debugPrint("Decoding response...\n");
      final result = BaseResponseModel<T>.fromJson(
        json.decode(response.data),
      );

      /// 2. switch result
      debugPrint("Switching result\n");

      /// 2.1: result is true
      if (result.status == "success") {
        debugPrint("Result is true\n");
        if (result.data == null) {
          if (T.toString() == "void") {
            return result.data as T;
          } else {
            throw NullDataException();
          }
        }

        return result.data as T;
      }

      /// 3.2: result is false
      else if (response.statusCode == 404) {
        throw NotFoundException(error: result.message ?? ErrorMessage.error404);
      }

      /// 3.3: result is false

      else {
        debugPrint("Result is false\n");
        throw ServerException(
          error: result.message ?? ErrorMessage.somethingWentWrong,
        );
      }
    }

    /// if request failed the dio will throw dio error
    on DioException catch (e) {
      debugPrint("Dio Error :(\n");

      /// if response is not null get the message from i
      if (e.response != null) {
        debugPrint("Dio error and the response is not null\n");
        throw statusCodeHandler(e.response!);
      }

      /// else throw a server exception
      else {
        debugPrint("Dio error and the response is null\n");
        throw ServerException(error: ErrorMessage.somethingWentWrong);
      }
    }

    /// if dio error not throw dio exception and request is fail
    catch (e) {
      /// if there is a handled exception rethrow it
      if (e is HandledException) {
        rethrow;
      } else if (e is NotFoundException) {
        debugPrint(
          "\n*** Data not found ***\n",
        );
        rethrow;
      }

      /// if error is parse error threw from base response model or form base list response model
      else if (e is ParseException) {
        debugPrint(
          "\n*** Failed to parse the model please check the base or base list response model ***\n",
        );
        throw HandledException(
          error: "Parse Error! (check the base or base list response model)",
        );
      }

      /// else rethrow a server exception
      else {
        debugPrint("Request fail and and error message is unknown\n");
        throw ServerException(error: ErrorMessage.somethingWentWrong);
      }
    }
  }

  Future<List<T>> _handleListRequest<T extends Equatable>({
    required Future<Response> request,
  }) async {
    try {
      final response = await request;

      /// 1. decode the response and get a base response model (status, message and data)
      debugPrint("Decoding response...\n");
      final result = BaseListResponseModel<T>.fromJson(
        json.decode(response.data),
      );

      /// 2. switch result
      debugPrint("Switching result\n");

      /// 2.1: result is true
      if (result.status == 'success') {
        debugPrint("Result is true\n");
        return result.data!;
      }

      /// 2.2: result is false
      else {
        debugPrint("Result is false\n");
        throw ServerException(
          error: result.message ?? ErrorMessage.somethingWentWrong,
        );
      }
    }

    /// if request failed the dio will throw dio error
    on DioException catch (e) {
      debugPrint("Dio Error :(\n");

      /// if response is not null get the message from i
      if (e.response != null) {
        debugPrint("Dio error and the response is not null\n");
        throw statusCodeHandler(e.response!);
      }

      /// else throw a server exception
      else {
        debugPrint("Dio error and the response is null\n");
        throw ServerException(error: ErrorMessage.somethingWentWrong);
      }
    }

    /// if dio error not throw dio exception and request is fail
    catch (e) {
      /// if there is a handled exception rethrow it
      if (e is HandledException) {
        rethrow;
      }

      /// if error is parse error threw from base response model or form base list response model
      else if (e is ParseException) {
        debugPrint(
          "\n*** Failed to parse the model please check the base or base list response model ***\n",
        );
        throw HandledException(
          error: "Parse Error! (check the base or base list response model)",
        );
      }

      /// else rethrow a server exception
      else {
        debugPrint("Request fail and and error message is unknown\n");
        throw ServerException(error: ErrorMessage.somethingWentWrong);
      }
    }
  }
}

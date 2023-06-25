import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../network/models/base_response_model.dart';
import '../util/constants.dart';
import 'exceptions.dart';

Exception statusCodeHandler(Response response) {
  try {
    /// Get the message
    final dynamic errorMessage = BaseResponseModel<void>.fromJson(
      json.decode(
        response.data,
      ),
    ).message;

    /// StatusCode: 400
    if (response.statusCode == 400) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing BadRequestException\n');

      return BadRequestException(
        error: errorMessage ?? ErrorMessage.error400,
      );
    }

    /// StatusCode: 401
    else if (response.statusCode == 401) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing UnauthorizedException\n');

      return UnauthorizedException(
        error: errorMessage ?? ErrorMessage.error401,
      );
    }

    /// StatusCode: 403
    else if (response.statusCode == 403) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing ForbiddenException\n');

      return ForbiddenException(
        error: errorMessage ?? ErrorMessage.error403,
      );
    }

    /// StatusCode: 404
    else if (response.statusCode == 404) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing NotFoundException\n');

      return NotFoundException(
        error: errorMessage ?? ErrorMessage.error404,
      );
    }

    /// StatusCode: 422
    else if (response.statusCode == 422) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing UnprocessableEntityException\n');

      return UnprocessableEntityException(
        error: errorMessage ?? ErrorMessage.error422,
      );
    }

    /// StatusCode: 500
    else if (response.statusCode == 500) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing InternalServerErrorException\n');

      return InternalServerErrorException(
        error: errorMessage ?? ErrorMessage.error500,
      );
    }

    /// StatusCode: 503
    else if (response.statusCode == 503) {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing ServiceUnavailableException\n');

      return ServiceUnavailableException(
        error: errorMessage ?? ErrorMessage.error503,
      );
    }

    /// StatusCode: unknown
    else {
      debugPrint('StatusCodeHandler: the code is ${response.statusCode}\n');
      debugPrint('StatusCodeHandler: throwing ServerException\n');

      return ServerException(
        error: errorMessage ?? ErrorMessage.somethingWentWrong,
      );
    }
  } catch (e) {
    debugPrint("Failed to get the message form the response because $e\n");
    return ServerException(error: ErrorMessage.somethingWentWrong);
  }
}

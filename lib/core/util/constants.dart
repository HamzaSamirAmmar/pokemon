import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../usecases/usecase.dart';

class Endpoints {
  static const String baseUrl = "http://192.168.43.231:8000/api";

  static const String login = "/auth/login";
}

class LocalStorageKeys {
  static const apiToken = 'api_token';
}

class IconsAssets {
  static const String flutterLogo = "assets/icons/flutter_logo.svg";
}

class ImagesAssets {}

class QueryParams {
  static Map<String, dynamic> paginationParams({
    required PaginationParams params,
  }) {
    return {
      "page": params.page,
      "per_page": params.perPage,
    };
  }
}

class RequestBody {
  /// ** Login ** ///
  static FormData login({
    required String number,
    required String password,
  }) {
    return FormData.fromMap({
      "phone": number,
      "password": password,
    });
  }
}

class GetOptions {
  static Options options = Options();

  static Options getOptionsWithToken({
    String? token,
  }) {
    if (token != null && token.isNotEmpty) {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      options.headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };
    }
    return options;
  }
}

class ErrorMessage {
  static const String somethingWentWrong = "Something went wrong";
  static String error400 = "The request that was sent is invalid";
  static String error401 = "Failed to authenticate with the server";
  static String error403 =
      "You do not have permission to access the requested resource";
  static String error404 = "The requested url was not found on the server";
  static String error422 = "The entered data is incorrect";
  static String error500 = "A generic error occurred on the server";
  static String error503 = "The requested service is not available";
}

void message({
  required BuildContext context,
  required String message,
  required bool isError,
  required bloc,
}) {
  // For debug only
  debugPrint('Message is "$message"');
  debugPrint(bloc.state.toString());
  // ************* //

  if (message.isNotEmpty) {
    if (isError) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.withOpacity(1.0),
        textColor: Colors.white,
        fontSize: 16.0.sp,
      );
    }

    /// if isn't error, display message with different background color
    else {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        textColor: Colors.white,
        fontSize: 16.0.sp,
      );
    }

    /// set message to '' (empty), for avoid print it again when state is changed
    /// or change the value of 'statusChanged' to false
    bloc.clearMessage();
  }
}

String get testText =>
    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et';

import 'package:injectable/injectable.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl();

  /**  **/
  @override
  Future<bool> get isConnected async {
    return true;
    // return kIsWeb || (await connectionChecker.hasConnection);
  }
}

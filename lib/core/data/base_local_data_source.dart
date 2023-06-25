import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../util/constants.dart';

abstract class BaseLocalDataSource {
  String get token;

  Future<void> setToken(String token);

  Future<void> logout();
}

@LazySingleton(as: BaseLocalDataSource)
class BaseLocalDataSourceImp implements BaseLocalDataSource {
  final SharedPreferences sharedPreferences;

  BaseLocalDataSourceImp({
    required this.sharedPreferences,
  });

  @override
  String get token =>
      sharedPreferences.getString(LocalStorageKeys.apiToken) ?? "";

  @override
  Future<void> logout() async {
    await sharedPreferences.clear();
  }

  @override
  Future<void> setToken(String token) async {
    await sharedPreferences.setString(LocalStorageKeys.apiToken, token);
  }
}

import 'package:fake_currency/core/networking/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences _sharedPreferences;
  AuthLocalDataSourceImpl(this._sharedPreferences);
  @override
  Future<void> saveToken(String token) async {
    try {
      await _sharedPreferences.setString('token', token);
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      await _sharedPreferences.clear();
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }
}

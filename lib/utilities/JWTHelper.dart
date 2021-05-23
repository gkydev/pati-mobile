import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JWTHelper{

  static String tokenKey = "JWT";

  static Future<String> getToken() async {
    return (await FlutterSecureStorage().read(key: tokenKey));
  }

    static setToken(String token) async {
    await FlutterSecureStorage().write(key: tokenKey, value: token);
  }
}
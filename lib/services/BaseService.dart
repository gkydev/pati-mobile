import 'package:pati_mobile/utilities/JWTHelper.dart';

class BaseService {
  final String baseApiUrl = "patiapp.herokuapp.com";

  bool isSuccessStatusCode(int statusCode) {
    return statusCode == 200;
  }

  dynamic getDefaultHeadersWithJwtToken() async {
    var token = await JWTHelper.getToken();

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}

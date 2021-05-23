import 'dart:convert';

import 'package:pati_mobile/models/UserLoginDto.dart';
import 'package:pati_mobile/results/ErrorResult.dart';
import 'package:pati_mobile/results/Result.dart';
import 'package:pati_mobile/results/SuccessResult.dart';
import 'package:pati_mobile/services/BaseService.dart';
import 'package:http/http.dart' as http;
import 'package:pati_mobile/utilities/Auth.dart';
import 'package:pati_mobile/utilities/JWTHelper.dart';

class UserService extends BaseService {
  Future<Result> loginAsync(UserLoginDto loginDto) async {
    try {
      var url = Uri.http(baseApiUrl, "/api/auth/login");

      var response = await http.post(url,
          headers: await getDefaultHeadersWithJwtToken(),
          body: jsonEncode(loginDto.toJson()));

      if (isSuccessStatusCode(response.statusCode)) {
        await JWTHelper.setToken(response.body);
        Auth().isAuthenticated = true;
        return SuccessResult("");
      } else {
        return ErrorResult(response.body);
      }
    } catch (e) {
      return new ErrorResult(e.toString());
    }
  }
}

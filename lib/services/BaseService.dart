class BaseService {
  final String baseApiUrl = "patiapp.herokuapp.com";

  bool isSuccessStatusCode(int statusCode) {
    return statusCode == 200;
  }
}

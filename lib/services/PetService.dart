import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pati_mobile/models/PetDto.dart';

class PetService {

  final String baseUrl = "patiapp.herokuapp.com";

  PetService();

  Future<String> listAsync({int currentPage = 1}) async {

    var queryParameters = {
      "p": currentPage.toString(),
  };

      var url = Uri.http(baseUrl,"/api/pet/getPets" ,queryParameters);
    var response =
        await http.get(url);
    
    print(response.body);

    List<PetDto> list  = (jsonDecode(response.body) as List).map((i) =>
              PetDto.fromJson(i)).toList();
    return response.body;
  }
}

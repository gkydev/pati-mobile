import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pati_mobile/models/PetDto.dart';
import 'package:pati_mobile/models/StaticVars.dart';
import 'package:pati_mobile/results/DataResult.dart';
import 'package:pati_mobile/results/ErrorDataResult.dart';
import 'package:pati_mobile/results/SuccessDataResult.dart';
import 'package:pati_mobile/services/BaseService.dart';

class PetService extends BaseService {
  PetService();

  Future<DataResult<List<PetDto>>> listAsync({int currentPage = 1, bool getImages=true}) async {
    try {
      var queryParameters = {
        "p": currentPage.toString(),
      };

      var url = Uri.http(baseApiUrl, "/api/pet/getPets", queryParameters);
      var response = await http.get(url);

      if (isSuccessStatusCode(response.statusCode)) {
        List<PetDto> list = (jsonDecode(response.body) as List)
            .map((i) => PetDto.fromJson(i))
            .toList();

        if(getImages){
           await Future.forEach(list, (element) async {
              element.images = await getPetImages(element.petId);
            });
        }

        return new SuccessDataResult(list);
      }

      return new ErrorDataResult(response.body);
    } catch (e) {
      return new ErrorDataResult(e);
    }
  }

  Future<DataResult<PetDto>> getById(int id) async {
    try {
      var queryParameters = {"id": id.toString()};

      var url = Uri.http(baseApiUrl, "/api/pet/", queryParameters);
      var response = await http.get(url);

      if (isSuccessStatusCode(response.statusCode)) {
        PetDto data = PetDto.fromJson(jsonDecode(response.body));
        
        data.images = await getPetImages(id);
        return new SuccessDataResult(data);
      }

      return new ErrorDataResult(response.body);
    } catch (e) {
      return new ErrorDataResult(e.toString());
    }
  }

  Future<List<String>> getPetImages(int petId) async {
    var queryParameters = {"id": petId.toString()};

    var url = Uri.http(baseApiUrl, "/api/pet/photo", queryParameters);
    var response = await http.get(url);
    if (isSuccessStatusCode(response.statusCode)) {
      
      List<String> imageList = [];

      json
          .decode(response.body)
          .forEach((item) => imageList.add(StaticVars.baseImageAddress +  item['PictureUrl']));

      return imageList;
    } else {
      return new List.empty();
    }
  }
}

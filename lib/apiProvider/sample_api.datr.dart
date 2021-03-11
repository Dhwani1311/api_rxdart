import 'dart:convert';

import 'package:flutter_state/model/sample_model.dart';
import 'package:http/http.dart' as http;

class SampleAPI {
  Future<APIResponseModel> getDataFromAPI() async {
    final reponse =
        await http.get('https://jsonplaceholder.typicode.com/posts');
    if (reponse.statusCode == 200) {
      final data = jsonDecode(reponse.body);
      return APIResponseModel(
          statusCode: reponse.statusCode,
          message: 'Data Found',
          response: SampleModel.fromJSon(data));
    } else {
      return APIResponseModel(
          response: [],
          message: 'No Data Found',
          statusCode: reponse.statusCode);
    }
  }
}

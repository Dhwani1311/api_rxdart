import 'package:flutter_state/apiProvider/sample_api.datr.dart';
import 'package:flutter_state/model/sample_model.dart';

class Repository {
  final sampleAPI = SampleAPI();

  Future<APIResponseModel> getDataFromAPI() => sampleAPI.getDataFromAPI();
}

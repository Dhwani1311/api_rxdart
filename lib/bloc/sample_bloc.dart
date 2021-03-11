import 'package:flutter_state/apiProvider/repository.dart';
import 'package:flutter_state/model/sample_model.dart';
import 'package:rxdart/rxdart.dart';

class SampleBloc {
  final _repository = Repository();
  final _dataFromAPI = BehaviorSubject<APIResponseModel>();

  Observable<APIResponseModel> get dataFromAPIStream => _dataFromAPI.stream;

  Future<void> getData() async {
    final apiData = await _repository.getDataFromAPI();
    _dataFromAPI.sink.add(apiData);
  }

  disponse() {
    _dataFromAPI.close();
  }
}

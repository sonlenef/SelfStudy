import 'package:flutter_base_architecture/data/repository/remote/api/services/gpt_service.dart';
import 'package:injectable/injectable.dart';

import '../../model/define.dart';

@LazySingleton()
class RemoteDataSource {
  final GPTService _gptService;

  RemoteDataSource(this._gptService);

  Future<List<ChoiceData>> gptRequest(String content) async {
    final response = await _gptService.gptRequest(content);
    return response.choices;
  }
}

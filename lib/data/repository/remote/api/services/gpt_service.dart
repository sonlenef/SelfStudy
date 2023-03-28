import 'package:flutter_base_architecture/data/model/define.dart';
import 'package:flutter_base_architecture/data/repository/remote/api/define.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GPTService extends BaseApiService {
  Future<GPTResponse> gptRequest(String content) async {
    return GPTResponse.fromJson(request(
      method: Method.post,
      path: '/v1/chat/completions',
      body: {
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": content}
        ],
        "temperature": 0.7
      },
      hasTokenAuthentication: true,
    ) as Map<String, dynamic>);
  }
}

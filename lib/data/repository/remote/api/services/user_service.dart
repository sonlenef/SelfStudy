import 'package:injectable/injectable.dart';

import '../../../../model/define.dart';
import '../define.dart';

@LazySingleton()
class UserService extends BaseApiService {
  Future<BaseResponse<LoginResponse>> login(String username, String password) async {
    return request(
      method: Method.post,
      path: 'auth/app/login',
      body: {
        'tendn': username,
        'matkhau': password,
      },
      hasTokenAuthentication: false,
      decoder: LoginResponse.fromJson,
    );
  }
}

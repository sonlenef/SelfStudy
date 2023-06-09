import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../model/define.dart';
import '../base_api_service.dart';

@LazySingleton()
class RefreshTokenService extends BaseApiService {
  Future<BaseResponse<RefreshTokenResponse>> refreshToken() async {
    return request(
      method: Method.post,
      path: 'v1/refresh_tokens',
      contentType: Headers.formUrlEncodedContentType,
      body: {'refresh_token': refreshToken, 'grant_type': 'refresh_token'},
      hasTokenAuthentication: false,
      decoder: RefreshTokenResponse.fromJson,
    );
  }
}

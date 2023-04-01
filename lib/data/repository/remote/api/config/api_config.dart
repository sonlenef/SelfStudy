import '../../../../../config/define.dart';

class ApiConfig {
  const ApiConfig._();

  static const connectTimeout = 30000;
  static const receiveTimeout = 240000;
  static const sendTimeout = 30000;

  static const bearer = '';
  static const authorization = 'Authorization';
  static const basicAuthorizationName = 'admin';
  static const basicAuthorizationPassword = '123';
  static const apiKey = '';

  static String baseUrl() {
    return FlavorConfig.instance?.values.baseUrl ?? "";
  }
}

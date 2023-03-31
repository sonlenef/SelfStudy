import '../../../../../config/define.dart';

class ApiConfig {
  const ApiConfig._();

  static const connectTimeout = 30000;
  static const receiveTimeout = 240000;
  static const sendTimeout = 30000;

  static const bearer = 'Bearer';
  static const authorization = 'Authorization';
  static const basicAuthorizationName = 'admin';
  static const basicAuthorizationPassword = '123';
  static const apiKey = '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';

  static String baseUrl() {
    return FlavorConfig.instance?.values.baseUrl ?? "";
  }
}

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

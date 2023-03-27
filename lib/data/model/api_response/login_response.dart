import 'package:json_annotation/json_annotation.dart';

import '../define.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends DataModel {
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "token_type")
  final String tokenType;
  @JsonKey(name: "user")
  final UserData user;

  LoginResponse(this.accessToken, this.tokenType, this.user);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

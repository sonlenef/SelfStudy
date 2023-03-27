import 'package:json_annotation/json_annotation.dart';

import '../define.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable()
class RefreshTokenResponse extends DataModel {
  @JsonKey(name: "token")
  final String token;

  RefreshTokenResponse(this.token);

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}

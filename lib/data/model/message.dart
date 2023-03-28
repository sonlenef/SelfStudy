import 'package:json_annotation/json_annotation.dart';

import 'define.dart';

part 'message.g.dart';

@JsonSerializable()
class Message extends DataModel {
  @JsonKey(name: "role")
  final String role;
  @JsonKey(name: "content")
  final String content;

  Message(this.role, this.content);

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

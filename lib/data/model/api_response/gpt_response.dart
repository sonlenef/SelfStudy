import 'package:json_annotation/json_annotation.dart';

import '../define.dart';

part 'gpt_response.g.dart';

@JsonSerializable()
class GPTResponse extends DataModel {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "object")
  final String object;
  @JsonKey(name: "created")
  final double created;
  @JsonKey(name: "model")
  final String model;
  @JsonKey(name: "choices")
  final List<ChoiceData> choices;

  GPTResponse(this.id, this.object, this.created, this.model, this.choices);

  factory GPTResponse.fromJson(Map<String, dynamic> json) =>
      _$GPTResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GPTResponseToJson(this);
}

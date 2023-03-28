import 'package:json_annotation/json_annotation.dart';

import 'define.dart';

part 'choice_data.g.dart';

@JsonSerializable()
class ChoiceData extends DataModel {
  @JsonKey(name: "message")
  final Message message;
  @JsonKey(name: "finish_reason")
  final String finishReason;
  @JsonKey(name: "index")
  final int index;

  ChoiceData(this.message, this.finishReason, this.index);

  factory ChoiceData.fromJson(Map<String, dynamic> json) =>
      _$ChoiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$ChoiceDataToJson(this);
}

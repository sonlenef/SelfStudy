// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChoiceData _$ChoiceDataFromJson(Map<String, dynamic> json) => ChoiceData(
      Message.fromJson(json['message'] as Map<String, dynamic>),
      json['finish_reason'] as String,
      json['index'] as int,
    );

Map<String, dynamic> _$ChoiceDataToJson(ChoiceData instance) =>
    <String, dynamic>{
      'message': instance.message,
      'finish_reason': instance.finishReason,
      'index': instance.index,
    };

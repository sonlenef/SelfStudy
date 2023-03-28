// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gpt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GPTResponse _$GPTResponseFromJson(Map<String, dynamic> json) => GPTResponse(
      json['id'] as String,
      json['object'] as String,
      (json['created'] as num).toDouble(),
      json['model'] as String,
      (json['choices'] as List<dynamic>)
          .map((e) => ChoiceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GPTResponseToJson(GPTResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'choices': instance.choices,
    };

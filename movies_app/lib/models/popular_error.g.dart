// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularError _$PopularErrorFromJson(Map<String, dynamic> json) {
  return PopularError(
    statusMessage: json['status_message'] as String,
    statusCode: json['status_code'] as int,
  );
}

Map<String, dynamic> _$PopularErrorToJson(PopularError instance) =>
    <String, dynamic>{
      'status_message': instance.statusMessage,
      'status_code': instance.statusCode,
    };

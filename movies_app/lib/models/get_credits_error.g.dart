// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_credits_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCreditsError _$GetCreditsErrorFromJson(Map<String, dynamic> json) {
  return GetCreditsError(
    statusMessage: json['status_message'] as String,
    statusCode: json['status_code'] as int,
  );
}

Map<String, dynamic> _$GetCreditsErrorToJson(GetCreditsError instance) =>
    <String, dynamic>{
      'status_message': instance.statusMessage,
      'status_code': instance.statusCode,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_details_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDetailsError _$GetDetailsErrorFromJson(Map<String, dynamic> json) {
  return GetDetailsError(
    statusMessage: json['status_message'] as String,
    statusCode: json['status_code'] as int,
  );
}

Map<String, dynamic> _$GetDetailsErrorToJson(GetDetailsError instance) =>
    <String, dynamic>{
      'status_message': instance.statusMessage,
      'status_code': instance.statusCode,
    };

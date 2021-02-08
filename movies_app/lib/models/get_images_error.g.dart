// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_images_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetImagesError _$GetImagesErrorFromJson(Map<String, dynamic> json) {
  return GetImagesError(
    statusMessage: json['status_message'] as String,
    statusCode: json['status_code'] as int,
  );
}

Map<String, dynamic> _$GetImagesErrorToJson(GetImagesError instance) =>
    <String, dynamic>{
      'status_message': instance.statusMessage,
      'status_code': instance.statusCode,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetImagesResponse _$GetImagesResponseFromJson(Map<String, dynamic> json) {
  return GetImagesResponse(
    id: json['id'] as int,
    backdrops: (json['backdrops'] as List)
        ?.map((e) =>
            e == null ? null : BackDrop.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    posters: (json['posters'] as List)
        ?.map((e) =>
            e == null ? null : Poster.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetImagesResponseToJson(GetImagesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'backdrops': instance.backdrops,
      'posters': instance.posters,
    };

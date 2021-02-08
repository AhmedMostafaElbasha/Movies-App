// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poster.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poster _$PosterFromJson(Map<String, dynamic> json) {
  return Poster(
    aspectRatio: json['aspect_ratio'] as num,
    filePath: json['file_path'] as String,
    height: json['height'] as int,
    iso6391: json['iso_639_1'] as String,
    voteAverage: json['vote_average'] as int,
    voteCount: json['vote_count'] as int,
    width: json['width'] as int,
  );
}

Map<String, dynamic> _$PosterToJson(Poster instance) => <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'file_path': instance.filePath,
      'height': instance.height,
      'iso_639_1': instance.iso6391,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'width': instance.width,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlayingError _$NowPlayingErrorFromJson(Map<String, dynamic> json) {
  return NowPlayingError(
    statusMessage: json['status_message'] as String,
    statusCode: json['status_code'] as int,
  );
}

Map<String, dynamic> _$NowPlayingErrorToJson(NowPlayingError instance) =>
    <String, dynamic>{
      'status_message': instance.statusMessage,
      'status_code': instance.statusCode,
    };

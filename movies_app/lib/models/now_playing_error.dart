import 'package:json_annotation/json_annotation.dart';

part 'now_playing_error.g.dart';

@JsonSerializable()
class NowPlayingError {
  @JsonKey(name: 'status_message')
  String statusMessage;
  @JsonKey(name: 'status_code')
  int statusCode;

  NowPlayingError({
    this.statusMessage,
    this.statusCode,
  });

  factory NowPlayingError.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingErrorFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingErrorToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'poster.g.dart';

@JsonSerializable()
class Poster {
  @JsonKey(name: 'aspect_ratio')
  final num aspectRatio;
  @JsonKey(name: 'file_path')
  final String filePath;
  final int height;
  @JsonKey(name: 'iso_639_1')
  final String iso6391;
  @JsonKey(name: 'vote_average')
  final int voteAverage;
  @JsonKey(name: 'vote_count')
  final int voteCount;
  final int width;

  Poster({
    this.aspectRatio,
    this.filePath,
    this.height,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory Poster.fromJson(Map<String, dynamic> json) => _$PosterFromJson(json);
  Map<String, dynamic> toJson() => _$PosterToJson(this);
}

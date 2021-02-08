import 'package:json_annotation/json_annotation.dart';

part 'backdrop.g.dart';

@JsonSerializable()
class BackDrop {
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

  BackDrop({
    this.aspectRatio,
    this.filePath,
    this.height,
    this.iso6391,
    this.voteAverage,
    this.voteCount,
    this.width,
  });

  factory BackDrop.fromJson(Map<String, dynamic> json) =>
      _$BackDropFromJson(json);
  Map<String, dynamic> toJson() => _$BackDropToJson(this);
}

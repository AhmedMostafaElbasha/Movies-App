import 'package:json_annotation/json_annotation.dart';

part 'cast.g.dart';

@JsonSerializable()
class Cast {
  final bool adult;
  final int gender;
  final int id;
  @JsonKey(name: 'known_for_department')
  final String knownForDepartment;
  final String name;
  @JsonKey(name: 'original_name')
  final String originalName;
  final num popularity;
  @JsonKey(name: 'profile_path')
  final String profilePath;
  @JsonKey(name: 'cast_id')
  final int castId;
  final String character;
  @JsonKey(name: 'credit_id')
  final String creditId;
  final int order;

  Cast({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);
  Map<String, dynamic> toJson() => _$CastToJson(this);
}

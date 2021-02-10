import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
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
  @JsonKey(name: 'credit_id')
  final String creditId;
  final String department;
  final String job;

  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);
}

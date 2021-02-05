// Package Imports
import 'package:json_annotation/json_annotation.dart';

part 'popular_error.g.dart';

@JsonSerializable()
class PopularError {
  @JsonKey(name: 'status_message')
  String statusMessage;
  @JsonKey(name: 'status_code')
  int statusCode;

  PopularError({
    this.statusMessage,
    this.statusCode,
  });

  factory PopularError.fromJson(Map<String, dynamic> json) =>
      _$PopularErrorFromJson(json);

  Map<String, dynamic> toJson() => _$PopularErrorToJson(this);
}

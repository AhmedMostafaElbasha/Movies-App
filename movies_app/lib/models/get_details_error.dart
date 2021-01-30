import 'package:json_annotation/json_annotation.dart';

part 'get_details_error.g.dart';

@JsonSerializable()
class GetDetailsError {
  @JsonKey(name: 'status_message')
  String statusMessage;
  @JsonKey(name: 'status_code')
  int statusCode;

  GetDetailsError({
    this.statusMessage,
    this.statusCode,
  });

  factory GetDetailsError.fromJson(Map<String, dynamic> json) =>
      _$GetDetailsErrorFromJson(json);

  Map<String, dynamic> toJson() => _$GetDetailsErrorToJson(this);
}

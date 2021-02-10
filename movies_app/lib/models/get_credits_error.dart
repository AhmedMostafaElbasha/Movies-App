import 'package:json_annotation/json_annotation.dart';

part 'get_credits_error.g.dart';

@JsonSerializable()
class GetCreditsError {
  @JsonKey(name: 'status_message')
  final String statusMessage;
  @JsonKey(name: 'status_code')
  final int statusCode;

  GetCreditsError({
    this.statusMessage,
    this.statusCode,
  });

  factory GetCreditsError.fromJson(Map<String, dynamic> json) =>
      _$GetCreditsErrorFromJson(json);
  Map<String, dynamic> toJson() => _$GetCreditsErrorToJson(this);
}

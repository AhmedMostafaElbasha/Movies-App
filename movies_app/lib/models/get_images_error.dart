import 'package:json_annotation/json_annotation.dart';

part 'get_images_error.g.dart';

@JsonSerializable()
class GetImagesError {
  @JsonKey(name: 'status_message')
  final String statusMessage;
  @JsonKey(name: 'status_code')
  final int statusCode;

  GetImagesError({
    this.statusMessage,
    this.statusCode,
  });

  factory GetImagesError.fromJson(Map<String, dynamic> json) =>
      _$GetImagesErrorFromJson(json);
  Map<String, dynamic> toJson() => _$GetImagesErrorToJson(this);
}

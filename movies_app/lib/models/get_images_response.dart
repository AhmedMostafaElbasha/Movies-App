import 'package:json_annotation/json_annotation.dart';
import '../models/models.dart';

part 'get_images_response.g.dart';

@JsonSerializable()
class GetImagesResponse {
  final int id;
  final List<BackDrop> backdrops;
  final List<Poster> posters;

  GetImagesResponse({
    this.id,
    this.backdrops,
    this.posters,
  });

  factory GetImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImagesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetImagesResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import '../models/models.dart';

part 'get_credits_response.g.dart';

@JsonSerializable()
class GetCreditsResponse {
  final int id;
  final List<Cast> cast;
  final List<Crew> crew;

  GetCreditsResponse({
    this.id,
    this.cast,
    this.crew,
  });

  factory GetCreditsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCreditsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetCreditsResponseToJson(this);
}

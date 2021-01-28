import 'package:json_annotation/json_annotation.dart';

part 'production_company.g.json';

@JsonSerializable()
class ProductionCompany {
  int id;
  String name;
  @JsonKey(name: 'logo_path')
  String logoPath;
  @JsonKey(name: 'origin_country')
  String originCountry;

  ProductionCompany({
    this.id,
    this.name,
    this.logoPath,
    this.originCountry,
  });
}

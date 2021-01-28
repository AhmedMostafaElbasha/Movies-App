import 'package:json_annotation/json_annotation.dart';

part 'movie_item.g.dart';

@JsonSerializable()
class MovieItem {
  int id;
  String title;
  int runtime;
  @JsonKey(name: 'vote_average')
  num voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> productionCompanies;
  List<Genre> genres;

  MovieItem({
    this.id,
    this.title,
    this.runtime,
    this.voteAverage,
    this.voteCount,
    this.posterPath,
    this.releaseDate,
    this.productionCompanies,
    this.genres,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) => _$MovieItemFromJson(json);

  Map<String, dynamic> toJson() => _MovieItemToJson(this);
}

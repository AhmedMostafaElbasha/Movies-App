import 'package:json_annotation/json_annotation.dart';
import '../models/models.dart';

part 'movie_item.g.dart';

@JsonSerializable()
class MovieItem {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  Object belongsToCollection;
  int budget;
  @JsonKey(name: 'homepage')
  String homePage;
  int id;
  @JsonKey(name: 'imdb_id')
  String imdbId;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  num popularity;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry> productionCountries;
  int revenue;
  String title;
  int runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  bool video;
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
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.homePage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.status,
    this.tagline,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.posterPath,
    this.releaseDate,
    this.productionCompanies,
    this.genres,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) =>
      _$MovieItemFromJson(json);

  Map<String, dynamic> toJson() => _$MovieItemToJson(this);
}

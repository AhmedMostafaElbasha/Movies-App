import 'package:json_annotation/json_annotation.dart';
import '../models/models.dart';

part 'popular_movies_list.g.dart';

@JsonSerializable()
class PopularMoviesList {
  int page;
  List<PopularMovieItem> results;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;

  PopularMoviesList({
    this.page,
    this.results,
    this.totalResults,
    this.totalPages,
  });

  factory PopularMoviesList.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesListFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesListToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
import '../models/models.dart';

part 'recent_movies_list.g.dart';

@JsonSerializable()
class RecentMoviesList {
  int page;
  List<RecentMovieItem> results;
  Dates dates;
  @JsonKey(name: 'total_pages')
  int totalPages;
  @JsonKey(name: 'total_results')
  int totalResults;

  RecentMoviesList({
    this.page,
    this.results,
    this.dates,
    this.totalPages,
    this.totalResults,
  });

  factory RecentMoviesList.fromJson(Map<String, dynamic> json) =>
      _$RecentMoviesListFromJson(json);

  Map<String, dynamic> toJson() => _$RecentMoviesListToJson(this);
}

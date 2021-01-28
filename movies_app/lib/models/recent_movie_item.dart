import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_movie_item.g.dart';

@JsonSerializable()
class RecentMovieItem {
  int id;
  @JsonKey(name: 'poster_path')
  String posterPath;
  String title;

  RecentMovieItem({
    this.id,
    this.posterPath,
    this.title,
  });

  factory RecentMovieItem.fromJson(Map<String, dynamic> json) =>
      _$RecentMovieItemFromJson(json);

  Map<String, dynamic> toJson() => _$RecentMovieItemToJson(this);
}

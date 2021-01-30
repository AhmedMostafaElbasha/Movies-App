// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_movies_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentMoviesList _$RecentMoviesListFromJson(Map<String, dynamic> json) {
  return RecentMoviesList(
    page: json['page'] as int,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : RecentMovieItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dates: json['dates'] == null
        ? null
        : Dates.fromJson(json['dates'] as Map<String, dynamic>),
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
  );
}

Map<String, dynamic> _$RecentMoviesListToJson(RecentMoviesList instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'dates': instance.dates,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

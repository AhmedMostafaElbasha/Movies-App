// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesList _$PopularMoviesListFromJson(Map<String, dynamic> json) {
  return PopularMoviesList(
    page: json['page'] as int,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : PopularMovieItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    totalResults: json['total_results'] as int,
    totalPages: json['total_pages'] as int,
  );
}

Map<String, dynamic> _$PopularMoviesListToJson(PopularMoviesList instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
    };

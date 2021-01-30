// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieItem _$MovieItemFromJson(Map<String, dynamic> json) {
  return MovieItem(
    adult: json['adult'] as bool,
    backdropPath: json['backdrop_path'] as String,
    belongsToCollection: json['belongs_to_collection'],
    budget: json['budget'] as int,
    homePage: json['homepage'] as String,
    id: json['id'] as int,
    imdbId: json['imdb_id'] as String,
    originalLanguage: json['original_language'] as String,
    status: json['status'] as String,
    tagline: json['tagline'] as String,
    video: json['video'] as bool,
    voteAverage: json['vote_average'] as num,
    voteCount: json['vote_count'] as int,
    posterPath: json['poster_path'] as String,
    releaseDate: json['release_date'] as String,
    productionCompanies: (json['production_companies'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCompany.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    genres: (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..originalTitle = json['original_title'] as String
    ..overview = json['overview'] as String
    ..popularity = json['popularity'] as num
    ..productionCountries = (json['production_countries'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCountry.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..revenue = json['revenue'] as int
    ..title = json['title'] as String
    ..runtime = json['runtime'] as int
    ..spokenLanguages = (json['spoken_languages'] as List)
        ?.map((e) => e == null
            ? null
            : SpokenLanguage.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MovieItemToJson(MovieItem instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'budget': instance.budget,
      'homepage': instance.homePage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'production_countries': instance.productionCountries,
      'revenue': instance.revenue,
      'title': instance.title,
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLanguages,
      'status': instance.status,
      'tagline': instance.tagline,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'production_companies': instance.productionCompanies,
      'genres': instance.genres,
    };

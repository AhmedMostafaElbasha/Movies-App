import 'package:equatable/equatable.dart';

abstract class MovieImagesEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MovieImageFetched extends MovieImagesEvent {
  final int movieId;

  MovieImageFetched({this.movieId});

  @override
  // TODO: implement props
  List<Object> get props => [this.movieId];
}

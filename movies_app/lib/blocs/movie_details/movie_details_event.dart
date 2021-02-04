import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieItemPressed extends MovieDetailsEvent {
  final int movieId;

  MovieItemPressed(this.movieId);

  @override
  List<Object> get props => [];
}

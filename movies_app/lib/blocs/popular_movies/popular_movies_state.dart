import 'package:equatable/equatable.dart';
import '../../models/models.dart';

abstract class PopularMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoadInProgress extends PopularMoviesState {}

class PopularMoviesLoadSuccess extends PopularMoviesState {
  final List<PopularMovieItem> popularMovies;

  PopularMoviesLoadSuccess(this.popularMovies);

  @override
  List<Object> get props => [this.popularMovies];
}

class PopularMoviesLoadFailure extends PopularMoviesState {
  final String error;

  PopularMoviesLoadFailure(this.error);

  @override
  List<Object> get props => [this.error];
}

import 'package:equatable/equatable.dart';
import '../../models/models.dart';

abstract class RecentMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class RecentMoviesInitial extends RecentMoviesState {}

class RecentMoviesLoadInProgress extends RecentMoviesState {}

class RecentMoviesLoadSuccess extends RecentMoviesState {
  final List<RecentMovieItem> recentMovies;

  RecentMoviesLoadSuccess(this.recentMovies);

  @override
  List<Object> get props => [this.recentMovies];
}

class RecentMoviesLoadFailure extends RecentMoviesState {
  final String error;

  RecentMoviesLoadFailure(this.error);

  @override
  List<Object> get props => [this.error];
}

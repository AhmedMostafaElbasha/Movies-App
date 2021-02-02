import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../models/models.dart';

abstract class MovieDetailsState extends Equatable {
  MovieDetailsState();

  @override
  List<Object> get props => [];
}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoadInProgress extends MovieDetailsState {}

class MovieDetailsLoadSuccess extends MovieDetailsState {
  final MovieItem movieItem;

  MovieDetailsLoadSuccess({@required this.movieItem});

  @override
  List<Object> get props => [this.movieItem];
}

class MovieDetailsLoadFailure extends MovieDetailsState {
  final String error;

  MovieDetailsLoadFailure({@required this.error});

  @override
  List<Object> get props => [this.error];
}

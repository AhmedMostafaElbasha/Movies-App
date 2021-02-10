import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../models/models.dart';

abstract class MovieCreditsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieCreditFetched extends MovieCreditsEvent {
  final int movieId;

  MovieCreditFetched({@required this.movieId});

  @override
  List<Object> get props => [this.movieId];
}

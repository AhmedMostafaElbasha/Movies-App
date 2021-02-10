import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../models/models.dart';

abstract class MovieCreditsState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieCreditsInitial extends MovieCreditsState {}

class MovieCreditsLoadInProgress extends MovieCreditsState {}

class MovieCreditsLoadSuccess extends MovieCreditsState {
  final GetCreditsResponse getCreditsResponse;

  MovieCreditsLoadSuccess({@required this.getCreditsResponse});

  @override
  // TODO: implement props
  List<Object> get props => [this.getCreditsResponse];
}

class MovieCreditsLoadFailure extends MovieCreditsState {
  final String error;

  MovieCreditsLoadFailure({@required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [this.error];
}

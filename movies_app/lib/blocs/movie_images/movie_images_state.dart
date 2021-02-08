import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../models/models.dart';

abstract class MovieImagesState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MovieImagesInitial extends MovieImagesState {}

class MovieImagesLoadInProgress extends MovieImagesState {}

class MovieImagesLoadSuccess extends MovieImagesState {
  final GetImagesResponse getImagesResponse;

  MovieImagesLoadSuccess({@required this.getImagesResponse});

  @override
  // TODO: implement props
  List<Object> get props => [this.getImagesResponse];
}

class MovieImagesLoadFailure extends MovieImagesState {
  final String error;

  MovieImagesLoadFailure({@required this.error});

  @override
  // TODO: implement props
  List<Object> get props => [this.error];
}

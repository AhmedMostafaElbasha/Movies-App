// Package Imports
import 'package:equatable/equatable.dart';

abstract class RecentMoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RecentMoviesFetched extends RecentMoviesEvent {}

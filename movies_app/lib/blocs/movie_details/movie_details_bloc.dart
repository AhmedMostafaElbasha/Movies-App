// Package Imports
import 'package:bloc/bloc.dart';
// Inner Imports
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../../utilities/utilities.dart';
import '../movie_details/movie_details.dart';

/*
MovieDetailsBloc:
This Bloc responsable for the state management of showing the details of movies.
*/
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  var movieDetailsRepository = MovieDetailsRepository();
  MovieItem movieItem;

  MovieDetailsBloc() : super(MovieDetailsInitial());

  @override
  Stream<MovieDetailsState> mapEventToState(MovieDetailsEvent event) async* {
    if (event is MovieItemPressed) {
      yield* _mapMovieItemPressedToState(event);
    }
  }

  Stream<MovieDetailsState> _mapMovieItemPressedToState(
      MovieItemPressed event) async* {
    yield MovieDetailsLoadInProgress();

    bool isConnected = await isInternetConnected();

    if (isConnected) {
      movieItem = await movieDetailsRepository.getMovieDetails(event.movieId);
      if (movieItem != null) {
        yield MovieDetailsLoadSuccess(movieItem: movieItem);
      } else {
        yield MovieDetailsLoadFailure(
            error:
                'There is no details available for this movie at current time.');
      }
    } else {
      yield MovieDetailsLoadFailure(
          error:
              'Your device is not connected to internet. please check your connection then try again later.');
    }
  }
}

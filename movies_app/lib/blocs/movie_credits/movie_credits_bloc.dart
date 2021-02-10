import 'package:bloc/bloc.dart';
import '../../models/models.dart';
import '../../models/models.dart';
import '../../repositories/movie_credits_repository.dart';
import '../../utilities/internet_connectivity.dart';
import '../../utilities/utilities.dart';
import '../../repositories/repositories.dart';
import '../blocs.dart';
import '../blocs.dart';
import '../blocs.dart';
import 'movie_credits.dart';
import 'movie_credits.dart';
import 'movie_credits.dart';
import 'movie_credits.dart';

class MovieCreditsBloc extends Bloc<MovieCreditsEvent, MovieCreditsState> {
  final _movieCreditsRepository = MovieCreditsRepository();
  GetCreditsResponse _getCreditsResponse;
  MovieCreditsBloc() : super(MovieCreditsInitial());

  @override
  Stream<MovieCreditsState> mapEventToState(MovieCreditsEvent event) async* {
    yield* _mapMovieCreditFetchedToState(event);
  }

  Stream<MovieCreditsState> _mapMovieCreditFetchedToState(
      MovieCreditFetched event) async* {
    yield MovieCreditsLoadInProgress();

    bool isConnected = await isInternetConnected();

    if (isConnected) {
      _getCreditsResponse =
          await _movieCreditsRepository.getMovieCredits(event.movieId);
      print(_getCreditsResponse.toJson());

      if (_getCreditsResponse != null) {
        yield MovieCreditsLoadSuccess(getCreditsResponse: _getCreditsResponse);
      } else {
        yield MovieCreditsLoadFailure(
          error:
              'There are no credits available for this movie at current time.',
        );
      }
    } else {
      yield MovieCreditsLoadFailure(
        error:
            'Your device is not connected to internet. please check your connection then try again later.',
      );
    }
  }
}

import 'package:bloc/bloc.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../../utilities/utilities.dart';
import './popular_movies.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final _popularMoviesRepository = PopularMoviesRepository();
  List<PopularMovieItem> popularMovies;

  PopularMoviesBloc() : super(PopularMoviesInitial());

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {
    if (event is PopularMoviesFetched) {
      yield* _mapPopularMoviesFetchedToState(event);
    }
  }

  Stream<PopularMoviesState> _mapPopularMoviesFetchedToState(
      PopularMoviesFetched event) async* {
    yield PopularMoviesLoadInProgress();
    bool isConnected = await isInternetConnected();

    if (isConnected) {
      popularMovies = await _popularMoviesRepository.getPopularMovies();
      if (popularMovies != null) {
        yield PopularMoviesLoadSuccess(popularMovies);
      } else {
        yield PopularMoviesLoadFailure(
            'There are no movies available at the current time.');
      }
    } else {
      yield PopularMoviesLoadFailure(
          'Your device is not connected to internet. please check your connection then try again later.');
    }
  }
}

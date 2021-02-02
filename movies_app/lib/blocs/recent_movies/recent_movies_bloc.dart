import 'package:bloc/bloc.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';
import '../../utilities/utilities.dart';
import './recent_movies.dart';

class RecentMoviesBloc extends Bloc<RecentMoviesEvent, RecentMoviesState> {
  final recentMoviesRepository = RecentMoviesRepository();
  List<RecentMovieItem> recentMovies;

  RecentMoviesBloc() : super(RecentMoviesInitial());

  @override
  Stream<RecentMoviesState> mapEventToState(RecentMoviesEvent event) async* {
    if (event is RecentMoviesFetched) {
      yield* _mapRecentMoviesFetchedToState(event);
    }
  }

  Stream<RecentMoviesState> _mapRecentMoviesFetchedToState(
      RecentMoviesFetched event) async* {
    yield RecentMoviesLoadInProgress();
    bool isConnected = await isInternetConnected();

    if (isConnected) {
      recentMovies = await recentMoviesRepository.getRecentMovies();
      if (recentMovies != null) {
        yield RecentMoviesLoadSuccess(recentMovies);
      } else {
        yield RecentMoviesLoadFailure(
            'There are no movies available at the current time.');
      }
    } else {
      yield RecentMoviesLoadFailure(
          'Your device is not connected to internet. please check your connection then try again later.');
    }
  }
}

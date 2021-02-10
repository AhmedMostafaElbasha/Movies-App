import 'package:bloc/bloc.dart';
import '../../models/models.dart';
import '../../utilities/utilities.dart';
import '../../repositories/repositories.dart';
import '../movie_images/movie_images.dart';

class MovieImagesBloc extends Bloc<MovieImagesEvent, MovieImagesState> {
  var _movieImagesRepository = MovieImagesRepository();
  GetImagesResponse _getImagesResponse;

  MovieImagesBloc() : super(MovieImagesInitial());

  @override
  Stream<MovieImagesState> mapEventToState(MovieImagesEvent event) async* {
    yield* _mapMovieImageFetchedToState(event);
  }

  Stream<MovieImagesState> _mapMovieImageFetchedToState(
      MovieImageFetched event) async* {
    yield MovieImagesLoadInProgress();

    bool isConnected = await isInternetConnected();

    if (isConnected) {
      print(event.movieId);
      _getImagesResponse =
          await _movieImagesRepository.getMovieImages(event.movieId);

      if (_getImagesResponse != null) {
        yield MovieImagesLoadSuccess(getImagesResponse: _getImagesResponse);
      } else {
        yield MovieImagesLoadFailure(
          error:
              'There is no screenshots available for this movie at current time.',
        );
      }
    } else {
      yield MovieImagesLoadFailure(
        error:
            'Your device is not connected to internet. please check your connection then try again later.',
      );
    }
  }
}

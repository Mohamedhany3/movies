import 'package:movie/features/main_layout/data/models/MoviesResponse.dart';

abstract class MoviesRemoteDataSources {
  Future<MoviesResponse> getMovies();
}

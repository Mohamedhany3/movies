import 'package:movie/features/main_layout/data/models/MoviesResponse.dart';

abstract class MoviesRepositories {
  Future<MoviesResponse> getMovies();
}

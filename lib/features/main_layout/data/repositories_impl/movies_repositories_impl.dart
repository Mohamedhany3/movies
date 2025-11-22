import 'package:movie/features/main_layout/data/data_sources/remote/movies_remote_data_sources.dart';
import 'package:movie/features/main_layout/data/models/MoviesResponse.dart';
import 'package:movie/features/main_layout/repositories/movies_repositories.dart';

class MoviesRepositoriesImpl implements MoviesRepositories {
  MoviesRemoteDataSources moviesApiRemoteDataSources;

  MoviesRepositoriesImpl({required this.moviesApiRemoteDataSources});
  @override
  Future<MoviesResponse> getMovies() {
    return moviesApiRemoteDataSources.getMovies();
  }
}

import 'package:dio/dio.dart';
import 'package:movie/core/recources/costants_manager.dart';
import 'package:movie/features/main_layout/data/data_sources/remote/movies_remote_data_sources.dart';
import 'package:movie/features/main_layout/data/models/MoviesResponse.dart';

class MoviesAPIRemoteDataSources implements MoviesRemoteDataSources {
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.moviesBaseUrl));

  @override
  Future<MoviesResponse> getMovies() async {
    final response = await dio.get(ApiConstants.moviesEndPoint);
    return MoviesResponse.fromJson(response.data);
  }
}

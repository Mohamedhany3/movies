import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/main_layout/data/models/Movies.dart';
import 'package:movie/features/main_layout/repositories/movies_repositories.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.moviesRepositories}) : super(InitialState());

  MoviesRepositories moviesRepositories;

  Future<void> getMovies() async {
    try {
      emit(MoviesLoading());
      var response = await moviesRepositories.getMovies();
      emit(MoviesSuccess(movies: response.movie!.movies));
    } catch (exception) {
      emit(MoviesError(message: exception.toString()));
    }
  }
}

abstract class HomeState {}

class InitialState extends HomeState {}

class MoviesLoading extends HomeState {}

class MoviesError extends HomeState {
  String message;
  MoviesError({required this.message});
}

class MoviesSuccess extends HomeState {
  List<Movies> movies;
  MoviesSuccess({required this.movies});
}

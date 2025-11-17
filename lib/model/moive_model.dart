import 'package:movie/core/recources/assets_manager/assets_manager.dart';

class MovieModel {
  final String image;
  final String rate;

  MovieModel({required this.image, required this.rate});

  static final List<MovieModel> detalisMovie = [
    MovieModel(image: ImageAssets.movie1, rate: '2.6'),
    MovieModel(image: ImageAssets.movie2, rate: '3.7'),
    MovieModel(image: ImageAssets.movie3, rate: '5.5'),
    MovieModel(image: ImageAssets.movie4, rate: '7.4'),
    MovieModel(image: ImageAssets.movie2, rate: '9.9'),
    MovieModel(image: ImageAssets.movie1, rate: '10.0'),
    MovieModel(image: ImageAssets.background, rate: '4.8'),
  ];
}

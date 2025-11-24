import 'package:flutter/material.dart';
import 'package:movie/core/widgets/movie_item.dart';
import 'package:movie/model/moive_model.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({
    super.key,
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisExtent,
    required this.mainAxisSpacing,
    required this.imageWidth,
    required this.imageHeight,
    required this.movies,
  });
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double? mainAxisExtent;
  final double imageWidth;
  final double imageHeight;
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisExtent: mainAxisExtent,
      ),

      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieItem(
          heightImage: imageHeight,
          image: movie.image,
          rate: movie.rate,
          widthImage: imageWidth,
        );
      },
    );
  }
}

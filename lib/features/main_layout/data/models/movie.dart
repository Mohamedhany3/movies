import 'Movies.dart';

class Movie {
  Movie({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory Movie.fromJson(dynamic json) {
    return Movie(
      movieCount: json['movie_count'],
      limit: json['limit'],
      pageNumber: json['page_number'],
      movies: (json['movies'] as List<dynamic>)
          .map((movie) => Movies.fromJson(movie))
          .toList(),
    );
  }
  final int movieCount;
  final int limit;
  final int pageNumber;
  final List<Movies> movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['movie_count'] = movieCount;
    map['limit'] = limit;
    map['page_number'] = pageNumber;
    if (movies != null) {
      map['movies'] = movies.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

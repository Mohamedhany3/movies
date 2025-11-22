import 'movie.dart';

class MoviesResponse {
  MoviesResponse({
    required this.status,
    required this.statusMessage,
    required this.movie,
  });

  factory MoviesResponse.fromJson(dynamic json) {
    return MoviesResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      movie: json['data'] != null ? Movie.fromJson(json['data']) : null,
    );
  }

  final String? status;
  final String? statusMessage;
  final Movie? movie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (movie != null) {
      map['data'] = movie!.toJson();
    }
    return map;
  }
}

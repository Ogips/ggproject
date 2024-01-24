class Movie {
  String backdropPath;
  String title;
  String originalTitle;
  String overview;
  String posterPath;
  DateTime releaseDate;
  double voteAverage;
  int voteCount;

  Movie({
    required this.backdropPath,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      backdropPath: json['backdrop_path'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: DateTime.parse(json['release_date']),
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

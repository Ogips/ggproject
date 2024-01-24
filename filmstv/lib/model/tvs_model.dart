class Tvs {
  String? backdropPath;
  String name;
  String? originalName;
  String overview;
  String? posterPath;
  DateTime firstAirDate;
  double? voteAverage;
  int? voteCount;

  Tvs({
    required this.backdropPath,
    required this.name,
    required this.originalName,
    required this.overview,
    required this.posterPath,
    required this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Tvs.fromJson(Map<String, dynamic> json) {
    return Tvs(
      backdropPath: json['backdrop_path'],
      name: json['name'],
      originalName: json['original_name'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      firstAirDate: DateTime.parse(json['first_air_date']),
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

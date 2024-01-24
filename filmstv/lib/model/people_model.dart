class Person {
  String name;
  String originalName;
  String profilePath;
  // List<KnownFor> knownFor;

  Person({
    required this.name,
    required this.originalName,
    required this.profilePath,
    // required this.knownFor,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      originalName: json['original_name'],
      profilePath: json['profile_path'],
      // knownFor: List<KnownFor>.from(
      //     json['known_for'].map((knowfor) => KnownFor.fromJson(knowfor))),
    );
  }
}

class KnownFor {
  String? backdropPath;
  String? title;
  String? originalTitle;
  String overview;
  String posterPath;
  DateTime? releaseDate;
  double voteAverage;
  int voteCount;
  String? name;
  String? originalName;
  DateTime? firstAirDate;

  KnownFor({
    required this.backdropPath,
    this.title,
    this.originalTitle,
    required this.overview,
    required this.posterPath,
    this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    this.name,
    this.originalName,
    this.firstAirDate,
  });

  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return KnownFor(
      backdropPath: json['backdrop_path'],
      title: json['title'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      releaseDate: DateTime.parse(json['release_date']),
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
      name: json['name'],
      originalName: json['original_name'],
      firstAirDate: DateTime.parse(json['first_air_date']), 
      overview: json['overview'],
    );
  }
}

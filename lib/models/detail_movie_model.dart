class DetailMovie {
  bool adult;
  String backdropPath;
  String homePage;
  int id;
  String originalTitle;
  String overview;
  String popularity;
  String posterPath;
  int voteCount;
  String relaseDate;
  String genres;

  DetailMovie({
    required this.adult,
    required this.backdropPath,
    required this.homePage,
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.voteCount,
    required this.relaseDate,
    required this.genres,
  });

  factory DetailMovie.fromJson(Map<String, dynamic> json) {
    var genres = '';

    json['genres'].forEach((i) {
      genres += i['name'] + ', ';
    });

    return DetailMovie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? "",
      homePage: json['homepage'] ?? "",
      id: json['id'] ?? 0,
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'].toString(),
      posterPath:
          "https://www.themoviedb.org/t/p/original" + json['poster_path'],
      voteCount: json['vote_count'],
      relaseDate: json['release_date'],
      genres: genres,
    );
  }
}

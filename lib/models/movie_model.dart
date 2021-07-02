class MovieModel {
  bool adult;
  String backdropPath;
  int id;
  String title;
  String rating;
  int voteCount;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    required this.title,
    required this.id,
    required this.rating,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath:
          "https://www.themoviedb.org/t/p/original" + json['poster_path'],
      title: json['title'],
      id: json['id'],
      rating: json['vote_average'].toString(),
      voteCount: json['vote_count'],
    );
  }

  String toString() {
    return '{id: ${this.id} ,adult: ${this.adult} ,backdropPath: ${this.backdropPath}, title: ${this.title}, id: ${this.id}, rating: ${this.rating}, voteCount: ${this.voteCount}}';
  }
}

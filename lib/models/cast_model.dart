class CastModel {
  bool adult;
  int gender;
  int id;
  String name;
  String originalName;
  String popularity;
  String profilePath;
  String character;
  String creditId;

  CastModel({
    required this.adult,
    required this.gender,
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.character,
    required this.creditId,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      adult: json['adult'],
      id: json['id'],
      name: json['name'],
      originalName: json['original_name'],
      character: json['character'],
      creditId: json['credit_id'],
      profilePath: json['profile_path'] != null
          ? 'https://www.themoviedb.org/t/p/original${json['profile_path']}'
          : "",
      popularity: json['popularity'].toString(),
      gender: json['gender'],
    );
  }
}

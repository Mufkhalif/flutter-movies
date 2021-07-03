class DetailCastModel {
  bool adult;
  String biography;
  String birthday;
  int gender;
  int id;
  String name;
  String placeBirth;
  String popularity;
  String profilePath;
  String type;

  DetailCastModel({
    required this.adult,
    required this.biography,
    required this.birthday,
    required this.gender,
    required this.id,
    required this.name,
    required this.placeBirth,
    required this.popularity,
    required this.profilePath,
    required this.type,
  });

  factory DetailCastModel.fromJson(Map<String, dynamic> json) {
    return DetailCastModel(
      adult: json['adult'],
      biography: json['biography'],
      birthday: json['birthday'],
      gender: json['gender'],
      id: json['id'],
      name: json['name'],
      placeBirth: json['place_of_birth'],
      popularity: json['popularity'].toString(),
      profilePath: json['profile_path'] != null
          ? 'https://www.themoviedb.org/t/p/original${json['profile_path']}'
          : "",
      type: json['known_for_department'],
    );
  }
}

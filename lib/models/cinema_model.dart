class CinemaModel {
  int id;
  String name;
  String imgUrl;
  String address;

  CinemaModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.address,
  });

  factory CinemaModel.fromJson(Map<String, dynamic> json) {
    return CinemaModel(
      id: json['id'],
      name: json['name'],
      imgUrl: json['imgUrl'],
      address: json['address'],
    );
  }

  String toString() {
    return '{id: ${this.id} ,name: ${this.name} ,imgUrl: ${this.imgUrl}, address: ${this.address}}';
  }
}

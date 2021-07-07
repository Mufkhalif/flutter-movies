class RowModel {
  int id;
  String type;

  RowModel({required this.id, required this.type});

  factory RowModel.fromJson(Map<String, dynamic> json) {
    return RowModel(
      id: json['id'],
      type: json['type'],
    );
  }

  @override
  String toString() {
    return '{id: ${this.id}, type: ${this.type}}';
  }
}

class SeatModel {
  String row;
  List<RowModel> count;

  SeatModel({required this.row, required this.count});

  factory SeatModel.fromJson(Map<String, dynamic> json) {
    List<RowModel> count = [];

    json['count'].forEach((i) {
      count.add(RowModel.fromJson(i));
    });

    return SeatModel(
      row: json['row'],
      count: count,
    );
  }

  @override
  String toString() {
    return '{row: ${this.row}, count: ${this.count}}';
  }
}

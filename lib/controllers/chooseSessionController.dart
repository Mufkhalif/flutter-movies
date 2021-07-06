import 'package:food_app/models/cinema_model.dart';
import 'package:food_app/models/data.dart';
import 'package:get/get.dart';

var dummyList = [
  {
    "row": "A",
    "count": [
      {"id": 1, "type": "available"},
      {"id": 2, "type": "available"},
      {"id": 3, "type": "available"},
      {"id": 4, "type": "available"},
      {"id": 5, "type": "available"},
      {"id": 6, "type": "available"},
    ]
  },
  {
    "row": "B",
    "count": [
      {"id": 1, "type": "available"},
      {"id": 2, "type": "available"},
      {"id": 3, "type": "available"},
      {"id": 4, "type": "available"},
      {"id": 5, "type": "available"},
      {"id": 6, "type": "available"},
      {"id": 7, "type": "available"},
      {"id": 8, "type": "available"},
    ]
  },
  {
    "row": "C",
    "count": [
      {"id": 1, "type": "selected"},
      {"id": 2, "type": "booked"},
      {"id": 3, "type": "available"},
      {"id": 4, "type": "available"},
      {"id": 5, "type": "available"},
      {"id": 6, "type": "available"},
      {"id": 7, "type": "available"},
      {"id": 8, "type": "available"},
    ]
  },
];

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

class ChooseController extends GetxController {
  var isOpenListCinema = false.obs;
  var selected = 1.obs;
  List<CinemaModel> listCinema = [];
  List<SeatModel> listSeats = [];

  @override
  void onInit() {
    listCinema = dummyCinema.map((e) => CinemaModel.fromJson(e)).toList();
    listSeats = dummyList.map((e) => SeatModel.fromJson(e)).toList();
    super.onInit();
  }

  void updateOpenCinema() {
    isOpenListCinema.value = !isOpenListCinema.value;
    update();
  }

  void updateSelected(int value) {
    selected.value = value;
    update();
  }

  void updateSelectedSeat(int indexRow, int indexCount) {
    var now = listSeats[indexRow].count[indexCount];
    now.type = listSeats[indexRow].count[indexCount].type == "selected"
        ? "available"
        : "selected";
    update();
  }
}

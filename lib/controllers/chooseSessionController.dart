import 'package:food_app/models/cinema_model.dart';
import 'package:food_app/models/data.dart';
import 'package:food_app/models/seat_model.dart';
import 'package:get/get.dart';

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

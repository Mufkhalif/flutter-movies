import 'package:get/get.dart';

class BottomController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTappedBottom(int index) {
    selectedIndex.value = index;
  }
}

class HomeTabController extends GetxController {
  var selectedIndex = 0.obs;

  void onItemTappedBottom(int index) {
    selectedIndex.value = index;
  }
}

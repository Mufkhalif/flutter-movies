import 'package:flutter/material.dart';
import 'package:food_app/pages/chose_session_pages.dart';
import 'package:food_app/pages/select_seat_pages.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomeMovie(),
        // home: ChoseSessionPage(),
        home: SelectSeatPages());
  }
}

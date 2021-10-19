import 'package:flutter/material.dart';
import 'package:food_app/pages/home_movie.dart';
import 'package:get/route_manager.dart';

// add comment

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeMovie(),
    );
  }
}

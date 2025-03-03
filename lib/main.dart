import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracking/Screens/map_screen.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapScreen(),
    );
  }
}
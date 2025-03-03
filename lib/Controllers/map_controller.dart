import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapController extends GetxController {
  
  var pathPoints = <LatLng>[].obs; // Stores vehicle path points
  var closestStore = LatLng(0, 0).obs; // Stores closest store location
  var totalDistance = 0.0.obs; // Total distance traveled
  var maxSpeed = 0.0.obs; // Maximum speed recorded

  @override
  void onInit() {
    super.onInit();
    loadPathData();
  }

  // Load vehicle path data from JSON file
  Future<void> loadPathData() async {
    String data = await rootBundle.loadString('assets/PathTravelled.json');
    List<dynamic> jsonList = json.decode(data);
    pathPoints.value = jsonList.map((point) => LatLng(point['latitude'], point['longitude'])).toList();
    calculateMetrics(jsonList);
  }

  // Calculate total distance and highest speed
  void calculateMetrics(List<dynamic> jsonList) {
    double totalDist = 0.0;
    double highestSpeed = 0.0;

    for (int i = 0; i < jsonList.length - 1; i++) {
      totalDist += Geolocator.distanceBetween(
        jsonList[i]['latitude'],
        jsonList[i]['longitude'],
        jsonList[i + 1]['latitude'],
        jsonList[i + 1]['longitude'],
      );
      highestSpeed = jsonList[i]['speed'] > highestSpeed ? jsonList[i]['speed'] : highestSpeed;
    }

    totalDistance.value = totalDist / 1000; // Convert to km
    maxSpeed.value = highestSpeed;
  }
}
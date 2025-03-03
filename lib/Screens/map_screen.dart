import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../Controllers/map_controller.dart';


class MapScreen extends StatelessWidget {
  final MapController controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vehicle Path Visualization')),
      body: Obx(
        () => Stack(
          children: [
            // Mapbox map displaying vehicle path
            MapboxMap(
              accessToken: 'pk.eyJ1IjoiemFybm8tYnVzaDQwIiwiYSI6ImNtN2s1c3JpbjBkb2IyanNldXphcTNzejEifQ.xMXOMtt_X1GMKAhx0ASNBg',
              initialCameraPosition: CameraPosition(
                target: controller.pathPoints.isNotEmpty ? controller.pathPoints.first : LatLng(0, 0), 
                zoom: 14,
              ),
              onMapCreated: (MapboxMapController mapController) {
                mapController.addLine(
                  LineOptions(
                    geometry: controller.pathPoints,
                    lineColor: '#FF5733',
                    lineWidth: 4.0,
                  ),
                );
              },
            ),
            // Display metrics of total distance & max speed
            Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                children: [
                  Text('Total Distance: ${controller.totalDistance.value.toStringAsFixed(2)} km'),
                  Text('Max Speed: ${controller.maxSpeed.value.toStringAsFixed(2)} km/h'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

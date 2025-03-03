import 'package:flutter/material.dart';
import 'package:vehicle_tracking/ResponsiveLayout/constants.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myDefaultAppBar,
      backgroundColor: myDefaultBackground,
      drawer: myDrawer,
      body: Center(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16/9,
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  color: Colors.blue,
                  child: Center(child: Text('Tablet Map')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
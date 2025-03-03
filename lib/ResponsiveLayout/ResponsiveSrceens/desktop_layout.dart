import 'package:flutter/material.dart';
import 'package:vehicle_tracking/ResponsiveLayout/constants.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myDefaultAppBar,
      backgroundColor: myDefaultBackground,
      body: Row(
        children: [
          // Open Drawer
          myDrawer,
          Center(
        child: Expanded(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16/9,
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    color: Colors.blue,
                    child: Center(child: Text('Desktop Map')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
        ],
      ),
    );
  }
}
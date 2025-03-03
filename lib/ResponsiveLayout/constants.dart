import 'package:flutter/material.dart';

var myDefaultBackground = Colors.grey[300];
var myDefaultTextColor = Colors.black;
var myDefaultIconColor = Colors.black;
var myDefaultAppBar = AppBar(
  title: Text('Vehicle Tracker Demo'),
);
var myDrawer = Drawer(
  child: Builder(
    builder: (context) => Column(
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        ListTile(
          leading: Icon(Icons.car_rental),
          title: Text('Vehicle'),
          onTap: () {
            Navigator.pushNamed(context, '/vehicle');
          },
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            Navigator.pushNamed(context, '/vehicle');
          },
        ),
      ],
    ),
  ),
);
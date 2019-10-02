import 'package:escooters/src/map_screen.dart';
import 'package:flutter/material.dart';

class ScooterApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electronic Scooter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MapScreen(),
    );
  }
}

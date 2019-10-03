import 'package:escooters/src/ui/map_screen.dart';
import 'package:flutter/material.dart';

class ScooterApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electronic Scooter App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      home: MapScreen(),
    );
  }
}

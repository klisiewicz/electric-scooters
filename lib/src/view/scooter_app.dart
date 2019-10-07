import 'package:escooters/src/view/map/scooter_map_screen.dart';
import 'package:flutter/material.dart';

class ScooterApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electronic Scooter App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.green,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Colors.white,
          actionTextColor: Colors.green,
          contentTextStyle: TextStyle(
            color: Colors.black,
          ),
        )
      ),
      home: ScooterMapScreen(),
    );
  }
}

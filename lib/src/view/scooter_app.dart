import 'package:escooters/src/view/map/scooter_map_screen.dart';
import 'package:flutter/material.dart';

class ScooterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electronic Scooter App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.green,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Colors.white,
          actionTextColor: Colors.green,
          contentTextStyle: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      home: const ScooterMapScreen(),
    );
  }
}

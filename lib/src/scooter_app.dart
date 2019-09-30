import 'package:flutter/material.dart';

class ScooterApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electronic Scooter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('E-scooters'),),
      ),
    );
  }
}

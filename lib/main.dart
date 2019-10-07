import 'package:escooters/src/di/injector.dart';
import 'package:escooters/src/view/scooter_app.dart';
import 'package:flutter/material.dart';

void main() {
  injectDependencies();
  runApp(ScooterApp());
}

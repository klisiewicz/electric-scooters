import 'package:flutter/material.dart';

Widget makeTestableWidget({
  required Widget child,
}) {
  return MaterialApp(home: Material(child: child));
}

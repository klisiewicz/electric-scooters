import 'dart:convert';

import 'package:escooters/src/domain/scooter.dart';
import 'package:escooters/src/domain/scooter_marker.dart';

class ScooterConverter extends Converter<Map<String, dynamic>, ScooterMarker> {
  @override
  ScooterMarker convert(Map<String, dynamic> input) {
    final scooter = Scooter.fromJson(input);
    return ScooterMarker.from(scooter);
  }
}

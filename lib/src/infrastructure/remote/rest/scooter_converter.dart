import 'dart:convert';

import 'package:escooters/src/domain/scooter.dart';

class ScooterConverter extends Converter<Map<String, dynamic>, Scooter> {
  @override
  Scooter convert(Map<String, dynamic> input) {
    return Scooter.fromJson(input);
  }
}

import 'dart:convert';

import 'package:escooters/src/domain/location.dart';
import 'package:escooters/src/domain/scooter.dart';
import 'package:intl/intl.dart';

class ScooterConverter extends Converter<Map<String, dynamic>, Scooter> {
  final DateFormat _dateFormat = DateFormat.yMd().add_jm();

  @override
  Scooter convert(Map<String, dynamic> input) {
    final id = input['id'] as int;
    final name = input['name'] as String;
    final description = input['description'] as String;
    final latitude = (input['latitude'] as num).toDouble();
    final longitude = (input['longitude'] as num).toDouble();
    final batteryLevel = input['batteryLevel'] as int;
    final timestamp = input['timestamp'] as String;
    final price = input['price'] as int;
    final priceTime = input['priceTime'] as int;
    final currency = input['currency'] as String;
    return Scooter(
      id: '$id',
      name: '${int.parse(name, radix: 2).toRadixString(10)}. $description',
      location: Location(latitude: latitude, longitude: longitude),
      battery: batteryLevel.toBattery(),
      price: '$price $currency / $priceTime min',
      timeStamp: _dateFormat.format(DateTime.parse(timestamp)),
    );
  }
}

extension on int {
  Battery toBattery() {
    if (this >= 80) {
      return Battery.high;
    } else if (this >= 40) {
      return Battery.medium;
    } else if (this >= 10) {
      return Battery.low;
    } else {
      return Battery.empty;
    }
  }
}

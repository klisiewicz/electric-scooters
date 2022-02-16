import 'package:equatable/equatable.dart';
import 'package:escooters/src/data/scooter.dart';
import 'package:escooters/src/domain/location/location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

@immutable
class ScooterMarker extends Equatable {
  final String id;
  final String name;
  final Location location;
  final String price;
  final Battery battery;
  final String timeStamp;

  const ScooterMarker({
    required this.id,
    required this.name,
    required this.location,
    required this.battery,
    this.price = '',
    this.timeStamp = '',
  });

  factory ScooterMarker.from(Scooter scooter) {
    return ScooterMarker(
      id: scooter.id.toString(),
      name:
          '${int.parse(scooter.name, radix: 2).toRadixString(10)}. ${scooter.description}',
      location: Location(
        latitude: scooter.latitude,
        longitude: scooter.longitude,
      ),
      price: '${scooter.price} ${scooter.currency} / ${scooter.priceTime} min',
      battery: Battery(scooter.batteryLevel),
      timeStamp: DateFormat.yMd().add_jm().format(
            DateTime.parse(scooter.timestamp),
          ),
    );
  }

  @override
  List<Object> get props => [id, name, location, price, battery];

  @override
  String toString() => 'ScooterMarker: $name $location, $price';
}

@immutable
class Battery extends Equatable {
  static const _high = 80;
  static const _medium = 50;
  static const _low = 20;

  final String level;
  final IconData icon;
  final Color color;

  factory Battery(int level) {
    return Battery._internal(
      level: '$level',
      icon: level._getIcon(),
      color: level._getColor(),
    );
  }

  const Battery._internal({
    required this.level,
    required this.icon,
    required this.color,
  });

  @override
  List<Object> get props => [level, icon, color];

  @override
  String toString() => 'Battery $level';
}

extension on int {
  Color _getColor() {
    if (this > Battery._high) {
      return Colors.green;
    } else if (this > Battery._medium) {
      return Colors.lightGreen;
    } else if (this > Battery._low) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  IconData _getIcon() {
    if (this > Battery._high) {
      return CupertinoIcons.battery_full;
    } else if (this > Battery._medium) {
      return CupertinoIcons.battery_75_percent;
    } else if (this > Battery._low) {
      return CupertinoIcons.battery_25_percent;
    } else {
      return CupertinoIcons.battery_empty;
    }
  }
}

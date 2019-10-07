import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:escooters/src/domain/location/location.dart';
import 'package:escooters/src/domain/scooter/scooter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

@immutable
class Locations extends Equatable {
  static const defaultLocation = const Location(
    latitude: 52.5077671,
    longitude: 13.4192038,
  );

  final Location camera;
  final Iterable<ScooterMarker> scooters;

  const Locations._internal({
    @required this.camera,
    this.scooters = const [],
  }) : assert(camera != null, 'Camera position must be defined.');

  const Locations.initial() : this._internal(camera: defaultLocation);

  Locations setScooters(Iterable<ScooterMarker> scooters) {
    return Locations._internal(
      camera: camera,
      scooters: UnmodifiableListView(scooters) ?? const [],
    );
  }

  @override
  List<Object> get props => [camera, scooters];

  @override
  String toString() => '$runtimeType camera: $camera, scooters: $scooters';
}

@immutable
class ScooterMarker extends Equatable {
  final String id;
  final String name;
  final Location location;
  final String price;
  final Battery battery;
  final String timeStamp;

  const ScooterMarker({
    @required this.id,
    @required this.name,
    @required this.location,
    @required this.battery,
    this.price = '',
    this.timeStamp = '',
  })  : assert(id != null),
        assert(name != null),
        assert(location != null),
        assert(battery != null);

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
  String toString() => '$runtimeType: $name $location';
}

@immutable
class Battery extends Equatable {
  static const high = 80;
  static const medium = 50;
  static const low = 20;

  final String level;
  final IconData icon;
  final Color color;

  const Battery._internal({
    this.level,
    this.icon,
    this.color,
  });

  factory Battery(int level) {
    return Battery._internal(
      level: '${level.toString()}',
      icon: _getIconFor(level),
      color: _getColorFor(level),
    );
  }

  @override
  List<Object> get props => [level, icon, color];

  @override
  String toString() => '$runtimeType $level';

  static IconData _getIconFor(int level) {
    if (level > high)
      return CupertinoIcons.battery_full;
    else if (level > medium)
      return CupertinoIcons.battery_75_percent;
    else if (level > low)
      return CupertinoIcons.battery_25_percent;
    else
      return CupertinoIcons.battery_empty;
  }

  static Color _getColorFor(int level) {
    if (level > high)
      return Colors.green;
    else if (level > medium)
      return Colors.lightGreen;
    else if (level > low)
      return Colors.yellow;
    else
      return Colors.red;
  }
}

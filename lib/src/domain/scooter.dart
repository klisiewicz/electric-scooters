import 'package:equatable/equatable.dart';
import 'package:escooters/src/domain/location.dart';
import 'package:meta/meta.dart';

@immutable
class Scooter extends Equatable {
  final String id;
  final String name;
  final Location location;
  final String price;
  final Battery battery;
  final String timeStamp;

  const Scooter({
    required this.id,
    required this.name,
    required this.location,
    required this.battery,
    this.price = '',
    this.timeStamp = '',
  });

  @override
  List<Object> get props => [id, name, location, price, battery];

  @override
  String toString() => 'ScooterMarker: $name $location, $price';
}

enum Battery { high, low, medium, empty }

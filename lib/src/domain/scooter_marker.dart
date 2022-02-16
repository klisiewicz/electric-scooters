import 'package:equatable/equatable.dart';
import 'package:escooters/src/domain/location.dart';
import 'package:escooters/src/domain/scooter.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

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
      battery: scooter.batteryLevel.toBattery(),
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

enum Battery { high, low, medium, empty }

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

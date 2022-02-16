import 'package:escooters/src/domain/location.dart';
import 'package:escooters/src/domain/scooter.dart';

const validScooter = Scooter(
  id: '1',
  name: '2. Electric Scooter',
  location: Location(latitude: 52, longitude: 13),
  battery: Battery.high,
  price: '15 € / 60 min',
  timeStamp: '3/10/2019 9:31 AM',
);

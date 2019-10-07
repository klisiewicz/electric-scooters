import 'package:escooters/src/domain/scooter/scooter.dart';

final validScooter = Scooter(
  id: 1,
  name: '0010',
  description: 'Electric Scooter',
  latitude: 52,
  longitude: 13,
  batteryLevel: 90,
  timestamp: '2019-03-10T09:31:56Z',
  price: 15,
  priceTime: 60,
  currency: '€',
);

final invalidScooter = Scooter(
  id: null,
  name: '-',
  description: '',
  latitude: 200,
  longitude: 400,
  batteryLevel: 150,
  timestamp: 'not-valid-timestamp',
  price: -100,
  priceTime: 0,
  currency: null,
);
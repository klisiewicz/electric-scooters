import 'dart:convert';

import 'package:escooters/src/data/scooter.dart';
import 'package:escooters/src/data/scooter_rest_service.dart';
import 'package:escooters/src/data/scooter_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('should parse a response when http code is 200', () async {
    // Given:
    final ScooterService scooterService = ScooterRestService(
      MockClient((request) async => _scooter200Response),
    );

    // When:
    final Iterable<Scooter> scooters = await scooterService.fetchAll();

    // Then:
    expect(scooters.isNotEmpty, true);
    expect(scooters.first, _someScooter);
  });

  test('should throw an exception when http code is not 200', () async {
    // Given:
    final ScooterService scooterService = ScooterRestService(
      MockClient((request) async => _scooter404Response),
    );

    // Then:
    expect(() => scooterService.fetchAll(), throwsException);
  });
}

final _scooter200Response = Response(
  json.encode([_someScooter.toJson()]),
  200,
);

final _scooter404Response = Response(json.encode({}), 404);

final _someScooter = Scooter(
  id: 1,
  name: '000011',
  description: 'Electric Scooter',
  latitude: 52.529077,
  longitude: 13.416351,
  batteryLevel: 98,
  timestamp: '2019-03-10T09:31:56Z',
  price: 15,
  priceTime: 60,
  currency: 'EUR',
);

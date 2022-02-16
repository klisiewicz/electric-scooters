import 'dart:convert';
import 'dart:io';

import 'package:escooters/src/domain/scooter.dart';
import 'package:escooters/src/domain/scooter_repository.dart';
import 'package:escooters/src/infrastructure/remote/rest/scooter_rest_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('should parse a response when http code is 200', () async {
    // Given:
    final ScooterRepository scooterRepository = ScooterRestRepository(
      MockClient((request) async => _scooter200Response),
    );

    // When:
    final scooters = await scooterRepository.getAll();

    // Then:
    expect(scooters, hasLength(1));
    final scooter = scooters.first;
    scooter
        .shouldHaveId('1')
        .shouldHaveName('2. Electric Scooter')
        .shouldBeLocatedAt(latitude: 52, longitude: 13)
        .shouldBePricedOf('15 € / 60 min')
        .shouldHaveBattery(Battery.high)
        .shouldHaveTimeStamp('3/10/2019 9:31 AM');
  });

  test('should throw an exception when http code is not 200', () async {
    // Given:
    final ScooterRepository scooterService = ScooterRestRepository(
      MockClient((request) async => _scooter404Response),
    );

    // Then:
    expect(scooterService.getAll, throwsException);
  });
}

final _scooter200Response = Response.bytes(
  utf8.encode(json.encode([_scooterJson])),
  200,
  headers: {
    HttpHeaders.contentTypeHeader: '${ContentType.json}',
  },
);

final _scooterJson = {
  'id': 1,
  'name': '0010',
  'description': 'Electric Scooter',
  'latitude': 52,
  'longitude': 13,
  'batteryLevel': 90,
  'timestamp': '2019-03-10T09:31:56Z',
  'price': 15,
  'priceTime': 60,
  'currency': '€',
};

final _scooter404Response = Response(
  json.encode({}),
  404,
  headers: {
    HttpHeaders.contentTypeHeader: '${ContentType.json}',
  },
);

extension on Scooter {
  Scooter shouldHaveId(String expected) {
    expect(id, equals(expected));
    return this;
  }

  Scooter shouldHaveName(String expected) {
    expect(name, equals(expected));
    return this;
  }

  Scooter shouldBeLocatedAt({
    required num latitude,
    required num longitude,
  }) {
    expect(location.latitude, equals(latitude));
    expect(location.longitude, equals(longitude));
    return this;
  }

  Scooter shouldBePricedOf(String expected) {
    expect(price, equals(expected));
    return this;
  }

  Scooter shouldHaveBattery(Battery expected) {
    expect(battery, equals(expected));
    return this;
  }

  Scooter shouldHaveTimeStamp(String expected) {
    expect(timeStamp, equals(expected));
    return this;
  }
}

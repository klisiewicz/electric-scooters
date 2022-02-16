import 'dart:convert';
import 'dart:io';

import 'package:escooters/src/domain/scooter_marker.dart';
import 'package:escooters/src/domain/scooter_repository.dart';
import 'package:escooters/src/infrastructure/remote/rest/scooter_rest_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

import '../../../domain/scooter_test_data.dart';

void main() {
  test('should parse a response when http code is 200', () async {
    // Given:
    final ScooterRepository scooterRepository = ScooterRestRepository(
      MockClient((request) async => _scooter200Response),
    );

    // When:
    final List<ScooterMarker> scooters = await scooterRepository.getAll();

    // Then:
    expect(scooters.isNotEmpty, true);
    expect(scooters.first, equals(ScooterMarker.from(validScooter)));
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
  headers: {HttpHeaders.contentTypeHeader: ContentType.json.value},
);

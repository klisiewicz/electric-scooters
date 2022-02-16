import 'dart:convert';
import 'dart:io';

import 'package:escooters/src/data/scooter.dart';
import 'package:escooters/src/domain/scooter/scooter_marker.dart';
import 'package:escooters/src/domain/scooter/scooter_repository.dart';
import 'package:http/http.dart';

class ScooterRestRepository implements ScooterRepository {
  static final _uri = Uri(
    scheme: 'http',
    host: 'my-json-server.typicode.com',
    path: 'FlashScooters/Challenge/vehicles',
  );

  final Client _client;

  ScooterRestRepository(this._client);

  @override
  Future<List<ScooterMarker>> getAll() async {
    final response = await _client.get(
      _uri,
      headers: {
        HttpHeaders.contentTypeHeader: '${ContentType.json}',
      },
    );
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load scooters');
    }
    final scootersJson = json.decode(response.body) as List<dynamic>;
    final scooters = scootersJson.map(
      (scooter) => Scooter.fromJson(scooter as Map<String, dynamic>),
    );
    return scooters.map((scooter) => ScooterMarker.from(scooter)).toList();
  }
}

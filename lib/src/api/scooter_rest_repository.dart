import 'dart:convert';
import 'dart:io';

import 'package:escooters/src/api/scooter.dart';
import 'package:escooters/src/domain/scooter/scooter_marker.dart';
import 'package:escooters/src/domain/scooter/scooter_repository.dart';
import 'package:http/http.dart';

class ScooterRestRepository implements ScooterRepository {
  static const _url =
      'http://my-json-server.typicode.com/FlashScooters/Challenge/vehicles';
  final Client _client;

  ScooterRestRepository(this._client) : assert(_client != null);

  @override
  Future<List<ScooterMarker>> getAll() async {
    final response = await _client.get(_url, headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.value,
    });

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load scooters');
    }

    final List<dynamic> scootersJson =
        json.decode(response.body) as List<dynamic>;
    final Iterable<Scooter> scooters = scootersJson
        .map((scooter) => Scooter.fromJson(scooter as Map<String, dynamic>));
    return scooters.map(_tryToCreateMarker).where(_markerIsNotNull).toList();
  }

  static ScooterMarker _tryToCreateMarker(Scooter scooter) {
    try {
      return ScooterMarker.from(scooter);
    } catch (_) {
      return null;
    }
  }

  static bool _markerIsNotNull(marker) => marker != null;
}

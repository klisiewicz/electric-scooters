import 'dart:convert';
import 'dart:io';

import 'package:escooters/src/domain/scooter_marker.dart';
import 'package:escooters/src/domain/scooter_repository.dart';
import 'package:escooters/src/infrastructure/remote/rest/scooter_converter.dart';
import 'package:http/http.dart';

class ScooterRestRepository implements ScooterRepository {
  static final _uri = Uri(
    scheme: 'http',
    host: 'my-json-server.typicode.com',
    path: 'FlashScooters/Challenge/vehicles',
  );

  final Client _client;
  final ScooterConverter _converter = ScooterConverter();

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
    final scooters = scootersJson
        .map((json) => _converter.convert(json as Map<String, dynamic>));
    return scooters.map((scooter) => ScooterMarker.from(scooter)).toList();
  }
}

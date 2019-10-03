import 'dart:convert';
import 'dart:io';

import 'package:escooters/src/data/scooter.dart';
import 'package:escooters/src/data/scooter_service.dart';
import 'package:http/http.dart';

class ScooterRestService implements ScooterService {
  static const _url =
      'http://my-json-server.typicode.com/FlashScooters/Challenge/vehicles';
  final Client _client;

  ScooterRestService(this._client) : assert(_client != null);

  @override
  Future<Iterable<Scooter>> fetchAll() async {
    final response = await _client.get(_url, headers: {
      HttpHeaders.contentTypeHeader: ContentType.json.value,
    });

    if (response.statusCode != HttpStatus.ok)
      throw Exception('Failed to load post');

    final List<dynamic> scootersJson = json.decode(response.body);
    return scootersJson.map((scooter) => Scooter.fromJson(scooter));
  }
}

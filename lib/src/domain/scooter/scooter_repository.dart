import 'package:escooters/src/domain/scooter/scooter.dart';

abstract class ScooterRepository {
  Future<Iterable<Scooter>> findAll();
}

class NoScootersException implements Exception {}
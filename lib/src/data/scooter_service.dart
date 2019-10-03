import 'package:escooters/src/data/scooter.dart';

abstract class ScooterService {
  Future<Iterable<Scooter>> fetchAll();
}

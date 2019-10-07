import 'package:flutter/foundation.dart';

@immutable
abstract class MapEvent {}

class LoadScooters extends MapEvent {
  @override
  String toString() => 'LoadScooters';
}

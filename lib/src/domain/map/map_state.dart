import 'package:equatable/equatable.dart';
import 'package:escooters/src/domain/location/locations.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class MapState extends Equatable {
  final Locations map;

  const MapState(this.map) : assert(map != null, 'Map must be defined.');

  @override
  List<Object> get props => [map];
}

class Busy extends MapState {
  const Busy([Locations map = const Locations.initial()]) : super(map);

  @override
  String toString() => 'Busy: $map';
}

@immutable
class Ready extends MapState {
  const Ready([Locations map = const Locations.initial()]) : super(map);

  @override
  String toString() => 'Ready: $map';
}

@immutable
class Error extends MapState {
  final dynamic error;

  const Error(this.error, [Locations map = const Locations.initial()])
      : assert(error != null, 'Error must be defined'),
        super(map);

  @override
  List<Object> get props => [map];

  @override
  String toString() => 'Error: $map';
}

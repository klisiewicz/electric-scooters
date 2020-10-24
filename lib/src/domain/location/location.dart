import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Location extends Equatable {
  final double latitude;
  final double longitude;

  const Location({
    @required this.latitude,
    @required this.longitude,
  })  : assert(latitude != null && latitude >= -90 && latitude <= 90,
            'Latitude is must be in an interval from -90.0 to +90.0'),
        assert(longitude != null && longitude >= -180 && latitude <= 180,
            'Longitude is must be in an interval from -180.0 to +180.0');

  @override
  List<Object> get props => [latitude, longitude];

  @override
  String toString() => 'Location($latitude, $longitude)';
}

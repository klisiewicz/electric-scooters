import 'package:escooters/src/domain/location/locations.dart';
import 'package:escooters/src/domain/scooter/scooter_repository.dart';
import 'package:flutter_bloc_patterns/base_list.dart';

class MapBloc extends ListBloc<ScooterMarker> {
  MapBloc(ScooterRepository repository) : super(repository);
}
